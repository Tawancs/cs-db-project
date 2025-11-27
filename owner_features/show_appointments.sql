create function show_appointments(p_company_id integer)
    returns TABLE(appointment_id integer, customer_name text, vehicle_info text, date_str text, time_str text, service_detail character varying, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            a.id AS appointment_id,
            (c.first_name || ' ' || c.last_name)::TEXT,
            (v.brand || ' ' || v.model)::TEXT,
            to_char(a.appointment_date, 'MM/DD/YYYY')::TEXT,
            to_char(a.appointment_date, 'HH12:MI AM')::TEXT,
            a.details,
            a.status
        FROM "appointment" a
                 JOIN "vehicle" v ON a.vehicle_id = v.id
                 JOIN "customer" c ON v.owner_id = c.id
        WHERE a.company_id = p_company_id

        ORDER BY
            CASE
                WHEN a.status = 'pending' THEN 1
                WHEN a.status = 'accepted' THEN 2
                ELSE 3
                END ,
            a.appointment_date;
END;
$$;

alter function show_appointments(integer) owner to sc_db_project_user;

