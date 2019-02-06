CREATE TABLE Ships (
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
);