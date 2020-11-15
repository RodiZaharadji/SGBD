import random
import time
import datetime
from faker import Faker

faker = Faker()
records = 500000
database_name = 'TaskManager'

def populate_users():
	table_name = 'User'
	rez = f'insert into {database_name}.{table_name} values\n'
	start_index = 700105
	for i in range(records):
		rez += f"({i+start_index}, '{faker.first_name()}', '{faker.last_name()}', '{faker.email()}{i+start_index}', '{faker.password()}'),\n"
	rez += f"({i+start_index+1}, 'admin', 'admin', 'admin{i+start_index+1}@mail.com', 'qwe123');"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	# print(rez)


def populate_projects():
	table_name = 'Project'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		rez += f"({i+1}, {random.randrange(1, records)}, '{faker.text()}'),\n"
	rez += f"({i+2}, 101, 'admin project');"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_users_projects():
	table_name = 'Users_Projects'
	roles = ['admin', 'programmer', 'manager', 'client']
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		rez += f"({i+1}, {random.randrange(1, records)}, {random.randrange(1, records)}, '{random.choice(roles)}'),\n"
	rez += f"({i+2}, 101, 101, 'admin');"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_project_like():
	table_name = 'Project_like'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		rez += f"({i+1}, {random.randrange(1, records)}, {random.randrange(1, records)}),\n"
	rez += f"({i+2}, 101, 101);"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_tasks():
	table_name = 'Task'
	f = '%Y-%m-%d %H:%M:%S'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		rez += f"({i+1}, {random.randrange(1, records)}, '{time.strftime(f, time.localtime())}', '{faker.bothify(text='Task: ????-########')}', '{faker.text()}', 0, {random.randrange(1, i) if (random.randrange(0,2)==0 and i>1) else 'null'}, {random.randrange(1, records)}),\n"
	rez += f"({i+2}, 101, '{time.strftime(f, time.localtime())}', 'Admin task', 'Task by admin', 0, null, 101);"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)



def populate_closed_tasks():
	table_name = 'Closed_Task'
	f = '%Y-%m-%d %H:%M:%S'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		closed = random.choice(['true', 'false'])
		closed_time = f"'{time.strftime(f, time.localtime())}'" if closed == 'true' else 'null'
		rez += f"({i+1}, {random.randrange(1, records)}, {random.randrange(1, records)}, {closed}, {closed_time}),\n"
	rez += f"({i+2}, 101, 101, false, null);"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_comments():
	table_name = 'Comments'
	f = '%Y-%m-%d %H:%M:%S'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		rez += f"({i+1}, {random.randrange(1, records)}, '{faker.text()}', '{time.strftime(f, time.localtime())}', {random.randrange(1, records)}),\n"
	rez += f"({i+2}, 101, 'Admin comment', '{time.strftime(f, time.localtime())}', 101);"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_stages():
	table_name = 'Stage'
	f = '%Y-%m-%d %H:%M:%S'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		tm = datetime.datetime.now()+datetime.timedelta(days=random.random()*10)
		random_time = tm.strftime(f)
		rez += f"({i+1}, {random.randrange(1, records)}, '{faker.bothify(text='Stage: ????-########')}', '{faker.text()}', '{random_time}', 'run', {random.randrange(1, records)}),\n"
	rez += f"({i+2}, 101, 'Admin stage', 'It is admin stage', '{random_time}', 'run', 101);"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_messages():
	table_name = 'Message'
	f = '%Y-%m-%d %H:%M:%S'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		rez += f"({i+1}, {random.randrange(1, records)}, {random.randrange(1, records)}, '{faker.bothify(text='Message: ????-########')}', '{faker.text()}', '{datetime.datetime.now().strftime(f)}', {random.choice(['true', 'false'])}),\n"
	rez += f"({i+2}, 101, 101, 'Admin message', 'It is admin messaje', '{datetime.datetime.now().strftime(f)}', {random.choice(['true', 'false'])});"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_times_logs():
	table_name = 'Time_log'
	f = '%Y-%m-%d %H:%M:%S'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		rez += f"({i+1}, {random.randrange(1, records)}, {random.randrange(1, records)}, '{faker.text()}', '{datetime.datetime.now().strftime(f)}', '{(datetime.datetime.now()+datetime.timedelta(minutes=random.random()*10)).strftime(f)}', {random.randrange(1, records)}),\n"
	rez += f"({i+2}, 101, 101, 'Admin timelog', '{datetime.datetime.now().strftime(f)}', '{(datetime.datetime.now()+datetime.timedelta(minutes=random.random()*10)).strftime(f)}', 101);"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_agend():
	table_name = 'Agend'
	f = '%Y-%m-%d %H:%M:%S'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		random_date = (datetime.datetime.now()+datetime.timedelta(minutes=random.random()*10)).strftime(f)
		rez += f"({i+1}, {random.randrange(1, records)}, {random.randrange(1, records)}, '{faker.bothify(text='Agend: ????-########')}','{faker.text()}', '{datetime.datetime.now().strftime(f)}', '{random_date}', {random.randrange(1, records)}, 1),\n"
	rez += f"({i+2}, 101, 101, 'Admin agend', 'It is admin agend', '{datetime.datetime.now().strftime(f)}', null, null, 1);"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_links():
	table_name = 'Link'
	f = '%Y-%m-%d %H:%M:%S'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		random_date = (datetime.datetime.now()+datetime.timedelta(minutes=random.random()*10)).strftime(f)
		rez += f"({i+1}, {random.randrange(1, records)}, {random.randrange(1, records)}, '{faker.bothify(text='Link: ????-########')}','{faker.text()}', '{faker.url()}', '{datetime.datetime.now().strftime(f)}'),\n"
	rez += f"({i+2}, 101, 101, 'Admin link', 'It is admin link', 'https://www.facebook.com/zaharadji.rodi/', '{datetime.datetime.now().strftime(f)}');"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)


def populate_notifications():
	table_name = 'Notification'
	f = '%Y-%m-%d %H:%M:%S'
	rez = f'insert into {database_name}.{table_name} values\n'
	for i in range(records):
		random_date = (datetime.datetime.now()+datetime.timedelta(minutes=random.random()*10)).strftime(f)
		rez += f"({i+1}, {random.randrange(1, records)}, {random.randrange(1, records)}, '{faker.bothify(text='Notification: ????-########')}','{faker.text()}', '{datetime.datetime.now().strftime(f)}', {random.choice(['true', 'false'])}),\n"
	rez += f"({i+2}, 101, 101, 'Admin notify', 'It is admin notify', '{datetime.datetime.now().strftime(f)}', {random.choice(['true', 'false'])});"
	
	f = open(f'Populate_{table_name}.sql', 'w')
	f.write(rez)

	print(rez)



populate_users()
# populate_projects()
# populate_users_projects()
# populate_project_like()

# populate_tasks()
# populate_closed_tasks()

# populate_comments()
# populate_stages()
# populate_messages()
# populate_times_logs()
# populate_agend()
# populate_links()
# populate_notifications()