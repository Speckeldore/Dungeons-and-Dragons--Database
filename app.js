// App.js

/*
    SETUP
*/

// Express
var express = require('express');
var app = express();
PORT = 9676;

// Database
var db = require('./database/db-connector');

// Handlebars
const { engine } = require('express-handlebars');
app.engine('.hbs', engine({
    extname: ".hbs"
}));
app.set('view engine', '.hbs');

/*
    ROUTES
*/
app.get('/', function(req, res) {
    let query1 = "SELECT * FROM bsg_people;";
    db.pool.query(query1, function(error, rows, fields) {
        if (error) {
            console.error(error); // Log the error
            res.send('Error occurred');
        } else {
            res.render('index', { data: rows });
        }
    })
});

/*
    LISTENER
*/
app.listen(PORT, function() {
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});
