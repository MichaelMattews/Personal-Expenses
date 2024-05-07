
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


ALTER TABLE "transaction"
ADD CONSTRAINT unique_transaction_type_id UNIQUE (transaction_type_id);

ALTER TABLE "category"
ADD CONSTRAINT unique_category_id UNIQUE (category_id);


--------------------------------------
-- create a date_dimension table
--------------------------------------

CREATE TABLE IF NOT EXISTS date_dimension (
transaction_date DATE PRIMARY KEY NOT NULL,
    weekday_name VARCHAR(10) NOT NULL,
    day_month INT NOT NULL,
    month_name VARCHAR(10) NOT NULL,
    quarter INT NOT NULL,
    year INT NOT NULL
);

--------------------------------------
-- create a transaction_facts table
--------------------------------------

CREATE TABLE IF NOT EXISTS transaction_facts (
  transaction_type_id INT NOT NULL,
  category_id INT NULL,
  transaction_date DATE NOT NULL,
  transaction_description VARCHAR(100),
  beneficiary_name VARCHAR(100),
  transaction_amount DECIMAL NOT NULL,
  CONSTRAINT fk_transaction
    FOREIGN KEY (transaction_type_id)
    REFERENCES transaction(transaction_type_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_category
    FOREIGN KEY (category_id)
    REFERENCES category (category_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_date_dimension
    FOREIGN KEY (transaction_date)
    REFERENCES date_dimension (transaction_date)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- Add a new column with auto-incrementing behavior
ALTER TABLE transaction_facts
ADD COLUMN id SERIAL PRIMARY KEY;
