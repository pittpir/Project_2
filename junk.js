const fetch = require('node-fetch');
//const pg = require('pg');
const sql = require('sql');
const { Client } = require('pg')
const client = new Client({
  user: 'Mega',
  host: 'localhost',
  database: 'swgoh',
  password: '',
  port: 5432,
})



async function fetchData (link) { 
	try {
		let returnData = "";
		returnData = await fetch(link);
		//console.log(returnData.headers.get('x-ratelimit-remaining'));
		//console.log(returnData.headers.get('x-ratelimit-limit'));
	    const data = await returnData.json();
	    //console.log(data)
	    return data;
	}
	catch(error){
		console.log("Error found ", error.name)
	}
}

//('Cassie loves Chris',2)
/*
  name VARCHAR(255) NOT NULL,
  url VARCHAR(255) NOT NULL,
  image VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  power INT NOT NULL,
  alignment VARCHAR(255) NOT NULL,
  role VARCHAR(255) NOT NULL,
  ship VARCHAR(255),
  abilities text[]
  
 */

//pbcopy

char_array = [];

 

let charactersObj = {
	name: 0,
    url: 0,
    image: 0,
    description: 0,
    power: 0,
    alignment: 0,  
    role: 0,
    ship: 0,
    ship_slot: 0,
    abilities: 0,
    tags: 0,
}

//pig.name = "dfdf"
//console.log (pig);
//char_array2.push(pig);
//console.log (char_array2);

let User = sql.define({
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
    'ship_slot',
    'abilities',
    'tags'
  ]
});
let rows = '';

async function Get_Characters() {
	let text = "";
	try {
		let returnData = await fetchData('https://swgoh.gg/api/characters/?format=json')
		//console.log(returnData)
		await client.connect();
		console.log("Connected");

		returnData.map(async function(data,index) {
  			
  			//name
//('Cassie loves Chris',2)
  			//text = JSON.stringify( data.name)
  			//text = "{ hello: 'world', places: ['Africa', 'America', 'Asia', 'Australia'] }"
  			//char_array.push(data.name);
  			charactersObj.name = data.name;
  			//console.log(charactersObj.name);
  			
  			
  			//url
  			//char_array.push(data.url);
  			charactersObj.url = data.url;
			//console.log(data.url);	
  			//image
  			//char_array.push(data.image);
  			charactersObj.image = data.image;
  			//console.log(data.image);	
  			//description
  			//char_array.push(data.description);
  			charactersObj.description = data.description;
			//console.log(data.description);
  			//power
  			//char_array.push(data.power);
  			charactersObj.power = data.power;
			//console.log(data.power);
  			//alignment
  			//char_array.push(data.alignment);
  			charactersObj.alignment = data.alignment;
  			//console.log(data.alignment);
  			//role
  			//char_array.push(data.role);
  			charactersObj.role = data.role;
  			//console.log(data.role);
  			//ship
  			//char_array.push(data.ship);
  			charactersObj.ship = data.ship;
  			//console.log(data.ship);
  			//ship_slot
  			//char_array.push(data.ship_slot);
  			charactersObj.ship_slot = data.ship_slot;
  			//console.log(data.ship_slot);
			//abilities
  			//char_array.push(data.ability_classes);
  			charactersObj.abilities = data.ability_classes;
  			charactersObj.tags = data.categories;
  			//console.log(charactersObj)
  			//char_array.push(charactersObj);
  			//char_array[index]=charactersObj;
  			//console.log(charactersObj);
  			let query = User.insert(charactersObj).toQuery();
  			//console.log(query)
  			rows = await client.query(query);
			console.log(rows.rowCount);

		
		});
		//console.log(char_array);
		//console.log (char_array2);
		//let query = User.insert(char_array).toQuery();
		//console.log(query)
		

		/*
		await client.connect();
		console.log("Connected");

		
  		//console.log(query);
  		let {rows} = await client.query(query);
		console.log(rows);

		await client.end();
*/
		//await client.end();
	}
	catch(error) {
		console.log("Error found ", error.message)
		//await client.end();
	}
};





async function Get_Ally_Code(code) {
	try {
		let returnData = await fetchData(`https://swgoh.gg/api/player/${code}/?format=json`)
		console.log(returnData)
		returnData.map(function(data,index) {
  			//name
  			//console.log(data.name);
  			//galactic_power
			//console.log(data.galactic_power);	
  			//pve_battles_won
  			//console.log(data.pve_battles_won);	
  			//guild_contribution
			//console.log(data.guild_contribution);
  			//guild_exchange_donations
			//console.log(data.guild_exchange_donations);
  			//guild_id
  			//console.log(data.guild_id);
  			//arena_leader_base_id
  			//console.log(data.arena_leader_base_id);
  			//galactic_war_won
  			//console.log(data.galactic_war_won);
  			//pve_hard_won
  			//console.log(data.pve_hard_won);
  			//guild_name
  			//console.log(data.guild_name);
  			//arena_rank
  			//console.log(data.arena_rank);
  			//guild_raid_won
  			//console.log(data.guild_raid_won);
  			//ally_code
  			//console.log(data.ally_code);
  			//level
  			//console.log(data.level);
  			//ship_battles_won
  			//console.log(data.ship_battles_won);
  			//ship_galactic_power
  			//console.log(data.ship_galactic_power);

		});
		//console.log(returnData);
		//console.log(returnData.headers.get('x-ratelimit-remaining'));
		//res.headers.get('content-type')
	}
	catch(error) {
		console.log("Error found ", error.name)
	}
};



Get_Characters();

/*
let code = 883925439;
Get_Ally_Code(code);
*/

