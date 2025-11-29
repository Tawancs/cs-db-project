create table customer
(
    id           serial
        primary key,
    username     varchar(50)  not null
        unique,
    display_name varchar(50)  not null,
    first_name   varchar(50)  not null,
    middle_name  varchar(50),
    last_name    varchar(50)  not null,
    address      varchar(255) not null,
    city         varchar(100) not null,
    postal_code  varchar(20)  not null,
    email        varchar(100) not null
        unique,
    telephone_no varchar(10)  not null,
    password     varchar(255) not null
);

alter table customer
    owner to sc_db_project_user;


