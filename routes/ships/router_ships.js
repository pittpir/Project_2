let express = require('express');
let routes = express.Router();
const sql = require('sql');
//npm install body parser
let bodyParser = require('body-parser');
const { Client } = require('pg')

routes.get("/ships", async function (request, response) {
	const client = new Client({
	  user: 'Mega',
	  host: 'localhost',
	  database: 'swgoh',
	  password: '',
	  port: 5432,
	});
	try {
		await client.connect();
		console.log("Connected");
		text = 'SELECT * FROM ships';
		rows = await client.query(text);
		//console.log(JSON.stringify(rows.rows));

		response.send(JSON.stringify(rows.rows));
		//console.log(...rows.rows);
		//response.send(rows.rows);
		await client.end(); console.log("Connection ended");
	}
	catch(error) {
		console.log("Error found ", error.name);
		if (client._ending === false) {
			await client.end(); console.log("Connection ended");
		}
	}
});

routes.get("/ships/:id", async function (request, response) {
	const client = new Client({
	  user: 'Mega',
	  host: 'localhost',
	  database: 'swgoh',
	  password: '',
	  port: 5432,
	});
	let rows = {};
	try {
		await client.connect();
		console.log("Connected");
		if (request.params.id > 0) {
			text = 'SELECT * FROM ships WHERE ship_id = $1';
			values = [request.params.id];
			rows = await client.query(text,values);
			
			//The array is empty or the user typed some kind of 
			if (!Array.isArray(rows.rows) || !rows.rows.length) {
 				response.send("Ship request does not exist");         
				await client.end(); console.log("Connection ended");
			}
			else {
				response.send(JSON.stringify(rows.rows));
				await client.end(); console.log("Connection ended");
			}
		}
		else {
			response.send("The ID does not exist below 0!");
			await client.end(); console.log("Connection ended");
		}
	}
	catch(error) {
		console.log("Error found ", error.name);
		if (client._ending === false) {
			await client.end(); console.log("Connection ended");
		}
	}
});

routes.post("/ships", async function (request, response) {	
	const client = new Client({
	  user: 'Mega',
	  host: 'localhost',
	  database: 'swgoh',
	  password: '',
	  port: 5432,
	});
	try {
		let items = request.body[0];
		let columns = [];
		let shipsObj = {};
		let values = [];
						
		for (var key in items) {
		    if (items.hasOwnProperty(key)) {
		        columns.push(key);
		        shipsObj[key] = items[key];
		
		    }
		}
		let User2 = new sql.define({
		  name: 'ships',
		  columns: columns });
/*	
	

		let shipsObj = ({
			name: 0,
		    url: 0,
		    image: 0,
		    description: 0,
		    power: 0,
		    alignment: 0,  
		    role: 0,
		    tags: 0,
		    abilities: 0,
		    base_id: 0,
		    capital_ship: 0
		});
*/
		await client.connect();
		console.log("Connected");

/*
		let User2 = new sql.define({
		  name: 'ships',
		  columns: [
		    'name',
		    'url',
		    'image',
		    'description',
		    'power',
		    'alignment',  
		    'role',
		    'tags',
		    'abilities',
		    'capital_ship',
		    'base_id'
		  ]
		});

  		shipsObj.name = request.body[0].name;
  		shipsObj.url = request.body[0].url;
  		shipsObj.image = request.body[0].image;
  		shipsObj.description = request.body[0].description;
  		shipsObj.power = request.body[0].power;
  		shipsObj.alignment = request.body[0].alignment;
  		shipsObj.role = request.body[0].role;
  		shipsObj.capital_ship = request.body[0].capital_ship;	
  		shipsObj.abilities = request.body[0].abilities;
  		shipsObj.tags = request.body[0].tags;
  		shipsObj.base_id = request.body[0].base_id;
 */ 				
  		let query = User2.insert(shipsObj).toQuery();
  		rows = await client.query(query);
		//console.log(rows.rowCount);

		response.send(`${rows.rowCount} Entry added to Ships`);
		if (client._ending === false) {
			await client.end(); console.log("Connection ended");
		}
	}
	catch(error) {
		console.log("Error found ", error.name, error.message);
		if (client._ending === false) {
			await client.end(); console.log("Connection ended");
		}
	}
});

routes.delete("/ships/:id", async function (request, response) {
	const client = new Client({
	  user: 'Mega',
	  host: 'localhost',
	  database: 'swgoh',
	  password: '',
	  port: 5432,
	});
	let rows = {};
	try {
		await client.connect();
		console.log("Connected");
		if (request.params.id > 0) {
			text = 'DELETE FROM ships WHERE ship_id = $1';
			values = [request.params.id];
			rows = await client.query(text,values);
			console.log(rows.rowCount);
			//The array is empty or the user typed some kind of 
			if (rows.rowCount < 1) {
 				response.send("Ship request does not exist");         
				await client.end(); console.log("Connection ended");
			}
			else {
				response.send(`Ship Entry ${request.params.id} deleted`);
				await client.end(); console.log("Connection ended");
			}
		}
		else {
			response.send("The ID does not exist below 0!");
			await client.end(); console.log("Connection ended");
		}
	}
	catch(error) {
		console.log("Error found ", error.name, error.message);
		if (client._ending === false) {
			await client.end(); console.log("Connection ended");
		}
	}
});


//make this string to psql
//'UPDATE "ships" SET "name" = $1, "tags" = $2, "abilities" = $3 WHERE ("ships"."ship_id" = $4)'
routes.put("/ships/:id", async function (request, response) {	
	const client = new Client({
	  user: 'Mega',
	  host: 'localhost',
	  database: 'swgoh',
	  password: '',
	  port: 5432,
	});
	let rows = {};
	try {

		if (request.params.id > 0) {
			await client.connect();
			console.log("Connected");

			let items = request.body[0];
			let columns = [];
			let values = [];
			let regex = "";
			

			let text = "UPDATE ships SET ";	
			let count = 1;
			for (var key in items) {
	    		if (items.hasOwnProperty(key)) {
	        		//console.log(key + " -> " + items[key]);
	        		columns.push(key);
	        		values.push(items[key])
	        		text = text + key + " = $" + count + ", ";
	        		count++;
	    		}
			}
			regex = /,\s$/;  //remove the last comma
			text = text.replace(regex,'');

			text = text + " WHERE ship_id = $" + count;
			values.push(request.params.id);
			rows = await client.query(text,values);
			
			if (rows.rowCount < 1) {
 				response.send("Ship request does not exist");         
				await client.end(); console.log("Connection ended");
			}
			else {
				response.send(`Ship Entry ${request.params.id} updated`);
				await client.end(); console.log("Connection ended");
			}
		}
		else {
			response.send("The ID does not exist below 0!");
			await client.end(); console.log("Connection ended");
		}
	}
	catch(error) {
		console.log("Error found ", error.name, error.message);
		if (client._ending === false) {
			await client.end(); console.log("Connection ended");
		}
	}
});

module.exports = routes;