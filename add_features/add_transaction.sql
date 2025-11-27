create function add_transaction(p_appointment_id integer, p_service_id integer, p_amount numeric, p_payment_method character varying, p_reference_id character varying, p_description text, p_currency character varying DEFAULT 'THB'::character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_transaction_id INTEGER;
BEGIN
    INSERT INTO "transaction" (
        appointment_id, service_id, amount, payment_method,
        reference_id, description, currency
    ) VALUES (
                 p_appointment_id, p_service_id, p_amount, p_payment_method,
                 p_reference_id, p_description, p_currency
             ) RETURNING transaction_id INTO new_transaction_id;

    RETURN new_transaction_id;
END;
$$;

alter function add_transaction(integer, integer, numeric, varchar, varchar, text, varchar) owner to sc_db_project_user;

