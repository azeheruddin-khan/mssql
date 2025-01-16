CREATE TABLE category (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    amount DECIMAL(10 , 2 )
);

INSERT INTO category(id, name, amount)
VALUES(1,'Children Bicycles',15000),
    (2,'Comfort Bicycles',25000),
    (3,'Cruisers Bicycles',13000),
    (4,'Cyclocross Bicycles',10000);


CREATE TABLE category_staging (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    amount DECIMAL(10 , 2 )
);


INSERT INTO category_staging(id, name, amount)
VALUES(1,'Children Bicycles',15000),
    (3,'Cruisers Bicycles',13000),
    (4,'Cyclocross Bicycles',20000),
    (5,'Electric Bikes',10000),
    (6,'Mountain Bikes',10000);


MERGE category t
 USING category_staging s
ON (s.id = t.id)
WHEN MATCHED
	THEN UPDATE SET
	t.name = s.name,
	t.amount = s.amount
WHEN NOT MATCHED BY TARGET
	THEN INSERT(id, name, amount)
	VALUES(s.id,s.name,s.amount)
WHEN NOT MATCHED BY SOURCE
	THEN DELETE ;



