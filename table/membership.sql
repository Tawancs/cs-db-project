create table membership
(
    customer_id        integer not null
        constraint fk_mem_customer
            references customer
            on delete cascade,
    membership_plan_id integer not null
        constraint fk_mem_plan
            references membership_plan
            on delete cascade,
    purchased_date     date default CURRENT_DATE,
    expired_date       date    not null,
    primary key (customer_id, membership_plan_id)
);

alter table membership
    owner to sc_db_project_user;


