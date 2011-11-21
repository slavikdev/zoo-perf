var form = require('./node_modules/connect-form'),
    mysql = require('./node_modules/mysql'),
    orm = require("orm");

var client = mysql.createClient({
  user: 'root',
  password: '123123',
  database: 'nodejs_test'
});


var CountModel;

var db = orm.connect("mysql", client, function (success, db) {
    if (!success) {
        console.log("Could not connect to database!");
        return;
    }
    else {
        console.log("Connected to database!");

        CountModel = db.define( "Count", { "created": { "type": "string" } } );

        // sync to database
        CountModel.sync();
    }

});


module.exports = function (app) {
    app.get('/time', function (req, res) {
        res.header('Content-Type', 'text/plain');
        var now = new Date();
        res.send(now.toString());
    });


    app.get('/write', function (req, res) {
        res.header('Content-Type', 'text/plain');
        CountModel.find(function (family) {

            if (!family) {
                var now = new Date();
                var count = new CountModel({ "created": now.toString() });
                count.save();
                res.send(count.created);
            }
            else {
                var now = new Date();
                var count = family[0];
                count.created = now.toString();

                count.save();
                res.send(count.created);
            }
           
            
        });


        //res.send("BUG");
    });


    app.get('/read', function (req, res) {
        res.header('Content-Type', 'text/plain');
        CountModel.find(function (family) {
            var count = family[0];
            res.send(count.created.toString());
        });
    });


    app.get('/delete_all', function (req, res) {
        CountModel.clear(function () {
            res.header('Content-Type', 'text/plain');
            res.send("Clear");
        });
    });
};
