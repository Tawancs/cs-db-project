-- auto-generated definition
create function add_service(p_company_id integer, p_appointment_id integer, p_lead_mechanic_id integer, p_type character varying, p_cost integer, p_duration integer, p_received_date date, p_expected_finish_date date) returns integer
    language plpgsql
as
$$
DECLARE
    new_service_id INT;
BEGIN
    INSERT INTO "service" (
        company_id, appointment_id, lead_mechanic_id,
        type, cost, duration, received_date, expected_finish_date
        -- status defaults to 'in progress'
    )
    VALUES (
               p_company_id, p_appointment_id, p_lead_mechanic_id,
               p_type, p_cost, p_duration, p_received_date, p_expected_finish_date
           )
    RETURNING id INTO new_service_id;

    RETURN new_service_id;
END;
$$;

alter function add_service(integer, integer, integer, varchar, integer, integer, date, date) owner to sc_db_project_user;

