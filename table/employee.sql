create table employee
(
    id              serial
        primary key,
    company_id      integer,
    username        varchar(50)  not null
        unique,
    first_name      varchar(50)  not null,
    middle_name     varchar(50),
    last_name       varchar(50)  not null,
    address         varchar(255) not null,
    city            varchar(100) not null,
    postal_code     varchar(20)  not null,
    email           varchar(100) not null
        unique,
    telephone_no    varchar(10)  not null,
    specialize      varchar(100) not null,
    password        varchar(255) not null,
    salary          numeric(15, 2) default 15000.00,
    hire_date       date           default CURRENT_DATE,
    contract_type   varchar(50)    default 'Full-Time'::character varying,
    contract_period varchar(50)
);

alter table employee
    owner to sc_db_project_user;


