-- auto-generated definition
create function add_spares(p_company_id integer, p_part_number character varying, p_name character varying, p_description character varying, p_purchase_cost numeric, p_retail_price numeric, p_quantity integer, p_expired_date date, p_reorder_level integer, p_location character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_spare_id INT;
BEGIN
    INSERT INTO "spares" (
        company_id,
        part_number,
        name,
        description,
        purchase_cost,
        retail_price,
        quantity,
        expired_date,
        reorder_level,
        location
        -- purchased_date is omitted -> defaults to CURRENT_DATE
    )
    VALUES (
               p_company_id,
               p_part_number,
               p_name,
               p_description,
               p_purchase_cost,
               p_retail_price,
               p_quantity,
               p_expired_date,
               p_reorder_level,
               p_location
           )
    RETURNING id INTO new_spare_id;

    RETURN new_spare_id;
END;
$$;

alter function add_spares(integer, varchar, varchar, varchar, numeric, numeric, integer, date, integer, varchar) owner to sc_db_project_user;

