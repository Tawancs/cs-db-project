create function add_membership_plan(p_company_id integer,
                                    p_name character varying,
                                    p_detail character varying,
                                    p_rank integer,
                                    p_price numeric,
                                    p_duration integer) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "membership_plan" (company_id, name, detail, rank, price, duration)
    VALUES (p_company_id, p_name, p_detail, p_rank, p_price, p_duration)
    RETURNING membership_plan_id INTO v_id;

    RETURN v_id;
END;
$$;

alter function add_membership_plan(integer, varchar, varchar, integer, numeric, integer) owner to sc_db_project_user;

