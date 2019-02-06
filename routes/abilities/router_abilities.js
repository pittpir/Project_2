let express = require('express');
let routes = express.Router();
const sql = require('sql');
//npm install body parser
let bodyParser = require('body-parser');
const { Client } = require('pg')



routes.get("/abilities", async function (request, response) {
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
		text = 'SELECT * FROM abilities';
		rows = await client.query(text);
		//console.log(JSON.stringify(rows.rows));

		
		response.send(JSON.stringify(rows.rows));
		await client.end(); console.log("Connection ended");
	}
	catch(error) {
		console.log("Error found ", error.name);
		await client.end(); console.log("Connection ended");
	}
});

routes.get("/abilities/:id", async function (request, response) {
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
			text = 'SELECT * FROM abilities WHERE ability_id = $1';
			values = [request.params.id];
			rows = await client.query(text,values);
			
			//The array is empty or the user typed some kind of 
			if (!Array.isArray(rows.rows) || !rows.rows.length) {
 				response.send("Abilities request does not exist");         
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
		await client.end(); console.log("Connection ended");
	}
});



routes.post("/abilities", async function (request, response) {	
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
		  name: 'abilities',
		  columns: [
		    'name',
		    'url',
		    'image',
		    'tier_max',
		    'is_zeta',
		    'is_omega',  
		    'combat_type',
		    'type',
		    'is_basic',
		    'is_special',
		    'is_reinforcement',
		    'is_contract',
		    'is_unique',
		    'is_leader',
		    'char_table_id',
		    'ship_table_id',
		  ]
		});

		let abilitiesObj = {
			name: request.body[0].name,
		    url: request.body[0].url,
		    image: request.body[0].image,
		    tier_max: request.body[0].tier_max,
		    is_zeta: request.body[0].is_zeta,
		    is_omega: request.body[0].is_omega,  
		    combat_type: request.body[0].combat_type,
		    type: request.body[0].type,
		    is_basic: request.body[0].is_basic,
		    is_special: request.body[0].is_special,
		    is_reinforcement: request.body[0].is_reinforcement,
		    is_contract: request.body[0].is_contract,
		    is_unique: request.body[0].is_unique,
		    is_leader: request.body[0].is_leader,
		    char_table_id: request.body[0].char_table_id,
		    ship_table_id: request.body[0].ship_table_id,
		}
 
		if (request.body[0].char_table_id !== "" && request.body[0].char_table_id !== null) {
			text = 'SELECT char_id FROM characters where name = $1';
			values = [request.body[0].char_table_id]
			rows = await client.query(text,values);
			
			if (!Array.isArray(rows.rows) || !rows.rows.length) {
 				response.send("Character Name does not exist.  No Entry made");         
				await client.end(); console.log("Connection ended");
				return;
			}
			else {
				char_table_id = rows.rows[0].char_id;
				//console.log(rows.rows[0].char_id);  
				abilitiesObj.char_table_id = char_table_id;
			}
		} 
		else {
			abilitiesObj.char_table_id = null;
		}



		if (request.body[0].ship_table_id !== "" && request.body[0].ship_table_id !== null) {
			text = 'SELECT ship_id FROM ships where name = $1';
			values = [request.body[0].ship_table_id]
			rows = await client.query(text,values);
			
			if (!Array.isArray(rows.rows) || !rows.rows.length) {
 				response.send("Ship Name does not exist.  No Entry made");         
				await client.end(); console.log("Connection ended");
				return;
			}
			else {
				ship_table_id = rows.rows[0].ship_id
				//console.log(rows.rows[0].ship_id);  
				abilitiesObj.ship_table_id = ship_table_id;
			}
		} 
		else {
			abilitiesObj.ship_table_id = null;
		}

  		let query = User2.insert(abilitiesObj).toQuery();
  		rows = await client.query(query);
		//console.log(rows.rowCount);

		response.send(`${rows.rowCount} Entry added to Abilities`);
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

routes.delete("/abilities/:id", async function (request, response) {
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
			text = 'DELETE FROM abilities WHERE ability_id = $1';
			values = [request.params.id];
			rows = await client.query(text,values);
			//console.log(rows.rowCount);
			//The array is empty or the user typed some kind of 
			if (rows.rowCount < 1) {
 				response.send("Ability request does not exist");         
				await client.end(); console.log("Connection ended");
			}
			else {
				response.send(`Ability Entry ${request.params.id} deleted`);
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

routes.use((error, request, response, next) => {
    //if (error.status === 404) {
        return response.send("sdflksdfksdkdfkkfsdfk");
    //}

    //if (err.status === 500) {
         return response.send("sdflksdfksdkdfkkfsdfk");
//}
});

module.exports = routes;