create database TaskManager;

use TaskManager;

create table User
(
	id int primary key not null,
    first_name varchar(20),
    last_name varchar(20),
    username varchar(20) unique not null,
    password varchar(20) not null
);

create table Project
(
	id int primary key not null,
	created_by int not null,
    description varchar(399),
    FOREIGN KEY (created_by) REFERENCES User(id)
);

create table Users_Projects
(
	id int primary key not null,
	user_id int not null,
    project_id int not null,
    role varchar(300),
    
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (project_id) REFERENCES Project(id)
);

create table Project_like
(
	id int primary key not null,
	user_id int not null,
    project_id int not null,
    
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (project_id) REFERENCES Project(id)
);

-- create table Task
-- (
-- 	id int primary key not null,
-- 	created_by int not null,
--     created_time datetime,
--     title varchar(399),
--     description varchar(399),
--     status boolean,
--     parent int,
--     project int,
--     
--     FOREIGN KEY (parent) REFERENCES Task(id),
--     FOREIGN KEY (project) REFERENCES Project(id)
-- );

-- create table Closed_Task
-- (
-- 	id int primary key not null,
-- 	task_id int not null,
--     user_id int not null,
--     closed boolean default false,
--     closed_time datetime,
--     
--     FOREIGN KEY (task_id) REFERENCES Task(id),
--     FOREIGN KEY (user_id) REFERENCES User(id)
-- );

-- create table Comments
-- (
-- 	id int primary key not null,
-- 	author_id int not null,
--     content varchar(300),
--     created_time datetime,
--     task_id int not null,
--     
--     FOREIGN KEY (author_id) REFERENCES User(id),
--     FOREIGN KEY (task_id) REFERENCES Task(id)
-- );

-- create table Stage
-- (
-- 	id int primary key not null,
-- 	author_id int not null,
--     title varchar(300),
--     description varchar(300),
--     end_time datetime,
--     status varchar(300),
--     project_id int not null,
--     
--     FOREIGN KEY (author_id) REFERENCES User(id),
--     FOREIGN KEY (project_id) REFERENCES Project(id)
-- )

-- create table Message
-- (
-- 	id int primary key not null,
-- 	author_id int not null,
--     project_id int not null,
--     title varchar(300),
--     content varchar(300),
--     created_date datetime,
--     is_seen boolean default false,
-- 	
--     FOREIGN KEY (author_id) REFERENCES User(id),
--     FOREIGN KEY (project_id) REFERENCES Project(id)
-- );

-- create table Time_log
-- (
-- 	id int primary key not null,
-- 	author_id int not null,
--     project_id int not null,
--     description varchar(300),
--     start_date datetime,
--     end_date datetime,
--     task_id int not null,
-- 	
--     FOREIGN KEY (author_id) REFERENCES User(id),
--     FOREIGN KEY (project_id) REFERENCES Project(id),
--     FOREIGN KEY (task_id) REFERENCES Task(id)
-- );

-- create table Agend
-- (
-- 	id int primary key not null,
-- 	author_id int not null,
--     project_id int not null,
--     title varchar(300),
--     content varchar(300),
--     created_date datetime,
--     last_update_date datetime,
--     last_update_user_id int,
--     version int default 1,
-- 	
--     FOREIGN KEY (author_id) REFERENCES User(id),
--     FOREIGN KEY (project_id) REFERENCES Project(id),
--     FOREIGN KEY (last_update_user_id) REFERENCES User(id)
-- );

-- create table Link
-- (
-- 	id int primary key not null,
-- 	author_id int not null,
--     project_id int not null,
--     title varchar(300),
--     content varchar(300),
--     link varchar(300),
--     created_date datetime,
-- 	
--     FOREIGN KEY (author_id) REFERENCES User(id),
--     FOREIGN KEY (project_id) REFERENCES Project(id)
-- );

-- create table Notification
-- (
-- 	id int primary key not null,
-- 	user_id int not null,
--     task_id int,
--     title varchar(300),
--     content varchar(300),
--     created_date datetime,
--     is_seen boolean default false,
-- 	
--     FOREIGN KEY (user_id) REFERENCES User(id),
--     FOREIGN KEY (task_id) REFERENCES Task(id)
-- );







