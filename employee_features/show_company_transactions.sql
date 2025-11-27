create function show_company_transactions(p_company_id integer)
    returns TABLE(trans_id integer, payment_method character varying, reference character varying, date_paid timestamp without time zone, customer_name text, vehicle_info text, service_name character varying, amount_paid text)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            t.transaction_id,
            t.payment_method,
            t.reference_id,
            t.created_at,

            COALESCE((c.first_name || ' ' || c.last_name), 'Unknown')::TEXT,
            COALESCE((v.brand || ' ' || v.model || ' (' || v.license_plate || ')'), 'No Vehicle')::TEXT,
            COALESCE(s.name, 'General Service')::VARCHAR,
            (t.amount::TEXT || ' ' || t.currency)

        FROM "transaction" AS t
                 JOIN "appointment" a ON t.appointment_id = a.id
                 LEFT JOIN "service" s ON t.service_id = s.id
                 LEFT JOIN "vehicle" v ON a.vehicle_id = v.id
                 LEFT JOIN "customer" c ON v.owner_id = c.id

        WHERE a.company_id = p_company_id
        ORDER BY t.created_at DESC;
END;
$$;

alter function show_company_transactions(integer) owner to sc_db_project_user;

