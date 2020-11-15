use TaskManager;

-- select * from User;
-- select * from Project;
-- select * from Project_like;
-- select * from Task;
-- select * from Closed_Task;
-- select * from Comments;
-- select * from Stage;
-- select * from Message;
-- select * from Agend;
-- select * from Link;
-- select * from Notification;

-- select Project.description, User.username 
-- from Project_like 
-- inner join Project on Project_like.project_id = Project.id 
-- inner join User on Project_like.user_id = User.id;

-- select * from Task
-- where parent = any(select id from Task where title = 'Task: toBu-80782335');

-- select Comments.content, User.username from Comments
-- inner join User on Comments.author_id = User.id
-- where task_id = any(select id from Task where title = 'Task: MBbG-21081284')
-- order by created_time;

-- select Notification.title, Notification.content, Notification.is_seen, Task.title
-- from Notification
-- inner join Task on Notification.task_id = Task.id
-- where user_id = any(select id from User where username = 'emilylindsey@haynes.com')
-- order by created_date;

create index user_idx on User(username, password);
create index project_idx on Project(description);
create index user_project_idx on Users_Projects(user_id, project_id);
create index project_like_idx on Project_like(project_id);
create index task_idx on Task(title, parent);
create index closed_task_idx on Closed_Task(task_id);
create index comments_idx on Comments(task_id, created_time);
create index stage_idx on Stage(title);
create index message_idx on Message(title);
create index time_log_idx on Time_log(author_id);
create index agend_idx on Agend(title);
create index link_idx on Link(title);
create index notification_idx on Notification(user_id);



