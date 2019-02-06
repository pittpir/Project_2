CREATE TABLE Abilities (
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
);
