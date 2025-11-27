create function show_unavailable_spares(p_company_id integer)
    returns TABLE
            (
                part_number character varying,
                name        character varying,
                description character varying,
                quantity    integer,
                price       numeric,
                location    character varying,
                status      character varying
            )
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT s.part_number,
               s.name,
               s.description,
               s.quantity,
               s.retail_price,
               s.location,
               'Out Of Stock'::VARCHAR AS status

        FROM "spares" AS s
        WHERE s.company_id = p_company_id
          AND s.quantity = 0

        ORDER BY s.quantity;
END;
$$;

alter function show_unavailable_spares(integer) owner to sc_db_project_user;

