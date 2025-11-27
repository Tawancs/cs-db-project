create function show_all_membership(p_company_id integer)
    returns TABLE(customer_name text, email character varying, phone character varying, type character varying, start_date date, expiry_date date, days_until_expiry text, status text)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            (c.first_name || ' ' || c.last_name)::TEXT,
            c.email,
            c.telephone_no,
            m.name,
            m.purchased_date,
            m.expired_date,
            CASE
                WHEN m.expired_date < CURRENT_DATE THEN
                    'Expired ' || (CURRENT_DATE - m.expired_date)::TEXT || ' days ago'
                WHEN m.expired_date = CURRENT_DATE THEN
                    'Expires today'
                ELSE
                    (m.expired_date - CURRENT_DATE)::TEXT || ' days left'
                END::TEXT,
            CASE
                WHEN m.expired_date < CURRENT_DATE THEN 'EXPIRED'
                ELSE 'ACTIVE'
                END::TEXT

        FROM "customer" c
                 JOIN "membership" m ON c.member_id = m.id
        WHERE m.company_id = p_company_id
        ORDER BY m.expired_date DESC;
END;
$$;

alter function show_all_membership(integer) owner to sc_db_project_user;

