create table request_form
(
    request_id   serial
        primary key,
    company_id   integer
        constraint fk_req_company
            references company
            on delete cascade,
    first_name   varchar(50) not null,
    middle_name  varchar(50),
    last_name    varchar(50) not null,
    address      varchar(200),
    city         varchar(100),
    postal_code  varchar(20),
    email        varchar(100),
    telephone_no varchar(10),
    specialize   varchar(100)
);

alter table request_form
    owner to sc_db_project_user;


