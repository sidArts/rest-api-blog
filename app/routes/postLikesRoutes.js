var express = require("express");
var postLikeRoutes = express.Router();

var db = require("../../db");

postLikeRoutes.get("/likeCountByPostId/:postId", function(req, res) {
	var sql = "SELECT COUNT(*) as likes FROM post_likes WHERE post_id = ?";
	db.query(sql, [req.params.postId], function(err, result, fields) {
		
		if(err) res.status(500).send();
		res.json(result[0]);


	});
});

postLikeRoutes.get("/likeUserDetailsByPostId/:postId", function(req, res) {
	var sql = "SELECT l.like_id, l.post_id, u.firstname, u.lastname  FROM post_likes l JOIN users u ON u.user_id = l.user_id WHERE post_id = ?";
	db.query(sql, [req.params.postId], function(err, result, fields) {
		
		if(err) res.status(500).send();
		res.json(result);


	});
});

postLikeRoutes.post("/likePost", function(req, res) {
	var sql = "INSERT INTO post_likes(user_id, post_id) VALUES(?, ?)";
	db.query(sql, [req.userId, req.body.postId], function(err, result, fields) {
		
		if(err) res.status(500).send();
		if(result.affectedRows > 0)
			res.status(200).send();
		else
			res.status(204).send();


	});
});

module.exports = postLikeRoutes;

