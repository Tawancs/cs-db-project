create function show_company_services(p_company_id integer)
    returns TABLE(service_name character varying, service_detail character varying, duration_hour numeric, minimum_cost numeric, maximum_cost numeric)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            name,
            detail,
            approximate_duration,
            min_cost,
            max_cost
        FROM "service"
        WHERE company_id = p_company_id;
END;
$$;

alter function show_company_services(integer) owner to sc_db_project_user;

