create function show_equipment_detail(p_company_id integer)
    returns TABLE(serial_number character varying, name character varying, category character varying, last_service date, next_service date, day_remaining integer, maintenance_status character varying, operational_status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            e.serial_number,
            e.name,
            e.category,
            e.last_service_date,
            e.next_service_data,

            (e.next_service_data - CURRENT_DATE) AS day_remaining,

            (CASE
                 WHEN e.next_service_data < CURRENT_DATE THEN 'OVERDUE'
                 WHEN e.next_service_data = CURRENT_DATE THEN 'DUE TODAY'
                 WHEN (e.next_service_data - CURRENT_DATE) BETWEEN 1 AND 90 THEN 'Due Soon'
                 ELSE 'OK'
                END)::VARCHAR AS performance_status,
            e.operational_status

        FROM "equipment" AS e
        WHERE e.company_id = p_company_id
        ORDER BY day_remaining;
END;
$$;

alter function show_equipment_detail(integer) owner to sc_db_project_user;

