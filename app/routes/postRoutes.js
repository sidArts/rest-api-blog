var express = require("express");
var postRoutes = express.Router();

var db = require("../../db");


postRoutes.get("/getById/:id", function(req, res){ 
	var sql = "SELECT * FROM posts WHERE post_id = ? AND is_active = 1";
	
	db.query(sql, [req.params.id], function(err, results, fields) {
		if(err) res.status(500).send();
		if(results.length > 0)
			if(results[0].user_id != req.loggedInUserId) {				
				sql = "UPDATE posts SET viewCount = ? WHERE post_id = ?";
				db.query(sql, [ ++results[0].viewCount, req.params.id ], function(err, result1, fields) {
					if(err) res.status(500).send();
					res.json(results[0]);		
				});			
			}						
		else
			res.status(204).send();
	});

});

postRoutes.get("/getByUserId/:userId", function(req, res){ 
	db.query("SELECT * FROM posts WHERE user_id = ? AND is_active = 1", [req.params.userId], function(err, results, fields) {
		if(err) res.status(500).send();
		if(results.length > 0)
			res.json(results);
		else
			res.status(204).send();
	});
});

postRoutes.get("/getAll", function(req, res){ 


	db.query("SELECT * FROM posts WHERE is_active = 1", function(err, results, fields) {
		if(err) res.status(500).send();
		if(results.length > 0) 
			res.json(results);
		else
			res.status(204).send();
	});
});



postRoutes.post("/create", function(req, res){ 



});

postRoutes.put("/update", function(req, res){ });

postRoutes.delete("/delete/:id", function(req, res){ 

	db.query("UPDATE posts SET is_active = 0 WHERE post_id = ? AND is_active = 1", [req.params.id], function(err, result, fields) {
		if(err) res.status(500).send();
		if(result.affectedRows > 0)
			res.status(200).send();
		else
			res.status(204).send();
	});

});

module.exports = postRoutes;