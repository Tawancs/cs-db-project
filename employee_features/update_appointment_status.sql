create function update_appointment_status(p_appointment_id integer, p_new_status character varying) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE "appointment"
    SET status = p_new_status
    WHERE id = p_appointment_id;
END;
$$;

alter function update_appointment_status(integer, varchar) owner to sc_db_project_user;

