create function show_subscription_transaction()
    returns TABLE(trans_id integer, owner_name character varying, plan_name character varying, amount numeric, payment_method character varying, date_purchased date, date_expired date, status text)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            st.transaction_id,
            o.display_name::VARCHAR,
            sp.name::VARCHAR,
            st.amount,
            st.payment_method,
            st.purchased_date,
            st.expired_date,
            CASE
                WHEN st.expired_date < CURRENT_DATE THEN 'Expired'
                ELSE 'Active'
                END
        FROM
            subscription_transaction st
                JOIN
            subscription_plan sp ON st.subscription_id = sp.subscription_id
                JOIN
            owner o ON st.owner_id = o.id
        ORDER BY
            st.purchased_date DESC;
END;
$$;

alter function show_subscription_transaction() owner to sc_db_project_user;

