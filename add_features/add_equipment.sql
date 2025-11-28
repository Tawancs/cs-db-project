create function add_equipment(p_company_id integer, p_name character varying, p_serial_number character varying,
                              p_purchase_cost numeric, p_last_service_date date, p_category character varying,
                              p_quantity integer, p_next_service_date date,
                              p_operational_status character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_id INT;
BEGIN
    INSERT INTO "equipment" (company_id, name, serial_number,
                             purchase_cost, last_service_date, category,
                             quantity, next_service_data, operational_status)
    VALUES (p_company_id, p_name, p_serial_number,
            p_purchase_cost, p_last_service_date, p_category,
            p_quantity, p_next_service_date,
            COALESCE(p_operational_status, 'operational') --
           )
    RETURNING id INTO new_id;

    RETURN new_id;
END;
$$;

alter function add_equipment(integer, varchar, varchar, numeric, date, varchar, integer, date, varchar) owner to sc_db_project_user;

