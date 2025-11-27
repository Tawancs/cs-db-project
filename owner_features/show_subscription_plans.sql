create function show_subscription_plans()
    returns TABLE(plan_id integer, plan_name character varying, details text, price_thb numeric, duration_days integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            subscription_id,
            name,
            detail,
            price,
            duration
        FROM "subscription_plan"
        ORDER BY rank;
END;
$$;

alter function show_subscription_plans() owner to sc_db_project_user;

