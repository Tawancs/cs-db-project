create table employee_schedule
(
    schedule_id serial
        primary key,
    employee_id integer
        constraint fk_eschedule_employee
            references employee,
    date        date         not null,
    start_time  time         not null,
    end_time    time         not null,
    status      varchar(100) not null
);

alter table employee_schedule
    owner to sc_db_project_user;


