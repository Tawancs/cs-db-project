create function add_service(p_company_id integer, p_name character varying, p_detail character varying, p_approximate_duration integer, p_min_cost numeric, p_max_cost numeric) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "service" (company_id, name, detail, approximate_duration, min_cost, max_cost)
    VALUES (p_company_id, p_name, p_detail, p_approximate_duration, p_min_cost, p_max_cost)
    RETURNING id INTO v_id;
    RETURN v_id;
END;
$$;

alter function add_service(integer, varchar, varchar, integer, numeric, numeric) owner to sc_db_project_user;

