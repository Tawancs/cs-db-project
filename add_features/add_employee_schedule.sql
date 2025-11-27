create function add_employee_schedule(p_employee_id integer, p_date date, p_start_time time without time zone, p_end_time time without time zone, p_status character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO employee_schedule (
        employee_id, date, start_time, end_time, status
    ) VALUES (
                 p_employee_id, p_date, p_start_time, p_end_time, p_status
             ) RETURNING schedule_id INTO v_id;
    RETURN v_id;
END;
$$;

alter function add_employee_schedule(integer, date, time, time, varchar) owner to sc_db_project_user;

