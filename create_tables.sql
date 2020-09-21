create table TaskManager;

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
    
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (project_id) REFERENCES Project(id)
);

create table Project_linke
(
	id int primary key not null,
	user_id int not null,
    project_id int not null,
    
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (project_id) REFERENCES Project(id)
);

create table Task
(
	id int primary key not null,
	created_by int not null,
    created_time datetime,
    title varchar(399),
    description varchar(399),
    status boolean,
    parent int,
    project int,
    
    FOREIGN KEY (parent) REFERENCES Task(id),
    FOREIGN KEY (project) REFERENCES Project(id)
);

create table Task_Participants
(
	task_id int not null,
    user_id int not null,
    closed boolean default false,
    
    FOREIGN KEY (task_id) REFERENCES Task(id),
    FOREIGN KEY (user_id) REFERENCES User(id)
)
