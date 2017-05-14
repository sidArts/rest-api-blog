var path = require("path");
var express = require("express");
var ejs = require("ejs");
var bodyParser = require("body-parser");
var jwt = require("jsonwebtoken");
var app = express();

var db = require("./db");
var jwtVerifier = require("./app/middlewares/Jwt");

app.set('superSecret', "abc123$%^"); // secret variable

app.use(express.static(path.join(__dirname, 'public')));
app.set('views', path.join(__dirname, 'public/views'));
app.set('view engine', 'html');
app.engine('html', ejs.renderFile);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    res.render("index", { content: "Welcome to the most fantastic api on earth", token: "" });
});

var userRoutes = require("./app/routes/userRoutes");
var postRoutes = require("./app/routes/postRoutes");
var commentRoutes = require("./app/routes/commentRoutes");
var postLikeRoutes = require("./app/routes/postLikesRoutes");


app.post("/auth", function(req, res) {
    var sql =  "SELECT * FROM users WHERE email = ?";
    db.query(sql, [req.body.email], function(err, result, fields) {
        console.log(result[0]);
        if(err) res.status(500).send();
        if(result.length > 0) {
            
            if (result[0].password == req.body.password) {
                var expiry = 3600;
                var token = jwt.sign(result[0], app.get('superSecret'), {
                  expiresIn: expiry // expires in 1 hour
                });

                sql = "INSERT INTO jwt SET token = ?, last_accessed = ?";
                var now = new Date().getTime();
                console.log(typeof token);
                db.query(sql, [ token, now ], function(err, result1, fields) {
                    
                    if (err) {
                        console.log(err);
                        res.status(401).send();

                    } else {
                        console.log('Token generated & saved to DB ::: '+token);
                        res.header('x-access-token', token);

                        res.status(200).send({
                            firstname: result[0].firstname,
                            lastname: result[0].lastname,
                            email: result[0].email 
                        });    
                    }
                    
                });
                
            } else {
                res.status(401).send();
            }
        } else {
            res.status(401).send();
        }
    });
});

app.get("/getPosts/:type", function(req, res){ 

    var sql = "SELECT p.*, u.firstname, u.lastname, (SELECT COUNT(*) FROM post_likes l WHERE l.post_id = p.post_id) as like_count, (SELECT COUNT(*) FROM comments c WHERE c.post_id = p.post_id) as comment_count FROM posts p JOIN users u ON p.user_id = u.user_id WHERE p.is_active = 1";

    switch(req.params.type) {
        case "popular":
            sql += "  order by viewCount desc";
            break;
        case "latest":
            sql += " order by created_at desc";
            break;
        case "mostLiked":
            sql += " order by like_count desc";
            break;
    }

    db.query(sql, function(err, results, fields) {
        if(err) res.status(500).send();
        if(results.length > 0) 
            res.json(results);
        else
            res.status(204).send();
    });
});

app.post("/logout", function(req, res) {
    if(req.get("x-access-token") == undefined) {
        res.status(401).send();
    } else {
        var sql = "DELETE FROM jwt WHERE token = ?";
        db.query(sql, [req.get("x-access-token")], function (err, result, fields) {
            if(err || result.affectedRows == 0) res.status(500).send();
            res.status(200).send();
        });
    }
});

app.use(jwtVerifier);

app.use('/user', userRoutes);
app.use('/post', postRoutes);
app.use('/comment', commentRoutes);
app.use('/like', postLikeRoutes);


var PORT = process.env.port || 1337;
app.listen(PORT, () => {
    console.log("app listening at 1337");
});

process.on("exit", function() {
    db.end();
});