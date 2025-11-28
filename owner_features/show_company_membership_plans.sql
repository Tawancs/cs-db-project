create function show_company_membership_plans(p_company_id integer)
    returns TABLE(plan_id integer, plan_name character varying, plan_detail text, plan_rank integer, price_thb numeric, duration_days integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            membership_plan_id,
            name,
            detail,
            rank,
            price,
            duration
        FROM "membership_plan"
        WHERE company_id = p_company_id
        ORDER BY rank ;
END;
$$;

alter function show_company_membership_plans(integer) owner to sc_db_project_user;

