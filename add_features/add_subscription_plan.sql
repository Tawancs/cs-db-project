create function add_subscription_plan(p_name character varying, p_detail text, p_rank integer, p_price numeric,
                                      p_duration integer) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "subscription_plan" (name, detail, rank, price, duration)
    VALUES (p_name, p_detail, p_rank, p_price, p_duration)
    RETURNING subscription_id INTO v_id;

    RETURN v_id;
END;
$$;

alter function add_subscription_plan(varchar, text, integer, numeric, integer) owner to sc_db_project_user;