drop table if exists choice;
drop table if exists criteria;
drop table if exists decision;

CREATE TABLE decision (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(200),
status VARCHAR(30),
creation_dt TIMESTAMP
);

CREATE TABLE choice (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
decision_id INT(6),
name VARCHAR(30) NOT NULL,
description VARCHAR(200) NOT NULL,
status VARCHAR(30),
creation_dt TIMESTAMP
);

CREATE TABLE criteria (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
decision_id INT(6),
name VARCHAR(30) NOT NULL,
description VARCHAR(200) NOT NULL,
status VARCHAR(30),
creation_dt TIMESTAMP
);
