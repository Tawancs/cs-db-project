create table transaction
(
    transaction_id serial
        primary key,
    appointment_id integer
        constraint fk_trans_appointment
            references appointment
            on delete set null,
    service_id     integer
        constraint fk_trans_service
            references service
            on delete set null,
    amount         numeric(15, 2) not null,
    currency       varchar(10) default 'THB'::character varying,
    payment_method varchar(50)    not null,
    reference_id   varchar(50),
    description    text,
    created_at     timestamp   default CURRENT_TIMESTAMP
);

alter table transaction
    owner to sc_db_project_user;


