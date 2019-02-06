let express = require('express');
let routes = express.Router();
const sql = require('sql');
//npm install body parser
let bodyParser = require('body-parser');
const { Client } = require('pg')

routes.get("/characters", async function (request, response) {
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
		text = 'SELECT * FROM characters';
		rows = await client.query(text);
		//console.log(JSON.stringify(rows.rows));

		response.send(JSON.stringify(rows.rows));
		await client.end(); console.log("Connection ended");
	}
	catch(error) {
		console.log("Error found ", error.name);
		if (client._ending === false) {
			await client.end(); console.log("Connection ended");
		}
	}
});

routes.get("/characters/:id", async function (request, response) {
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
			text = 'SELECT * FROM characters WHERE char_id = $1';
			values = [request.params.id];
			rows = await client.query(text,values);
			
			//The array is empty or the user typed some kind of 
			if (!Array.isArray(rows.rows) || !rows.rows.length) {
 				response.send("Character request does not exist");         
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

routes.post("/characters", async function (request, response) {	
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

		let User2 = new sql.define({
		  name: 'characters',
		  columns: [
		    'name',
		    'url',
		    'image',
		    'description',
		    'power',
		    'alignment',  
		    'role',
		    'ship',
		    'ship_id',
		    'abilities',
		    'tags',
		    'base_id'
		  ]
		});


		let charactersObj = {
			name: request.body[0].name,
		    url: request.body[0].url,
		    image: request.body[0].image,
		    description: request.body[0].description,
		    power: request.body[0].power,
		    alignment: request.body[0].alignment,  
		    role: request.body[0].role,
		    ship: request.body[0].ship,
		    ship_id: request.body[0].ship_id,
		    abilities: request.body[0].abilities,
		    tags: request.body[0].tags,
		    base_id: request.body[0].base_id
		}
 
		if (request.body[0].ship !== "") {
			text = 'SELECT ship_id FROM ships where base_id = $1';
			values = [request.body[0].ship]
			rows = await client.query(text,values);
			
			if (!Array.isArray(rows.rows) || !rows.rows.length) {
 				response.send("Ship and Ship ID do not exist.  No Entry made");         
				await client.end(); console.log("Connection ended");
				return;
			}
			else {
				ship_id = rows.rows[0].ship_id;
				//console.log(rows.rows[0].ship_id);  
				//abilitiesObj.char_table_id = char_id;
				charactersObj.ship_id = ship_id;
			}
			
		} 
		else {
			charactersObj.ship_id = null;
			//charactersObj.ship_slot = data.ship_slot;	
		}


 /*
  		charactersObj.name = request.body[0].name;
  		charactersObj.url = request.body[0].url;
  		charactersObj.image = request.body[0].image;
  		charactersObj.description = request.body[0].description;
  		charactersObj.power = request.body[0].power;
  		charactersObj.alignment = request.body[0].alignment;
  		charactersObj.role = request.body[0].role;
  		charactersObj.ship = request.body[0].ship;	
  		charactersObj.ship_id = request.body[0].ship_id;
  		charactersObj.tags = request.body[0].tags;
  		charactersObj.abilities = request.body[0].abilities;
  		charactersObj.base_id = request.body[0].base_id;
 */ 				
  		let query = User2.insert(charactersObj).toQuery();
  		rows = await client.query(query);
		//console.log(rows.rowCount);

		response.send(`${rows.rowCount} Entry added to Characters`);
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

routes.delete("/characters/:id", async function (request, response) {
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
			text = 'DELETE FROM characters WHERE char_id = $1';
			values = [request.params.id];
			rows = await client.query(text,values);
			//console.log(rows.rowCount);
			//The array is empty or the user typed some kind of 
			if (rows.rowCount < 1) {
 				response.send("Character request does not exist");         
				await client.end(); console.log("Connection ended");
			}
			else {
				response.send(`Character Entry ${request.params.id} deleted`);
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
routes.put("/characters/:id", async function (request, response) {	
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
			let array = [];
			let text2 = ""
			let text = "UPDATE characters SET ";	
			let count = 1;

			for (var key in items) {
	    		if (items.hasOwnProperty(key)) {
	        		//console.log(key + " -> " + items[key]);
	        		if (key === "ship_id" )
	        		{
						text2 = 'SELECT * FROM ships WHERE ships.ship_id = $1';
						//values = [items[key]];
						
						array.push(items[key]);
						//console.log(array);
						rows = await client.query(text2,array);
			
						if (!Array.isArray(rows.rows) || !rows.rows.length) {
 							response.send("Ship ID does not exist.  No Entry made");         
							await client.end(); console.log("Connection ended");
							return;
						}
					}
					columns.push(key);
	        		values.push(items[key])
	        		text = text + key + " = $" + count + ", ";
	        		count++; 
	    		}
			}
			regex = /,\s$/;  //remove the last comma
			text = text.replace(regex,'');

			text = text + " WHERE char_id = $" + count;
			values.push(request.params.id);
			rows = await client.query(text,values);
			
			if (rows.rowCount < 1) {
 				response.send("Character request does not exist");         
				await client.end(); console.log("Connection ended");
			}
			else {
				response.send(`Character Entry ${request.params.id} updated`);
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