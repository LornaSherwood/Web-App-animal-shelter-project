DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address_1 VARCHAR(255),
  address_2 VARCHAR(255),
  address_3 VARCHAR(255)
);

CREATE TABLE animals(
  id SERIAL8 primary key,
  name VARCHAR(255),
  breed VARCHAR(255),
  admission_date DATE,
  status VARCHAR(255),
  photo VARCHAR(255)
);

CREATE TABLE adoptions(
  id SERIAL8 primary key,
  animal_id SERIAL8 references animals(id),
  owner_id SERIAL8 references owners(id)
);

