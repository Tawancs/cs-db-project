-- auto-generated definition
create function add_appointment(p_vehicle_id integer, p_details character varying, p_appointment_date timestamp without time zone) returns integer
    language plpgsql
as
$$
DECLARE
    new_appointment_id INT;
BEGIN
    INSERT INTO "appointment" (
        vehicle_id, details, appointment_date
    )
    VALUES (
               p_vehicle_id, p_details, p_appointment_date
           )
    RETURNING id INTO new_appointment_id;

    RETURN new_appointment_id;
END;
$$;

alter function add_appointment(integer, varchar, timestamp) owner to sc_db_project_user;

