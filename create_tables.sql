create table TaskManager;

use TaskManager;

create table User
(
	id int primary key,
    first_name varchar(20),
    last_name varchar(20),
    username varchar(20) unique,
    password varchar(20)
);