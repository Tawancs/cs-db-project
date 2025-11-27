create function add_service_record(p_service_id integer, p_appointment_id integer, p_lead_mechanic_id integer,
                                   p_type character varying, p_cost integer, p_duration integer, p_received_date date,
                                   p_expected_finish_date date,
                                   p_status character varying DEFAULT 'in progress'::character varying) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "service_record" (service_id, appointment_id, lead_mechanic_id, type, cost,
                                  duration, received_date, expected_finish_date, status)
    VALUES (p_service_id, p_appointment_id, p_lead_mechanic_id, p_type, p_cost,
            p_duration, p_received_date, p_expected_finish_date, p_status);
END;
$$;

alter function add_service_record(integer, integer, integer, varchar, integer, integer, date, date, varchar) owner to sc_db_project_user;

