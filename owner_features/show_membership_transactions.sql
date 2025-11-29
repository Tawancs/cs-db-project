create function show_membership_transactions(p_company_id integer)
    returns TABLE
            (
                transaction_id integer,
                customer_name  text,
                amount_paid    text,
                payment_method character varying,
                reference_id   character varying,
                purchased_date date,
                expired_date   date,
                description    text
            )
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT mt.id,
               (c.first_name || ' ' || c.last_name)::TEXT AS customer_name,
               (mt.amount::TEXT || ' ' || mt.currency),
               mt.payment_method,
               mt.reference_id,
               mt.purchased_date,
               mt.expired_date,
               mt.description

        FROM "membership_transaction" mt
                 JOIN "membership" m ON mt.member_id = m.id
                 JOIN "customer" c ON m.id = c.member_id
                 JOIN "membership_plan" mp ON m.membership_plan_id = mp.membership_plan_id

        WHERE mp.company_id = p_company_id
        ORDER BY mt.purchased_date DESC;
END;
$$;

alter function show_membership_transactions(integer) owner to sc_db_project_user;

