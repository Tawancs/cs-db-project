create function show_owner()
    returns TABLE(id integer, username character varying, display_name character varying, full_name character varying, city character varying, email character varying, telephone_no character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            o.id,
            o.username,
            o.display_name,
            (o.first_name || ' ' || COALESCE(o.middle_name || ' ', '') || o.last_name)::VARCHAR,
            o.city,
            o.email,
            o.telephone_no
        FROM
            owner o
        ORDER BY
            o.id;
END;
$$;

alter function show_owner() owner to sc_db_project_user;

