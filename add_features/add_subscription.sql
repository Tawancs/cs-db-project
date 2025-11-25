-- auto-generated definition
create function add_subscription(p_name character varying, p_detail character varying, p_rank character varying, p_price numeric, p_expired_date date) returns integer
    language plpgsql
as
$$
DECLARE
    new_subscription_id INT;
BEGIN
    INSERT INTO "subscription" (
        name,
        detail,
        rank,
        price,
        expired_date
    )
    VALUES (
               p_name,
               p_detail,
               p_rank,
               p_price,
               p_expired_date
           )
    RETURNING id INTO new_subscription_id;

    RETURN new_subscription_id;
END;
$$;

alter function add_subscription(varchar, varchar, varchar, numeric, date) owner to sc_db_project_user;

