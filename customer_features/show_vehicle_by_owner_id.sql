create function show_vehicle_by_owner_id(p_owner_id integer)
    returns TABLE(p_brand character varying, p_model character varying, p_year integer, p_license_plate character varying, p_vin character varying, p_mileage integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            v.brand,
            v.model,
            v.year,
            v.license_plate,
            v.vin,
            v.mileage
        FROM "vehicle" v
        WHERE v.owner_id = p_owner_id;
END;
$$;

alter function show_vehicle_by_owner_id(integer) owner to sc_db_project_user;

