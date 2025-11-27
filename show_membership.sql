create function show_membership(p_company_id integer)
    returns TABLE(name character varying, detail character varying, price numeric)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            m.name,
            m.detail,
            m.price
        FROM "membership" AS m
        WHERE m.company_id = p_company_id
        ORDER BY m.price;
END;
$$;

alter function show_membership(integer) owner to sc_db_project_user;

