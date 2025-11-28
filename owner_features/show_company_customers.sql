create function show_company_customers(p_company_id integer)
    returns TABLE
            (
                customer_name     character varying,
                email             character varying,
                phone             character varying,
                membership_type   character varying,
                start_date        date,
                expiry_date       date,
                days_until_expiry character varying,
                status            character varying
            )
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT (c.first_name || ' ' || c.last_name)::character varying AS customer_name,
               c.email,
               c.telephone_no,
               mp.name,
               m.purchased_date,
               m.expired_date,
               CASE
                   WHEN m.expired_date < CURRENT_DATE THEN
                       'Expired ' || (CURRENT_DATE - m.expired_date)::VARCHAR || ' days ago'
                   WHEN m.expired_date = CURRENT_DATE THEN
                       'Expires today'
                   ELSE
                       (m.expired_date - CURRENT_DATE)::VARCHAR || ' days left'
                   END::VARCHAR,
               CASE
                   WHEN m.expired_date < CURRENT_DATE THEN 'EXPIRED'
                   ELSE 'ACTIVE'
                   END::VARCHAR

        FROM "customer" c
                 JOIN "membership" m ON c.member_id = m.id
                 JOIN "membership_plan" mp ON m.membership_plan_id = mp.membership_plan_id
        WHERE mp.company_id = p_company_id
        ORDER BY mp.rank DESC, m.expired_date DESC;
END;
$$;

alter function show_company_customers(integer) owner to sc_db_project_user;

