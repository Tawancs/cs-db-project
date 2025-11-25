create function show_spares_available()
    returns TABLE(company_name character varying, item_name character varying, description character varying, quantity integer, price numeric, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            (SELECT c.name FROM company AS c
                WHERE c.id = s.company_id),
            s.name,
            s.description,
            s.quantity,
            s.retail_price,
            (CASE
                 WHEN s.quantity = 0 THEN 'OUT OF STOCK'      -- Priority 1: No items left
                 ELSE 'In Stock'                              -- Priority 2: All good
                END)::VARCHAR AS status

        FROM "spares" AS s
        ORDER BY s.quantity; -- Puts 'OUT OF STOCK' items at the very top
END;
$$;

alter function show_spares_available() owner to sc_db_project_user;

