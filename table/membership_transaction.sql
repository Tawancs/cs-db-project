create table membership_transaction
(
    id             serial
        primary key,
    customer_id    integer        not null
        constraint fk_mtransaction_customer
            references customer
            on delete cascade,
    amount         numeric(15, 2) not null,
    currency       varchar(10) default 'THB'::character varying,
    payment_method varchar(50),
    reference_id   varchar(50),
    description    text,
    purchased_date date        default CURRENT_DATE,
    expired_date   date
);

alter table membership_transaction
    owner to sc_db_project_user;


