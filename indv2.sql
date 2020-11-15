use TaskManager;

-- Interogari
-- select * from Time_log where
-- project_id = any(select project_id from Users_Projects where user_id = any(select id from User where username = 'emilylindsey@haynes.com'))
-- and author_id = any(select id from User where username = 'emilylindsey@haynes.com');

-- Scheme
-- create schema admin_schema;
-- create table admin_schema.Task (
-- 	id int primary key not null,
-- 	created_by int not null,
--     created_time datetime,
--     title varchar(255)
-- );
-- select * from admin_schema.Task;
-- select * from Task;

-- create schema user_data_schema;
-- create table user_data_schema.User(
-- 	id int primary key not null,
--     first_name varchar(255),
--     last_name varchar(255),
--     username varchar(255) unique not null,
--     password varchar(255) not null,
--     photo varchar(255)
-- )
-- select * from user_data_schema.User;
-- select * from User;

-- Sinonime
-- create synonym AdminTask for admin_schema.Task;
-- select * from AdminTask;

-- create synonym AdvencedUser for user_data_schema.User;
-- select * from AdvencedUser;

-- Vederi
-- create or replace view ActivesTasks as
-- select * from Task t where not exists(select task_id from Closed_Task ct where t.id = ct.task_id);
-- select * from ActivesTasks;

-- create or replace view MyProjects as
-- select Project.id, UserUser.username, Users_Projects.role
-- from Users_Projects
-- inner join Project on Users_Projects.project_id = Project.id
-- inner join User on Users_Projects.user_id = User.id
-- where user_id = any(select id from User where username = 'emilylindsey@haynes.com');
-- select * from MyProjects

-- create or replace view MyCamrads as
-- select * from User where 
-- exists(
-- 	select id 
--     from Users_Projects 
--     where user_id=User.id 
--     and project_id in (
-- 		select project_id 
--         from Users_Projects 
--         where user_id = any(select id from User where username = 'emilylindsey@haynes.com')
-- 	)
-- );
-- select * from MyCamrads;

-- Proceduri
-- delimiter //
-- create procedure task_by_username
-- (in in_username char(200))
-- begin
--   select * from Task
--   where created_by = any(select id from User where username = in_username);
-- end //
-- delimiter ;
-- call task_by_username('emilylindsey@haynes.com')

-- delimiter //
-- create procedure likes_projects_by_username
-- (in in_username char(200))
-- begin
--   select * from Project_like
--   inner join User on Project_like.user_id = User.id
--   inner join Project on Project_like.project_id = Project.id
--   where User.username = in_username;
-- end //
-- delimiter ;
-- call likes_projects_by_username('emilylindsey@haynes.com');
  
-- Tranzactii