-- auto-generated definition
create function add_subscript(p_company_id integer, p_subscription_id integer) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "subscript" (
        company_id,
        subscription_id
    )
    VALUES (
               p_company_id,
               p_subscription_id
           );
END;
$$;

alter function add_subscript(integer, integer) owner to sc_db_project_user;

