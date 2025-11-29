create table service
(
    id                   serial
        primary key,
    company_id           integer
        constraint fk_service_company
            references company
            on delete set null,
    name                 varchar(50)    not null,
    detail               varchar(255)   not null,
    approximate_duration integer        not null,
    min_cost             numeric(10, 2) not null,
    max_cost             numeric(15, 2) not null
);

alter table service
    owner to sc_db_project_user;


