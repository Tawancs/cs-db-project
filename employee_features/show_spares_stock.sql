create function show_spares_stock(p_company_id integer)
    returns TABLE(part_number character varying, name character varying, description character varying, quantity integer, price numeric, location character varying, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            s.part_number,
            s.name,
            s.description,
            s.quantity,
            s.retail_price,
            s.location,
            (CASE
                 WHEN s.quantity = 0 THEN 'OUT OF STOCK'      -- Priority 1: No items left
                 WHEN s.quantity < s.reorder_level THEN 'Reorder Required' -- Priority 2: Below limit
                 ELSE 'In Stock'                              -- Priority 3: All good
            END)::VARCHAR AS status

        FROM "spares" AS s
        WHERE s.company_id = p_company_id
        ORDER BY s.quantity; -- Puts 'OUT OF STOCK' items at the very top
END;
$$;

alter function show_spares_stock(integer) owner to sc_db_project_user;

