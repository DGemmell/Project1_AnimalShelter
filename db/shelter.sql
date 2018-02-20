DROP TABLE owners CASCADE;
DROP TABLE animals CASCADE;


CREATE TABLE owners(
  id SERIAL8 primary key,
  name VARCHAR(255),
  contact VARCHAR(255)
);

CREATE TABLE animals(
	id SERIAL8 primary key,
	name VARCHAR(255),
	reg_date DATE,
  available BOOLEAN,
  owner_id INT8 REFERENCES owners(id)
);
