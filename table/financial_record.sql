create table financial_record
(
    record_id     serial
        primary key,
    company_id    integer not null
        constraint fk_fin_rec_company
            references company
            on delete cascade,
    month         integer not null,
    year          integer not null,
    total_revenue numeric(15, 2) default 0.00,
    net_income    numeric(15, 2) default 0.00,
    date_reported date           default CURRENT_DATE
);

alter table financial_record
    owner to sc_db_project_user;


