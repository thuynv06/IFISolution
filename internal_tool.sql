CREATE SCHEMA `internal_tool` DEFAULT CHARACTER SET utf8 ;
  
create table role
(
  role_id   BIGINT not null,
  role_name VARCHAR(30) not null
) ;

alter table role
  add constraint APP_ROLE _PK primary key ( role_id);
 
alter table role
  add constraint APP_ROLE_UK unique (role_name);
  
create table user_role
(
  user_role_id  BIGINT not null,
  employee_id BIGINT not null,
  role_id BIGINT not null
);
--  

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

create table `internal_tool`.`group` (
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
    end_date date 
);
  

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
alter table user_role
  add constraint USER_ROLE_PK primary key (user_role_id);
 
alter table user_role
  add constraint USER_ROLE_UK unique (employee_id, role_id);
 
alter table user_role
  add constraint USER_ROLE_FK1 foreign key (employee_id)
  references employee (employee_id);
 
alter table user_role
  add constraint USER_ROLE_FK2 foreign key (role_id)
  references role (role_id);

alter table employee
  add constraint EMPlOYEE_PK primary key (employee_id);
alter table employee
  add constraint Employee_UK unique (username);
  
alter table employee
  add constraint employee_group_FK1 foreign key (group_id)
  references `internal_tool`.`group` (group_id);
  
alter table project
  add constraint project_PK primary key (project_id);
	alter table project
    
add constraint project_FK1 foreign key (group_id)
  references `internal_tool`.`group` (group_id);
  
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
  
  create table vacation(
vacation_id bigint not null auto_increment,
employee_id bigint not null,
from_date date not null,
to_date date not null,
vacation_type bigint not null,
description text,
status int default 1,
created_at date not null,
updated_at date ,
next_approved_id bigint not null,
PRIMARY KEY ( vacation_id )
);
ALTER TABLE vacation
ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id) On delete cascade;  

ALTER TABLE vacation
ADD FOREIGN KEY (vacation_type) REFERENCES vacation_type(vacation_type_id) On delete cascade;
create table vacation_type(
	vacation_type_id bigint NOT NULL auto_increment,
	name varchar(50) NOT NULL,
    PRIMARY KEY ( vacation_type_id )
);

create table vacation_approved_history(
	vacation_approved_history_id bigint NOT NULL,
	name varchar(50) NOT NULL,
    PRIMARY KEY ( vacation_approved_history_id )
);

  create table vacation(
vacation_id bigint not null auto_increment,
employee_id bigint not null,
from_date date not null,
to_date date not null,
vacation_type bigint not null,
description text,
status int default 1,
created_at date not null,
updated_at date ,
next_approved_id bigint not null,
PRIMARY KEY ( vacation_id )
);

ALTER TABLE vacation
ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id) On delete cascade;  

ALTER TABLE vacation
ADD FOREIGN KEY (vacation_type) REFERENCES vacation_type(vacation_type_id) On delete cascade;

create table vacation_type(
	vacation_type_id bigint NOT NULL auto_increment,
	name varchar(50) NOT NULL,
    PRIMARY KEY ( vacation_type_id )
);

create table vacation_approved_history(
	vacation_approved_history_id bigint NOT NULL,
	name varchar(50) NOT NULL,
    PRIMARY KEY ( vacation_approved_history_id )
);



INSERT INTO `internal_tool`.`role` (`role_id`, `role_name`) VALUES ('1', 'ROLE_ADMIN');
INSERT INTO `internal_tool`.`role` (`role_id`, `role_name`) VALUES ('2', 'ROLE_USER');


INSERT INTO `internal_tool`.`employee` (`employee_id`, `username`, `password`, `is_active`, `code`, `group_id`, `fullname`, `email`, `address`, `age`, `phone`) 
VALUES ('1', 'dbuser1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', '1', 'N001', 'N1', 'Nguyễn Văn A', 'a@gmail.com', 'Nguyễn Văn A', '21', '0968160693');

INSERT INTO `internal_tool`.`employee` (`employee_id`, `username`, `password`, `is_active`, `code`, `group_id`, `fullname`, `email`, `address`, `age`, `phone`) 
VALUES ('2', 'dbuser2', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', '1', 'N002', 'N2', 'Nguyễn Văn B', 'a@gmail.com', 'Nguyễn Văn A', '21', '0968160693');


INSERT INTO `internal_tool`.`project` (`project_id`, `name`, `group_id`, `status`, `desciption`, `start_date`) VALUES ('1', 'Project Internal', 'N1', '1', 'Project Internal', '2018-05-01');
INSERT INTO `internal_tool`.`project` (`project_id`, `name`, `group_id`, `status`, `desciption`, `start_date`) VALUES ('2', 'Project external', 'N2', '1', 'Project external', '2018-05-05');
INSERT INTO `internal_tool`.`project` (`project_id`, `name`, `group_id`, `status`, `desciption`, `start_date`) VALUES ('3', 'Project IOT', 'N1', '1', 'Project IOT', '2018-05-02');

  