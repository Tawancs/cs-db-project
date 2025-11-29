create table subscription_plan
(
    subscription_id serial
        primary key,
    name            varchar(100)   not null,
    detail          text,
    rank            integer        not null,
    price           numeric(15, 2) not null,
    duration        integer default 30
);

alter table subscription_plan
    owner to sc_db_project_user;


