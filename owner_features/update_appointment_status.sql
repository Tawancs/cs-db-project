create function update_appointment_status(p_appointment_id integer, p_new_status character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_rows_updated INTEGER;
BEGIN
    UPDATE "appointment"
    SET status = p_new_status
    WHERE id = p_appointment_id;
    GET DIAGNOSTICS v_rows_updated = ROW_COUNT;
    IF v_rows_updated > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$;

alter function update_appointment_status(integer, varchar) owner to sc_db_project_user;

