create table vehicle
(
    id            serial
        primary key,
    owner_id      integer
        constraint fk_vehicle_customer
            references customer
            on delete set null,
    brand         varchar(50) not null,
    model         varchar(50) not null,
    year          integer     not null,
    license_plate varchar(20) not null
        unique,
    vin           varchar(17) not null
        unique,
    mileage       integer     not null
);

alter table vehicle
    owner to sc_db_project_user;


