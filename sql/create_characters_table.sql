CREATE TABLE Characters (
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
);