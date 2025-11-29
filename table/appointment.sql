create table appointment
(
    id               serial
        primary key,
    vehicle_id       integer
        constraint fk_appointment_vehicle
            references vehicle,
    details          varchar(255),
    appointment_date timestamp not null,
    status           varchar(30) default 'pending'::character varying,
    company_id       integer
        constraint fk_appointment_company
            references company
);

alter table appointment
    owner to sc_db_project_user;


