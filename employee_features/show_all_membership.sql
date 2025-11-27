create function show_all_membership(p_company_id integer)
    returns TABLE(customer_name text, membership_name character varying, price numeric, expired_date date, status text)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            (c.first_name || ' ' || c.last_name)::TEXT AS customer_name,
            m.name,
            m.price,
            m.expired_date,
            CASE
                WHEN m.expired_date < CURRENT_DATE THEN 'Expired'
                WHEN (m.expired_date - CURRENT_DATE) <= 30 THEN 'Expiring Soon'
                ELSE 'Active'
                END::TEXT AS status
        FROM membership AS m
                 JOIN customer AS c ON c.member_id = m.id
        WHERE m.company_id = p_company_id
        ORDER BY m.rank DESC;
END;
$$;

alter function show_all_membership(integer) owner to sc_db_project_user;

