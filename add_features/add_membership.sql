-- auto-generated definition
create function add_membership(p_company_id integer, p_name character varying, p_detail character varying, p_rank character varying, p_price numeric, p_expired_date date) returns integer
    language plpgsql
as
$$
DECLARE
    new_membership_id INT;
BEGIN
    INSERT INTO "membership" (
        company_id,
        name,
        detail,
        rank,
        price,
        expired_date
        -- purchased_date is omitted so it defaults to CURRENT_DATE automatically
    )
    VALUES (
               p_company_id,
               p_name,
               p_detail,
               p_rank,
               p_price,
               p_expired_date
           )
    RETURNING id INTO new_membership_id;

    RETURN new_membership_id;
END;
$$;

alter function add_membership(integer, varchar, varchar, varchar, numeric, date) owner to sc_db_project_user;

