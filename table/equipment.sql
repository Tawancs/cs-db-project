create table equipment
(
    id                 serial
        primary key,
    company_id         integer
        constraint fk_equipment_company
            references company
            on delete cascade,
    name               varchar(50)    not null,
    serial_number      varchar(20)    not null,
    purchase_cost      numeric(15, 2) not null,
    last_service_date  date           not null,
    category           varchar(20)    not null,
    quantity           integer     default 1,
    purchased_date     date        default CURRENT_DATE,
    next_service_data  date        default CURRENT_DATE,
    operational_status varchar(20) default 'active'::character varying
);

alter table equipment
    owner to sc_db_project_user;


