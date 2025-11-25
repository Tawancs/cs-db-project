-- auto-generated definition
create function add_transaction(p_company_id integer, p_customer_id integer, p_service_id integer, p_amount numeric, p_currency character varying, p_payment_method character varying, p_reference_id character varying, p_type character varying, p_status character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_transaction_id INT;
BEGIN
    INSERT INTO "transaction" (
        company_id, customer_id, service_id,
        amount, currency, payment_method, reference_id, type, status
    )
    VALUES (
               p_company_id, p_customer_id, p_service_id,
               p_amount,
               COALESCE(p_currency, 'THB'), -- Use input or default to THB
               p_payment_method, p_reference_id, p_type,
               COALESCE(p_status, 'pending') -- Use input or default to pending
           )
    RETURNING id INTO new_transaction_id;

    RETURN new_transaction_id;
END;
$$;

alter function add_transaction(integer, integer, integer, numeric, varchar, varchar, varchar, varchar, varchar) owner to sc_db_project_user;

