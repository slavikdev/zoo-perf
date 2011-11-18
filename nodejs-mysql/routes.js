var db = require( 'mysql-native' ).createTCPClient(); // localhost:3306 by default
db.auto_prepare = true;
db.auth( "nodejs_test", "root", "123123" );

module.exports = function(app) {
	app.get( '/time', function(req, res){
        res.header('Content-Type',  'text/plain');
        var now = new Date();
        res.send( now );
	});

	app.get( '/write', function( req, res ){
        res.header( 'Content-Type',  'text/plain' );
        var now = new Date();                     

		db.query( 'SELECT * FROM dummies' );
		/* db.query( 'INSERT INTO dummies (id, time) VALUES ( 1,' + now + ' ) ON DUPLICATE KEY UPDATE id;' ).addListener( 'end', function() {
			res.send( 'Dummy created' );
		}); */
	});

	app.get( '/read', function( req, res ){
        res.header('Content-Type',  'text/plain');
		/*var cursor = collection.find().limit( 1 );
		cursor.nextObject( function( err, doc ){
			res.send( doc.time + "\n" );
		});		*/
	});

	app.get( '/delete_all', function( req, res ){
        res.header('Content-Type',  'text/plain');
		/*collection.count( function( err, count ){
			collection.remove(function(err, result) {
				res.send( count + ' items deleted' );				
			});
		}); */
	});
}

db.close();