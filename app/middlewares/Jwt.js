var express      = require('express');
var jwt          = require('jsonwebtoken');
var app          = express();

var db = require("../../db");

app.set('superSecret', "abc123$%^"); // secret variable

module.exports = function(req, res, next) {

  // check header or url parameters or post parameters for token
  var token = req.body.token || req.query.token || req.headers['x-access-token'];

  // decode token
  if (token) {
    var sql = "SELECT * FROM jwt WHERE token = ?";
    db.query(sql, [ token ], function(err, result, fields) {
      
      if(err) res.status(403).send();
 
      if(result.length > 0) {
        var lastAccessedTime = result[0].last_accessed;
        var now = new Date().getTime();
        if((now - lastAccessedTime) < 3600000) {
          jwt.verify(token, app.get('superSecret'), function(err, decoded) {      
            if (err) {
              return res.status(401).send();    
            } else {
              // if everything is good, save to request for use in other routes
                req.loggedInUserId = decoded.user_id;             
                sql = "UPDATE jwt SET last_accessed = ? WHERE token = ?";
                var newTime = new Date().getTime();
                db.query(sql, [newTime, token], function(err, result1, fields) {
                  if(err) res.status(401).send();
                  if( result1.affectedRows > 0)
                    next();
                });
            }
          });
        } else {

        }
      } else {
        res.status(403).send();
      }
    });
  } else {
    return res.status(403).send({ 
        success: false, 
        message: 'No token provided.' 
    });
    
  }
};