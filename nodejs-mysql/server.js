var express = require('express');
var app = module.exports = express.createServer();
require('./routes.js')(app);
app.listen(process.env.PORT);