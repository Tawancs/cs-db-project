create function remove_vehicle(p_vin character varying) returns boolean
    language plpgsql
as
$$
DECLARE
    v_deleted_count INT;
BEGIN
    DELETE FROM "vehicle"
    WHERE vin = p_vin;

    -- Check if a row was actually deleted
    GET DIAGNOSTICS v_deleted_count = ROW_COUNT;

    -- Return TRUE if deleted, FALSE if not found or mismatch
    RETURN v_deleted_count > 0;
END;
$$;

alter function remove_vehicle(varchar) owner to sc_db_project_user;

