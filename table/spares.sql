create table spares
(
    id             serial
        primary key,
    company_id     integer
        constraint fk_spares_company
            references company
            on delete cascade,
    part_number    varchar(15)    not null,
    name           varchar(50)    not null,
    description    varchar(100)   not null,
    purchase_cost  numeric(15, 2) not null,
    retail_price   numeric(15, 2) not null,
    quantity       integer default 1,
    expired_date   date,
    reorder_level  integer        not null,
    location       varchar(20),
    purchased_date date    default CURRENT_DATE
);

alter table spares
    owner to sc_db_project_user;


