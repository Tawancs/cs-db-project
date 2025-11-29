create table subscription_transaction
(
    transaction_id  serial
        primary key,
    subscription_id integer
        constraint fk_sub_trans_plan
            references subscription_plan,
    owner_id        integer
        constraint fk_sub_trans_owner
            references owner,
    amount          numeric(15, 2) not null,
    currency        varchar(10) default 'THB'::character varying,
    payment_method  varchar(50),
    reference_id    varchar(50),
    description     text,
    purchased_date  date        default CURRENT_DATE,
    expired_date    date           not null
);

alter table subscription_transaction
    owner to sc_db_project_user;


