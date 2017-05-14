var express = require("express");
var commentRoutes = express.Router();

var db = require("../../db");

commentRoutes.get("/getByPostId/:postId", function(req, res){

	db.query("SELECT * FROM comments WHERE post_id = ? AND is_active = 1", [req.params.postId], function(err, results, fields) {
		if(err) res.status(500).send();
		if(results.length > 0)
			res.json(results);
		else
			res.status(204).send();
	});

});

commentRoutes.post("/create", function(req, res){ });

commentRoutes.put("/update", function(req, res){ });

commentRoutes.delete("/delete/:id", function(req, res){ 

	db.query("UPDATE comments SET is_active = 0 WHERE comment_id = ? AND is_active = 1", [req.params.id], function(err, result, fields) {
		if(err) res.status(500).send();
		if(result.affectedRows > 0)
			res.status(200).send();
		else
			res.status(204).send();
	});

});

module.exports = commentRoutes;