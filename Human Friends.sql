DROP DATABASE IF EXISTS People_friends;
CREATE DATABASE People_friends;
USE People_friends;

DROP TABLE IF EXISTS animals;
CREATE TABLE animals (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	name_class VARCHAR(20)
);

INSERT INTO animals (name_class)
VALUES ('pet_animals'),
('pack_animals');  

DROP TABLE IF EXISTS pet_animals;
CREATE TABLE pet_animals (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_class INT,
    name_family VARCHAR(20),
    FOREIGN KEY (id_class)  REFERENCES animals(id)
);

DROP TABLE IF EXISTS pack_animals;
CREATE TABLE pack_animals (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_class INT,
    name_family VARCHAR(20),
    FOREIGN KEY (id_class)  REFERENCES animals(id)
);

INSERT INTO pet_animals (id_class, name_family)
VALUES (1, 'cat'),
(1, 'dog'),
(1, 'hamster');

INSERT INTO pack_animals (id_class, name_family)
VALUES (2, 'horse'),
(2, 'camel'),
(2, 'dankey');

DROP TABLE IF EXISTS cats;
CREATE TABLE cats (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_family INT,
    nickname VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    FOREIGN KEY (id_family)  REFERENCES pet_animals(id)
);

DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_family INT,
    nickname VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    FOREIGN KEY (id_family)  REFERENCES pet_animals(id)
);

DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_family INT,
    nickname VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    FOREIGN KEY (id_family)  REFERENCES pet_animals(id)
);

DROP TABLE IF EXISTS horses;
CREATE TABLE horses (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_family INT,
    nickname VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    FOREIGN KEY (id_family)  REFERENCES pack_animals(id)
);

DROP TABLE IF EXISTS camels;
CREATE TABLE camels (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_family INT,
    nickname VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    FOREIGN KEY (id_family)  REFERENCES pack_animals(id)
);

DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    id_family INT,
    nickname VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    FOREIGN KEY (id_family)  REFERENCES pack_animals(id)
);

INSERT INTO cats (id_family, nickname, birthday, commands)
VALUES (1, 'Shortbread', '2019-05-15', 'place, eat'),
(1, 'Caramel', '2020-02-20', 'place, play'),  
(1, 'Compote', '2020-06-30', 'place, purr');

INSERT INTO dogs (id_family, nickname, birthday, commands)
VALUES (2, 'Ball', '2020-01-01', 'place, fetch'),
(2, 'Bagel', '2018-12-10', 'sit, lie, stand'),
(2, 'Rex', '2019-11-11', 'sit, lie, stand');

INSERT INTO hamsters (id_family, nickname, birthday, commands)
VALUES (3, 'Fluff', '2022-03-10', 'play, sleep'),
(3, 'Scherlok', '2021-05-01', 'play');

INSERT INTO horses (id_family, nickname, birthday, commands)
VALUES (1, 'Fast', '2014-05-05', 'stand, step, golop'),
(1, 'White', '2015-03-01', 'stand, step, golop'),  
(1, 'Black', '2016-07-18', 'stand, step, golop');

INSERT INTO camels (id_family, nickname, birthday, commands)
VALUES (2, 'Smart', '2018-12-12', 'left, right'),
(2, 'Hardy', '2016-08-07', 'left, right'),
(2, 'Going', '2015-11-12', 'left, right');

INSERT INTO donkeys (id_family, nickname, birthday, commands)
VALUES (3, 'Stubborn', '2017-09-23', 'stand'),
(3, 'Funny', '2019-10-01', 'stand');

-- Удаление данных из таблицы "верблюды"
TRUNCATE camels;

-- объединение таблиц "лошади" и "ослы"
SELECT name_family, nickname, birthday, commands FROM horses
LEFT JOIN pack_animals ON id_family = pack_animals.id
UNION SELECT name_family, nickname, birthday, commands FROM donkeys
LEFT JOIN pack_animals ON id_family = pack_animals.id;

-- новая таблица для животных от 1 до 3 лет
DROP TABLE IF EXISTS all_animals;
CREATE TEMPORARY TABLE all_animals AS 
SELECT *, 'horse' AS name_family FROM horses
UNION SELECT *, 'donkey' AS name_family FROM donkeys
UNION SELECT *, 'dog' AS name_family FROM dogs
UNION SELECT *, 'cat' AS name_family FROM cats
UNION SELECT *, 'hamster' AS name_family FROM hamsters;

DROP TABLE IF EXISTS yang_animal;
CREATE TABLE yang_animal AS
SELECT nickname, birthday, commands, name_family, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS Age_in_month
FROM all_animals WHERE birthday BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
 
SELECT * FROM yang_animal;

-- объединение всех таблиц
SELECT name_class, name_family, nickname, birthday, commands FROM horses
LEFT JOIN pack_animals ON id_family = pack_animals.id
LEFT JOIN animals ON pack_animals.id_class = animals.id
UNION SELECT name_class, name_family, nickname, birthday, commands FROM donkeys
LEFT JOIN pack_animals ON id_family = pack_animals.id
LEFT JOIN animals ON pack_animals.id_class = animals.id
UNION SELECT name_class, name_family, nickname, birthday, commands FROM camels
LEFT JOIN pack_animals ON id_family = pack_animals.id
LEFT JOIN animals ON pack_animals.id_class = animals.id
UNION SELECT name_class, name_family, nickname, birthday, commands FROM cats
LEFT JOIN pet_animals ON id_family = pet_animals.id
LEFT JOIN animals ON pet_animals.id_class = animals.id
UNION SELECT name_class, name_family, nickname, birthday, commands FROM dogs
LEFT JOIN pet_animals ON id_family = pet_animals.id
LEFT JOIN animals ON pet_animals.id_class = animals.id
UNION SELECT name_class, name_family, nickname, birthday, commands FROM hamsters
LEFT JOIN pet_animals ON id_family = pet_animals.id
LEFT JOIN animals ON pet_animals.id_class = animals.id;

