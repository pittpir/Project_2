# Project_2 Create DB with CRUD routes in nodeJS

### Star Wars Galaxy of Heroes (swgoh) RESTful API
I play a mobile game called Star Wars Galaxy of Heroes.  The game has an api from which I can absorb and use in my DB.  
The idea would be to query the various characters, ships and abilites.  I can then correlate my account to see what I need to gain new characters being offered.  

For example, let say the game is going to introduce Jedi Knight Luke Skywalker next week giving me 7 days to prepare.  The requirements to obtain him may require a 7 star R2D2, Leia, Chewie, Han Solo and C3PO.  I may only have R2D2 at 5 stars and I do not have C3PO yet.  What would I have to do or how much would it cost me to obtain the characters I need to unlock JK Luke Skywalker?  
 
(https://swgoh.gg/api/ "SWGOH.GG API Site")

### Routes

#### Characters 
/swgoh/characters - (method: GET) will provide a json list of all the characters and their corresponding data.
/swgoh/characters/id - (method: GET) will provide a json list of all the specific character and their corresponding data.

/swgoh/characters/id - (method: DELETE) will delete the specific character and their corresponding data.

/swgoh/characters - (method: POST) Will create a new character with the corresponging data.  Data must be in the body.  Refer to Character's schema (below) for what items to pass.

/swgoh/characters/id - (method: PUT) will update the specific character and specific data.  Data must be in the body.  Refer to Character's schema (below) for what items to pass.

  char_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  url VARCHAR(255) NOT NULL,
  image VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  power INT NOT NULL,
  alignment VARCHAR(255) NOT NULL,
  role VARCHAR(255) NOT NULL,
  ship VARCHAR(255),
  ship_id INT REFERENCES ships(ship_id),
  tags text[],
  abilities text[],
  base_id VARCHAR(255) NOT NULL

#### Ships 
/swgoh/ships - (method: GET) will provide a json list of all the ships and it's corresponding data.
/swgoh/ships/id - (method: GET) will provide a json list of all the specific ships and it's corresponding data.

/swgoh/ships/id - (method: DELETE) will delete the specific ships and it's corresponding data.

/swgoh/ships - (method: POST) Will create a new ship with the corresponging data.  Data must be in the body.  Refer to Ships' schema (below) for what items to pass.

/swgoh/ships/id - (method: PUT) will update the specific ship and specific data.  Data must be in the body.  Refer to Ships' schema (below) for what items to pass.

  ship_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  url VARCHAR(255) NOT NULL,
  image VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  power INT NOT NULL,
  alignment VARCHAR(255) NOT NULL,
  role VARCHAR(255) NOT NULL,
  capital_ship BOOLEAN NOT NULL,
  base_id VARCHAR(255),
  tags text[],
  abilities text[]

#### Abilities
/swgoh/abilities - (method: GET) will provide a json list of all the abilities in the game and their corresponding data.
/swgoh/abilities/id - (method: GET) will provide a json list of all the specific abilities and their corresponding data.

/swgoh/abilities/id - (method: DELETE) will delete the specific abilities and their corresponding data.

/swgoh/abilities - (method: POST) Will create a new abilities with the corresponging data.  Data must be in the body.  Refer to Abilities' schema (below) for what items to pass.

/swgoh/abilities/id - (method: PUT) will update the specific abilities and specific data.  Data must be in the body.  Refer to Abilities' schema (below) for what items to pass.

  ability_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  url VARCHAR(255) NOT NULL,
  image VARCHAR(255) NOT NULL,
  tier_max INT NOT NULL,
  is_zeta BOOLEAN NOT NULL,
  is_omega BOOLEAN NOT NULL,
  combat_type INT NOT NULL,
  type INT,
  is_basic BOOLEAN NOT NULL,
  is_special BOOLEAN NOT NULL,
  is_reinforcement BOOLEAN NOT NULL,
  is_contract BOOLEAN NOT NULL,
  is_unique BOOLEAN NOT NULL,
  is_leader BOOLEAN NOT NULL,
  char_table_id INT REFERENCES Characters(char_id),
  ship_table_id INT REFERENCES Ships(ship_id)





