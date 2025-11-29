create table membership_plan
(
    membership_plan_id serial
        primary key,
    company_id         integer        not null
        constraint fk_plan_company
            references company
            on delete cascade,
    name               varchar(100)   not null,
    detail             varchar(255),
    rank               integer        not null,
    price              numeric(15, 2) not null,
    duration           integer        not null,
    is_active          boolean default true
);

alter table membership_plan
    owner to sc_db_project_user;


