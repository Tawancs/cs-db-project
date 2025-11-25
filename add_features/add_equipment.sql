-- auto-generated definition
create function add_equipment(p_company_id integer, p_part_number character varying, p_name character varying, p_serial_number character varying, p_purchase_cost numeric, p_retail_price numeric, p_last_service_date date, p_category character varying, p_quantity integer, p_next_service_date date, p_status character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_id INT;
BEGIN
    INSERT INTO "equipment" (
        company_id, part_number, name, serial_number,
        purchase_cost, retail_price, last_service_date, category,
        quantity, next_service_data, status
    )
    VALUES (
               p_company_id, p_part_number, p_name, p_serial_number,
               p_purchase_cost, p_retail_price, p_last_service_date, p_category,
               p_quantity, p_next_service_date,
               COALESCE(p_status, 'active') -- Use provided status or default to 'active'
           )
    RETURNING id INTO new_id;

    RETURN new_id;
END;
$$;

alter function add_equipment(integer, varchar, varchar, varchar, numeric, numeric, date, varchar, integer, date, varchar) owner to sc_db_project_user;

