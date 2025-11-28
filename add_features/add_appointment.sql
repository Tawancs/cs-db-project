create function add_appointment(p_company_id integer, p_vehicle_id integer, p_details character varying,
                                p_appointment_date timestamp without time zone) returns integer
    language plpgsql
as
$$
DECLARE
    new_appointment_id INTEGER;
BEGIN
    INSERT INTO "appointment" (company_id, vehicle_id, details, appointment_date, status)
    VALUES (p_company_id, p_vehicle_id, p_details, p_appointment_date,
            'pending')
    RETURNING id INTO new_appointment_id;
    RETURN new_appointment_id;
END;
$$;

alter function add_appointment(integer, integer, varchar, timestamp) owner to sc_db_project_user;

