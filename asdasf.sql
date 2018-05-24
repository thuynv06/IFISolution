CREATE SCHEMA `internal_tool` DEFAULT CHARACTER SET utf8 ;

create table app_user
(
  user_id           BIGINT not null,
  user_name         VARCHAR(36) not null,
  password VARCHAR(128) not null,
  enabled           BIT not null 
) ;

alter table app_user
  add constraint APP_USER_PK primary key (user_id);
 
alter table app_user
  add constraint APP_USER_UK unique (user_name);
  
create table app_role
(
  role_id   BIGINT not null,
  role_name VARCHAR(30) not null
) ;

alter table app_role
  add constraint APP_ROLE_PK primary key ( role_id);
 
alter table app_role
  add constraint APP_ROLE_UK unique (role_name);
  
create table user_role
(
  id      BIGINT not null,
  user_id BIGINT not null,
  role_id BIGINT not null
);
--  
alter table user_role
  add constraint USER_ROLE_PK primary key (id);
 
alter table user_role
  add constraint USER_ROLE_UK unique (user_id, role_id);
 
alter table user_role
  add constraint USER_ROLE_FK1 foreign key (user_id)
  references app_user (user_id);
 
alter table user_role
  add constraint USER_ROLE_FK2 foreign key (role_id)
  references app_role (role_id);

CREATE TABLE Persistent_Logins (
 
    username varchar(64) not null,
    series varchar(64) not null,
    token varchar(64) not null,
    last_used timestamp not null,
    PRIMARY KEY (series)
     
);


create table employee (
	employee_id bigint not null,
    name varchar(50),
    group_id varchar(5),
    address varchar(100),
    age int 
);
alter table employee
  add constraint EMPlOYEE_PK primary key (employee_id);
  
INSERT INTO `internal_tool`.`employee` (`employee_id`, `name`, `group_id`, `address`, `age`) VALUES ('1', 'Nguyễn Văn Hoàng', 'N1', 'Thanh Hóa', '23');

  
CREATE TABLE `internal_tool`.`group` (
  `id` VARCHAR(5) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));
  
  create table project (
	project_id bigint not null,
    name varchar(100) not null,
    group_id varchar(5),
    status tinyint default 0,
    desciption varchar(1000),
    create_at date not null,
    end_at date
);
alter table project
  add constraint PROJECT_PK primary key (project_id);
  
  INSERT INTO `internal_tool`.`project` (`project_id`, `name`, `group_id`, `status`, `desciption`, `create_at`) 
  VALUES ('1', 'Project Internal', '1', '0', 'project internal', '2018-05-02');
  
  select * from project;
create table employee_project
(
	id bigint not null,
	project_id bigint not null,
    employee_id bigint not null,
    status tinyint default 0,
    completed float,
    expect float not null,
    create_at 	date not null,
    end_date date,
    next_user_id bigint
);

alter table employee_project
  add constraint EMPLOYEE_PROJECT_PK primary key (id);
  
alter table employee_project
  add constraint EMPLOYEE_PROJECT_UK unique (project_id, employee_id);
 
alter table employee_project
  add constraint EMPLOYEE_PROJECT_FK1 foreign key (employee_id)
  references internal_tool.employee (employee_id);
  
alter table employee_project
  add constraint EMPLOYEE_PROJECT_FK2 foreign key (project_id)
  references project (project_id);
  
  CREATE TABLE `vacation_type` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
);
alter table vacation_type
  add constraint vacation_type_PK primary key (id);

INSERT INTO `vacation_type` (`id`, `name`) VALUES(1, 'paid'),(2, 'unpaid');

CREATE TABLE `vacation` (
  `id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `vacation_type` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `next_approved_user_id` bigint(20) NOT NULL
);

ALTER TABLE `vacation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacation_type` (`vacation_type`),
  ADD KEY `project_id` (`project_id`,`employee_id`);

INSERT INTO `vacation` (`id`, `project_id`, `employee_id`, `from_date`, `to_date`, `vacation_type`, `description`, `status`, `created_at`, `next_approved_user_id`) VALUES
(1, 1, 1, '2018-05-25', '2018-05-26', 1, 'friend wedding!', 0, '2018-05-24', '0000-00-00', 0);
  
  
  
  
  
  
  
  
  
  
