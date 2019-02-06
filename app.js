//Use this app to populate the swgoh Database
//Please create the DB swgoh and each of the tables (see the sql files) prior to running this!

const fetch = require('node-fetch');
const sql = require('sql');
const { Client } = require('pg')
const client = new Client({
  user: 'Mega',
  host: 'localhost',
  database: 'swgoh',
  password: '',
  port: 5432,
})
let User = {};
let rows = '';
let text = "";
let values = [];
let regex = "";
//passport


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

let charactersObj = {
	name: 0,
    url: 0,
    image: 0,
    description: 0,
    power: 0,
    alignment: 0,  
    role: 0,
    ship: 0,
    ship_id: 0,
    abilities: 0,
    tags: 0,
    base_id: 0
}

let User1 = sql.define({
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

async function Get_Characters() {
	let text = "";
	try {
		let returnData = await fetchData('https://swgoh.gg/api/characters/?format=json')
		await client.connect();
		console.log("Connected");

		returnData.map(async function(data,index) {

			if (data.ship !== "") {
				text = 'SELECT ship_id FROM ships where base_id = $1';
				values = [data.ship]
				rows = await client.query(text,values);
				ship_id = rows.rows[0].ship_id
				//console.log(rows.rows[0].ship_id);  
				//abilitiesObj.char_table_id = char_id;
				charactersObj.ship_id = ship_id;
			} 
			else {
				charactersObj.ship_id = null;
				//charactersObj.ship_slot = data.ship_slot;	
			}




  			charactersObj.name = data.name;
  			charactersObj.url = data.url;
  			charactersObj.image = data.image;
  			charactersObj.description = data.description;
  			charactersObj.power = data.power;
  			charactersObj.alignment = data.alignment;
  			charactersObj.role = data.role;
  			charactersObj.ship = data.ship;  			
  			charactersObj.abilities = data.ability_classes;
  			charactersObj.tags = data.categories;
  			charactersObj.base_id = data.base_id;
  			
  			let query = User1.insert(charactersObj).toQuery();
  			rows = await client.query(query);
			console.log(rows.rowCount);
		});
		setTimeout( async ()=> {await client.end(); console.log("Connection ended"); }, 3000);
		//setTimeout(function(){ alert("Hello"); }, 3000);
		
	}
	catch(error) {
		console.log("Error found ", error.message)
		//await client.end();
	}

};


let shipsObj = {
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
}

let User2 = sql.define({
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

async function Get_Ships() {
	let text = "";
	try {
		let returnData = await fetchData('https://swgoh.gg/api/ships/?format=json')
		await client.connect();
		console.log("Connected");
/*
		let text = 'SELECT char_id FROM characters where ship = $1';
		//const text = 'INSERT INTO users(name, email) VALUES($1, $2) RETURNING *'
		const values = [data.base_id]

		rows = await client.query(text,values);
		char_id = rows.rows[0].char_id
		console.log(rows.rows[0].char_id);
*/


		returnData.map(async function(data,index) {
/*
			text = 'SELECT char_id FROM characters where ship = $1';
			values = [data.base_id]
			rows = await client.query(text,values);
			char_id = rows.rows[0].char_id
			console.log(rows.rows[0].char_id);  
			shipsObj.char_table_id = char_id;
 */ 			
 			//console.log(data.base_id);
  			shipsObj.name = data.name;
  			shipsObj.url = data.url;
  			shipsObj.image = data.image;
  			shipsObj.description = data.description;
  			shipsObj.power = data.power;
  			shipsObj.alignment = data.alignment;
  			shipsObj.role = data.role;	
  			shipsObj.capital_ship = data.capital_ship; 			
  			shipsObj.abilities = data.ability_classes;
  			shipsObj.tags = data.categories;
  			shipsObj.base_id = data.base_id;		
  			
  			let query = User2.insert(shipsObj).toQuery();
  			rows = await client.query(query);
			console.log(rows.rowCount);
		});
		setTimeout( async ()=> {await client.end(); console.log("Connection ended"); }, 3000);
		
	}
	catch(error) {
		console.log("Error found ", error.name)
		await client.end();
	}
};


let abilitiesObj = {
	name: 0,
    url: 0,
    image: 0,
    tier_max: 0,
    is_zeta: 0,
    is_omega: 0,  
    combat_type: 0,
    type: 0,
    is_basic: 0,
    is_special: 0,
    is_unique: 0,
    is_leader: 0,
    is_contract: 0,
    is_reinforcement:0,
    char_table_id: 0,
    ship_table_id: 0
}

let User3 = sql.define({
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
    'is_unique',
    'is_special',
    'is_leader',
    'is_contract',
    'is_reinforcement',
    'char_table_id',
    'ship_table_id'
  ]
});

async function Get_Abilities() {
	let text = "";
	try {
		let returnData = await fetchData('https://swgoh.gg/api/abilities/?format=json')
		await client.connect();
		console.log("Connected");

 // char_table_id INT NOT NULL REFERENCES Characters(char_id),
 // ship_table_id INT REFERENCES Ships(ship_id)

		returnData.map(async function(data,index) {

			if (data.character_base_id !== null) {
				text = 'SELECT char_id FROM characters where base_id = $1';
				values = [data.character_base_id]
				rows = await client.query(text,values);
				char_id = rows.rows[0].char_id
				//console.log(rows.rows[0].char_id);  
				abilitiesObj.char_table_id = char_id;
				abilitiesObj.ship_table_id = null;
				//console.log(data);
			}
			//console.log(data.ship_base_id);

			if (data.ship_base_id !== null) {
				//text = 'SELECT characters.char_id, characters.name FROM characters where characters.ship = $1';
				text = 'SELECT ship_id FROM ships where base_id = $1';
				//SELECT characters.char_id, characters.name FROM characters where characters.ship =
				values = [data.ship_base_id]
				rows = await client.query(text,values);
				char_id = rows.rows[0].ship_id
				console.log(rows.rows[0].ship_id);  
				abilitiesObj.ship_table_id = char_id;
				abilitiesObj.char_table_id = null;
			}

			regex = /^basicskill/ig;
			//console.log(data.base_id.search(regex));
 			if (data.base_id.search(regex) !== -1) {
				abilitiesObj.is_basic = true;
			}
			else {
				abilitiesObj.is_basic = false;
			}

			regex = /^specialskill/ig;
			//console.log(data.base_id.search(regex));
 			if (data.base_id.search(regex) !== -1) {
				abilitiesObj.is_special = true;
			}
			else {
				abilitiesObj.is_special = false;
			}

			regex = /^uniqueskill/ig;
			//console.log(data.base_id.search(regex));
 			if (data.base_id.search(regex) !== -1) {
				abilitiesObj.is_unique = true;
			}
			else {
				abilitiesObj.is_unique = false;
			}

			regex = /^hardwareskill/ig;
			//console.log(data.base_id.search(regex));
 			if (data.base_id.search(regex) !== -1) {
				abilitiesObj.is_reinforcement = true;
			}
			else {
				abilitiesObj.is_reinforcement = false;
			}

			regex = /^leaderskill/ig;
			//console.log(data.base_id.search(regex));
 			if (data.base_id.search(regex) !== -1) {
				abilitiesObj.is_leader = true;
			}
			else {
				abilitiesObj.is_leader = false;
			}

			regex = /^contractskill/ig;
			//console.log(data.base_id.search(regex));
 			if (data.base_id.search(regex) !== -1) {
				abilitiesObj.is_contract = true;
			}
			else {
				abilitiesObj.is_contract = false;
			}

  			abilitiesObj.name = data.name;
  			abilitiesObj.url = data.url;
  			abilitiesObj.image = data.image;
  			abilitiesObj.tier_max = data.tier_max;
  			abilitiesObj.is_zeta = data.is_zeta;
  			abilitiesObj.is_omega = data.is_omega;
  			abilitiesObj.combat_type = data.combat_type;
  			abilitiesObj.type = data.type;
 
  	//ship_table_id INT REFERENCES Ships(ship_id)		
  			
  			//abilitiesObj.char_table_id = data.character_base_id;
  			//abilitiesObj.ship_table_id = data.ship_base_id;
 			
  			let query = User3.insert(abilitiesObj).toQuery();
  			rows = await client.query(query);
			console.log(rows.rowCount);
		});
		setTimeout( async ()=> {await client.end(); console.log("Connection ended"); }, 20000);
	}
	catch(error) {
		console.log("Error found ", error.name)
		await client.end();
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


//do ships 1st, then characters then abilities
Get_Ships();
//Get_Characters();
//Get_Abilities();

/*
let code = 883925439;
Get_Ally_Code(code);
*/

