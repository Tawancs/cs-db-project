create function purchase_subscription(p_owner_id integer, p_subscription_id integer, p_payment_method character varying,
                                      p_reference_id character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_trans_id  INTEGER;
    v_price     DECIMAL;
    v_plan_name VARCHAR;
    v_duration  INT;
BEGIN
    SELECT price, name, duration
    INTO v_price, v_plan_name, v_duration
    FROM "subscription_plan"
    WHERE subscription_id = p_subscription_id;

    INSERT INTO "subscription_transaction" (owner_id,
                                            subscription_id,
                                            amount,
                                            payment_method,
                                            reference_id,
                                            description,
                                            purchased_date,
                                            expired_date)
    VALUES (p_owner_id,
            p_subscription_id,
            v_price,
            p_payment_method,
            p_reference_id,
            'Purchase of ' || v_plan_name || ' Plan',
            CURRENT_DATE,
            CURRENT_DATE + (v_duration || ' days')::INTERVAL)
    RETURNING transaction_id INTO v_trans_id;

    RETURN v_trans_id;
END;
$$;

alter function purchase_subscription(integer, integer, varchar, varchar) owner to sc_db_project_user;

