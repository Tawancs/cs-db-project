create table company
(
    id                   serial
        primary key,
    owner_id             integer
        constraint fk_company_owner
            references owner,
    name                 varchar(50)  not null,
    logo_url             varchar(255),
    address              varchar(255) not null,
    city                 varchar(100) not null,
    postal_code          varchar(20)  not null,
    capacity             integer      not null,
    open_time            time         not null,
    close_time           time         not null,
    social_media_contact varchar(50)  not null,
    ev_support           boolean default false
);

alter table company
    owner to sc_db_project_user;


