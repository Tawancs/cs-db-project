create function show_service_records(p_company_id integer)
    returns TABLE
            (
                company_name         character varying,
                service_name         character varying,
                appointment_detail   character varying,
                lead_mechanic_name   character varying,
                record_type          character varying,
                cost                 integer,
                duration_minutes     integer,
                received_date        date,
                expected_finish_date date,
                status               character varying
            )
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT c.name::VARCHAR                               AS company_name,
               s.name::VARCHAR                               AS service_name,
               COALESCE(a.details, 'N/A')::VARCHAR           AS appointment_detail,
               (e.first_name || ' ' || e.last_name)::VARCHAR AS lead_mechanic_name,

               sr.type,
               sr.cost,
               sr.duration,
               sr.received_date,
               sr.expected_finish_date,
               sr.status

        FROM "service_record" sr
                 JOIN "service" s ON sr.service_id = s.id
                 JOIN "company" c ON s.company_id = c.id
                 JOIN "appointment" a ON sr.appointment_id = a.id
                 LEFT JOIN "employee" e ON sr.lead_mechanic_id = e.id

        WHERE s.company_id = p_company_id
        ORDER BY sr.received_date DESC;
END;
$$;

alter function show_service_records(integer) owner to sc_db_project_user;

