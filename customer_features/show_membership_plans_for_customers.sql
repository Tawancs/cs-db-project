create function show_membership_plans_for_customers(p_company_id integer)
    returns TABLE
            (
                plan_name     character varying,
                plan_detail   text,
                plan_rank     integer,
                price_thb     numeric,
                duration_days integer
            )
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT name,
               detail,
               rank,
               price,
               duration
        FROM "membership_plan"
        WHERE company_id = p_company_id
          AND is_active = TRUE -- Only show active plans
        ORDER BY rank;
END;
$$;

alter function show_membership_plans_for_customers(integer) owner to sc_db_project_user;

