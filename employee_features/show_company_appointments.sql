create function show_company_appointments(p_company_id integer)
    returns TABLE(appointment_date timestamp without time zone, customer_name text, contact_number character varying, vehicle_info text, details character varying, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            a.appointment_date,
            -- Combine First/Last name
            (c.first_name || ' ' || c.last_name)::TEXT AS customer_name,
            c.telephone_no,
            -- Combine Car Brand/Model/Plate
            (v.brand || ' ' || v.model || ' [' || v.license_plate || ']')::TEXT AS vehicle_info,
            a.details,
            a.status
        FROM "appointment" a
                 JOIN "vehicle" v ON a.vehicle_id = v.id
                 JOIN "customer" c ON v.owner_id = c.id
        WHERE a.company_id = p_company_id
        ORDER BY CASE
                     WHEN a.status = 'pending' THEN 1
                     ELSE 2
                     END,
            a.appointment_date;
END;
$$;

alter function show_company_appointments(integer) owner to sc_db_project_user;

