create function remove_service(p_service_id integer) returns boolean
    language plpgsql
as
$$
DECLARE
    v_rows_deleted INT;
BEGIN
    DELETE FROM "service"
    WHERE id = p_service_id;

    -- Check if any row was actually removed
    GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;

    RETURN v_rows_deleted > 0;
END;
$$;

alter function remove_service(integer) owner to sc_db_project_user;

