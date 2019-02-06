const fetch = require('node-fetch');
const express = require('express');
const sql = require('sql');
const morgan = require('morgan');
const compression = require('compression');
const path = require('path');
//npm install body parser
let bodyParser = require('body-parser');
const app = express();
let PORT = 3000;
app.disable('x-powered-by');  //get rid of Powered by express in the header!!!
app.set('x-powered-by', false);
const { Client } = require('pg')

// setup the logger.  Will make a file in the current directory
let fs = require('fs');
let stream = fs.createWriteStream(path.join(__dirname, "middleware.log"), {'flag': 'a'});  //open, append the file.
app.use(morgan('combined', { stream: stream }));

//setup compression.  There is a default constructor but I am not modifing the default
//this will say Content-Encoding: gzip in the raw header.
app.use(compression())

const ships_router = require('./routes/ships/router_ships.js')
const abilities_router = require('./routes/abilities/router_abilities.js')
const character_router = require('./routes/characters/router_characters.js')

//Additional middleware
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: false}));

app.use("/swgoh",ships_router);
app.use("/swgoh",abilities_router);
app.use("/swgoh",character_router);


//catch 404 page error -- would send them to my personal 404 rather than express' default.
app.use(function (req, res, next) {
	//console.log(req.originalUrl);
	if (req.originalUrl === '/favicon.ico') {
    	res.status(204).json({nope: true});
    } else {
  		res.status(404).send("Sorry, can't find that Page!")
	}
})

// LISTENER
const server = app.listen(PORT, function() {
  console.log('Server running on port: ', PORT);
})

module.exports = app;


/*
//curl -X POST localhost:3000/ships
response.json({ok: true});  //this does the following below...
response.writeHead(200, {
	'Content-Length': 10,
	'Content-Type': 'application/json; charset=utf-8'
})
let router = express.Router();
app.use('/pig', router);

router.use() //for special routes and not all the routes.  Say you want a private route
curl -X POST localhost:3000/ships -d 'name=me&cow=pig'
curl localhost:3000/ships -d '{name: 'me'}' -H "Content-Type: application/json"
*/


