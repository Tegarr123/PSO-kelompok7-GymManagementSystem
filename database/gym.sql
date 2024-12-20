
drop database if exists gym;
create database if not exists gym;
use gym;
CREATE TABLE info(username VARCHAR(200), password VARCHAR(500), name VARCHAR(100), prof INT, street VARCHAR(100), city VARCHAR(50), phone VARCHAR(32), PRIMARY KEY(username));

CREATE TABLE plans(name VARCHAR(100), PRIMARY KEY(name));

CREATE TABLE receps(username VARCHAR(200), PRIMARY KEY(username), FOREIGN KEY(username) references info(username));

CREATE TABLE trainors(username VARCHAR(200), PRIMARY KEY(username), FOREIGN KEY(username) references info(username));

CREATE TABLE members(username VARCHAR(200), plan VARCHAR(100), trainor VARCHAR(200), PRIMARY KEY(username), FOREIGN KEY(username) references info(username), FOREIGN KEY(plan) references plans(name), FOREIGN KEY(trainor) references trainors(username));

ALTER TABLE info ADD time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE progress(username VARCHAR(200), date DATE, daily_result VARCHAR(200), time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY(username, date), FOREIGN KEY(username) references members(username));

create table equip(name VARCHAR(200), count int, PRIMARY KEY(name));

INSERT INTO info(username, password, name, prof, street, city, phone) VALUES('gym-admin', '$5$rounds=535000$vQSDVemvtw9CS9jC$cvAxCJEiKHBOLQ5cpq5eqB9aiXGbp3JHt/y0yKCZvC4', 'Rafli k', 1, 'Keputih', 'Surabaya', 9666585361);
INSERT INTO plans(name) values ('Plan_1');
-- admin's password is gym-password