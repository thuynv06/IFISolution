CREATE SCHEMA `internal_tool` DEFAULT CHARACTER SET utf8 ;


  
create table ROLE
(
  role_id   BIGINT not null,
  role_name VARCHAR(30) not null
) ;

alter table ROLE
  add constraint APP_ROLE_PK primary key ( role_id);
 
alter table ROLE
  add constraint APP_ROLE_UK unique (role_name);
  
create table user_role
(
  user_role_id      BIGINT not null,
  employee_id BIGINT not null,
  role_id BIGINT not null
);
--  
alter table USER_ROLE
  add constraint USER_ROLE_PK primary key (user_role_id);
 
alter table USER_ROLE
  add constraint USER_ROLE_UK unique (employee_id, role_id);
 
alter table USER_ROLE
  add constraint USER_ROLE_FK1 foreign key (employee_id)
  references employee (employee_id);
 
alter table USER_ROLE
  add constraint USER_ROLE_FK2 foreign key (role_id)
  references ROLE (role_id);

CREATE TABLE Persistent_Logins (
 
    username varchar(64) not null,
    series varchar(64) not null,
    token varchar(64) not null,
    last_used timestamp not null,
    PRIMARY KEY (series)
     
);


create table employee (
	employee_id bigint not null,
	username       VARCHAR(36) not null,
	password VARCHAR(128) not null,
    is_active boolean,
    code varchar(10),
    group_id varchar(5),
    fullname varchar(50),
    email varchar(50),
    address varchar(100),
    age int,
    phone varchar(11)
);
alter table employee
  add constraint EMPlOYEE_PK primary key (employee_id);
alter table employee
  add constraint Employee_UK unique (username);
  
   alter table employee
  add constraint employee_group_FK1 foreign key (group_id)
  references internal_tool.group (group_id);

create table internal_tool.group (
	group_id varchar(5) not null,
    name varchar(50) not null,
    PRIMARY KEY (group_id)
);
  
create table project (
	project_id bigint not null,
	name       VARCHAR(100) not null,
    group_id varchar(5),
    status boolean default 1,
    desciption text,
    start_date date not null,
    end_date date not null
);
  
 alter table project
  add constraint project_PK primary key (project_id);
  alter table project
  add constraint project_FK1 foreign key (group_id)
  references internal_tool.group (group_id);
  
  create table employee_project (
	emp_pro_id bigint not null,
    employee_id bigint not null,
	project_id bigint not null,
	month    int,
    year    int,
    status boolean default 1,
    expect float not null,
    start_date date not null,
    end_date date
);
  
 alter table employee_project
  add constraint employee_project_PK primary key (emp_pro_id);  
  
 alter table employee_project
  add constraint employee_project_UK unique (employee_id, project_id); 
  
alter table employee_project
  add constraint employee_project_FK1 foreign key (employee_id)
  references employee (employee_id);
  
  alter table employee_project
  add constraint employee_project_FK2 foreign key (project_id)
  references project (project_id);
  
  select  from employee,user_role where employee.employee_id=user_role.employee_id;
  
  select role_name from user_role where employee.employee_id= employee_id;
  
  
  