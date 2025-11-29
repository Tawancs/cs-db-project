create table service_record
(
    service_id           integer
        constraint fk_srecord_service
            references service,
    appointment_id       integer
        constraint fk_service_appointment
            references appointment,
    lead_mechanic_id     integer
        constraint fk_service_employee
            references employee,
    type                 varchar(100) not null,
    cost                 integer      not null,
    duration             integer      not null,
    received_date        date         not null,
    expected_finish_date date         not null,
    status               varchar(20) default 'in progress'::character varying
);

alter table service_record
    owner to sc_db_project_user;


