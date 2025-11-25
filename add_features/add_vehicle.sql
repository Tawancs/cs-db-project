-- auto-generated definition
create function add_vehicle(p_owner_id integer, p_brand character varying, p_model character varying, p_year integer, p_license_plate character varying, p_vin character varying, p_mileage integer) returns integer
    language plpgsql
as
$$
DECLARE
    new_id INT;
BEGIN
    INSERT INTO "vehicle" (
        owner_id, brand, model, year, license_plate, vin, mileage
    )
    VALUES (
               p_owner_id, p_brand, p_model, p_year, p_license_plate, p_vin, p_mileage
           )
    RETURNING id INTO new_id;

    RETURN new_id;

EXCEPTION
    WHEN unique_violation THEN
        RAISE EXCEPTION 'Vehicle creation failed: License Plate or VIN already exists.';
END;
$$;

alter function add_vehicle(integer, varchar, varchar, integer, varchar, varchar, integer) owner to sc_db_project_user;

