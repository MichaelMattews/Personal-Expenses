
-- create a transaction table
---------------------------------------
CREATE TABLE IF NOT EXISTS transaction (
transaction_type_id  SERIAL PRIMARY KEY,
transaction_description VARCHAR(80) NOT NULL UNIQUE
);


--------------------------------------
-- create a category table
--------------------------------------
CREATE TABLE IF NOT EXISTS category (
category_id  SERIAL PRIMARY KEY,
category_description VARCHAR(80) NOT NULL UNIQUE,
	category_essential SERIAL NOT NULL
);

--------------------------------------