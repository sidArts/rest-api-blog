var express = require("express");
var userRoutes = express.Router();

var db = require("../../db");

userRoutes.get("/get/:id", function(req, res){ 

	db.query("SELECT * FROM users WHERE user_id = ? AND is_active = 1", [req.params.id], function(err, results, fields) {
		
		if(err) res.status(500).send();
		if(results.length > 0)
			res.json(results[0]);
		else
			res.status(204).send();
	});

});

userRoutes.get("/getAll", function(req, res){ 

	db.query("SELECT * FROM users WHERE is_active = 1", [req.params.id], function(err, results, fields) {
		
		if(err) res.status(500).send();
		if(results.length > 0)
			res.json(results);
		else
			res.status(204).send();
	});

});

userRoutes.post("/create", function(req, res){ });

userRoutes.put("/update", function(req, res){ });

userRoutes.delete("/delete/:id", function(req, res){ 

	
	db.query("UPDATE users SET is_active = 0 WHERE user_id = ? AND is_active = 1", [req.params.id], function(err, result, fields) {
		if(err) res.status(500).send();
		if(result.affectedRows > 0)
			res.status(200).send();
		else
			res.status(204).send();
	});

});

module.exports = userRoutes;