var mongoose = require('mongoose');
mongoose.connect('mongodb://impact_db:27017/test');

var db = mongoose.connection;

db.on('error', console.error.bind(console, 'connection error'));
db.once('open', function() {
	console.log('connected');
	console.log(process.env);
});