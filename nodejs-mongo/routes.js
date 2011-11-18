var mongodb = require('mongodb');

var Db = require('mongodb').Db, 
    Connection = require('mongodb').Connection,  
    Server = require('mongodb').Server;

//var db = new Db('zootest', new Server('192.168.0.10', Connection.DEFAULT_PORT, {}), {native_parser:false});
var db = new Db('zootest', new Server('127.0.0.1', Connection.DEFAULT_PORT, {}), {native_parser:false});
db.open(function(err){
    if (err) {
        console.warn(err.message);
    }
});
var collection = new mongodb.Collection( db, 'nodejs-test' );
    

module.exports = function(app) {
	app.get('/time', function(req, res){
        res.header('Content-Type',  'text/plain');
        var now = new Date();
        res.send( now );
	});

	app.get( '/write', function( req, res ){
        res.header('Content-Type',  'text/plain');
        var now = new Date();

		collection.count(function(err, count) {
        	if ( count > 0 ) {
        		var cursor = collection.find().limit( 1 );
				cursor.nextObject( function( err, doc ){
					collection.update( doc, { $set: {'time' : now} }, {safe:true}, function( err ) {
    					if ( err ) {
							console.warn( err.message );
						} else {
							res.send( 'Dummy created' );	
						}
  					});	
				});		
			} else {
				collection.insert( {'time' : now}, function( doc ) {
					res.send( 'Dummy created' );	
  				});	
			}
        });	
	});

	app.get( '/read', function( req, res ){
        res.header('Content-Type',  'text/plain');
		var cursor = collection.find().limit( 1 );
		cursor.nextObject( function( err, doc ){
			res.send( doc.time + "\n" );
		});		
	});


	app.get( '/delete_all', function( req, res ){
        res.header('Content-Type',  'text/plain');
		collection.count( function( err, count ){
			collection.remove(function(err, result) {
				res.send( count + ' items deleted' );				
			});
		});
	});
}
