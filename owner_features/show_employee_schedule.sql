create function show_employee_schedule(p_employee_id integer)
    returns TABLE(work_date text,
                  day_name text,
                  shift_time text,
                  status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            to_char(s.date, 'DD/MM/YYYY')::TEXT,
            TRIM(to_char(s.date, 'Day'))::TEXT,
            (to_char(s.start_time, 'HH24:MI') || ' - ' || to_char(s.end_time, 'HH24:MI'))::TEXT,
            s.status
        FROM employee_schedule s
        WHERE s.employee_id = p_employee_id
        ORDER BY s.date;
END;
$$;

alter function show_employee_schedule(integer) owner to sc_db_project_user;

