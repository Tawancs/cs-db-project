create function purchase_membership(p_customer_id integer, p_membership_plan_id integer,
                                    p_payment_method character varying, p_reference_id character varying,
                                    p_description text DEFAULT 'Membership Purchase'::text,
                                    p_currency character varying DEFAULT 'THB'::character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_plan_price    DECIMAL;
    v_plan_duration INT;
    v_trans_id      INTEGER;
BEGIN
    SELECT price, duration
    INTO v_plan_price, v_plan_duration
    FROM "membership_plan"
    WHERE membership_plan_id = p_membership_plan_id;

    IF v_plan_price IS NULL THEN
        RAISE EXCEPTION 'Membership Plan ID % not found', p_membership_plan_id;
    END IF;

    INSERT INTO "membership" (customer_id,
                              membership_plan_id,
                              purchased_date,
                              expired_date)
    VALUES (p_customer_id,
            p_membership_plan_id,
            CURRENT_DATE,
            CURRENT_DATE + (v_plan_duration || ' days')::INTERVAL)
    ON CONFLICT (customer_id, membership_plan_id)
        DO UPDATE SET expired_date   = EXCLUDED.expired_date,
                      purchased_date = EXCLUDED.purchased_date;

    INSERT INTO "membership_transaction" (customer_id,
                                          amount,
                                          payment_method,
                                          reference_id,
                                          description,
                                          purchased_date,
                                          expired_date,
                                          currency)
    VALUES (p_customer_id,
            v_plan_price,
            p_payment_method,
            p_reference_id,
            p_description,
            CURRENT_DATE,
            CURRENT_DATE + (v_plan_duration || ' days')::INTERVAL,
            p_currency)
    RETURNING id INTO v_trans_id;

    RETURN v_trans_id;
END;
$$;

alter function purchase_membership(integer, integer, varchar, varchar, text, varchar) owner to sc_db_project_user;

