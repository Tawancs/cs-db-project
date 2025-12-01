create function add_subscription(p_name character varying, p_detail character varying, p_rank character varying, p_price numeric, p_expired_date date) returns integer
    language plpgsql
as
$$
DECLARE
    new_subscription_id INT;
BEGIN
    INSERT INTO "subscription" (
        name,
        detail,
        rank,
        price,
        expired_date
    )
    VALUES (
               p_name,
               p_detail,
               p_rank,
               p_price,
               p_expired_date
           )
    RETURNING id INTO new_subscription_id;

    RETURN new_subscription_id;
END;
$$;

alter function add_subscription(varchar, varchar, varchar, numeric, date) owner to sc_db_project_user;

create function add_subscript(p_company_id integer, p_subscription_id integer) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "subscript" (
        company_id,
        subscription_id
    )
    VALUES (
               p_company_id,
               p_subscription_id
           );
END;
$$;

alter function add_subscript(unknown, unknown) owner to sc_db_project_user;

create function add_spares(p_company_id integer, p_part_number character varying, p_name character varying, p_description character varying, p_purchase_cost numeric, p_retail_price numeric, p_quantity integer, p_expired_date date, p_reorder_level integer, p_location character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_spare_id INT;
BEGIN
    INSERT INTO "spares" (
        company_id,
        part_number,
        name,
        description,
        purchase_cost,
        retail_price,
        quantity,
        expired_date,
        reorder_level,
        location
        -- purchased_date is omitted -> defaults to CURRENT_DATE
    )
    VALUES (
               p_company_id,
               p_part_number,
               p_name,
               p_description,
               p_purchase_cost,
               p_retail_price,
               p_quantity,
               p_expired_date,
               p_reorder_level,
               p_location
           )
    RETURNING id INTO new_spare_id;

    RETURN new_spare_id;
END;
$$;

alter function add_spares(unknown, unknown, unknown, unknown, unknown, unknown, unknown, unknown, unknown, unknown) owner to sc_db_project_user;

create function add_vehicle(p_owner_id integer, p_brand character varying, p_model character varying, p_year integer, p_license_plate character varying, p_vin character varying, p_mileage integer) returns integer
    language plpgsql
as
$$
DECLARE
    new_id INT;
BEGIN
    INSERT INTO "vehicle" (
        owner_id, brand, model, year, license_plate, vin, mileage
    )
    VALUES (
               p_owner_id, p_brand, p_model, p_year, p_license_plate, p_vin, p_mileage
           )
    RETURNING id INTO new_id;

    RETURN new_id;

EXCEPTION
    WHEN unique_violation THEN
        RAISE EXCEPTION 'Vehicle creation failed: License Plate or VIN already exists.';
END;
$$;

alter function add_vehicle(unknown, unknown, unknown, unknown, unknown, unknown, unknown) owner to sc_db_project_user;

create function digest(text, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function digest(text, text) owner to postgres;

grant execute on function digest(text, text) to sc_db_project_user;

create function digest(bytea, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function digest(bytea, text) owner to postgres;

grant execute on function digest(bytea, text) to sc_db_project_user;

create function hmac(text, text, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function hmac(text, text, text) owner to postgres;

grant execute on function hmac(text, text, text) to sc_db_project_user;

create function hmac(bytea, bytea, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function hmac(bytea, bytea, text) owner to postgres;

grant execute on function hmac(bytea, bytea, text) to sc_db_project_user;

create function crypt(text, text) returns text
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function crypt(text, text) owner to postgres;

grant execute on function crypt(text, text) to sc_db_project_user;

create function gen_salt(text) returns text
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function gen_salt(text) owner to postgres;

grant execute on function gen_salt(text) to sc_db_project_user;

create function gen_salt(text, integer) returns text
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function gen_salt(text, integer) owner to postgres;

grant execute on function gen_salt(text, integer) to sc_db_project_user;

create function encrypt(bytea, bytea, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function encrypt(bytea, bytea, text) owner to postgres;

grant execute on function encrypt(bytea, bytea, text) to sc_db_project_user;

create function decrypt(bytea, bytea, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function decrypt(bytea, bytea, text) owner to postgres;

grant execute on function decrypt(bytea, bytea, text) to sc_db_project_user;

create function encrypt_iv(bytea, bytea, bytea, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function encrypt_iv(bytea, bytea, bytea, text) owner to postgres;

grant execute on function encrypt_iv(bytea, bytea, bytea, text) to sc_db_project_user;

create function decrypt_iv(bytea, bytea, bytea, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function decrypt_iv(bytea, bytea, bytea, text) owner to postgres;

grant execute on function decrypt_iv(bytea, bytea, bytea, text) to sc_db_project_user;

create function gen_random_bytes(integer) returns bytea
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function gen_random_bytes(integer) owner to postgres;

grant execute on function gen_random_bytes(integer) to sc_db_project_user;

create function gen_random_uuid() returns uuid
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function gen_random_uuid() owner to postgres;

grant execute on function gen_random_uuid() to sc_db_project_user;

create function pgp_sym_encrypt(text, text) returns bytea
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_sym_encrypt(text, text) owner to postgres;

grant execute on function pgp_sym_encrypt(text, text) to sc_db_project_user;

create function pgp_sym_encrypt_bytea(bytea, text) returns bytea
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_sym_encrypt_bytea(bytea, text) owner to postgres;

grant execute on function pgp_sym_encrypt_bytea(bytea, text) to sc_db_project_user;

create function pgp_sym_encrypt(text, text, text) returns bytea
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_sym_encrypt(text, text, text) owner to postgres;

grant execute on function pgp_sym_encrypt(text, text, text) to sc_db_project_user;

create function pgp_sym_encrypt_bytea(bytea, text, text) returns bytea
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_sym_encrypt_bytea(bytea, text, text) owner to postgres;

grant execute on function pgp_sym_encrypt_bytea(bytea, text, text) to sc_db_project_user;

create function pgp_sym_decrypt(bytea, text) returns text
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_sym_decrypt(bytea, text) owner to postgres;

grant execute on function pgp_sym_decrypt(bytea, text) to sc_db_project_user;

create function pgp_sym_decrypt_bytea(bytea, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_sym_decrypt_bytea(bytea, text) owner to postgres;

grant execute on function pgp_sym_decrypt_bytea(bytea, text) to sc_db_project_user;

create function pgp_sym_decrypt(bytea, text, text) returns text
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_sym_decrypt(bytea, text, text) owner to postgres;

grant execute on function pgp_sym_decrypt(bytea, text, text) to sc_db_project_user;

create function pgp_sym_decrypt_bytea(bytea, text, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_sym_decrypt_bytea(bytea, text, text) owner to postgres;

grant execute on function pgp_sym_decrypt_bytea(bytea, text, text) to sc_db_project_user;

create function pgp_pub_encrypt(text, bytea) returns bytea
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_encrypt(text, bytea) owner to postgres;

grant execute on function pgp_pub_encrypt(text, bytea) to sc_db_project_user;

create function pgp_pub_encrypt_bytea(bytea, bytea) returns bytea
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_encrypt_bytea(bytea, bytea) owner to postgres;

grant execute on function pgp_pub_encrypt_bytea(bytea, bytea) to sc_db_project_user;

create function pgp_pub_encrypt(text, bytea, text) returns bytea
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_encrypt(text, bytea, text) owner to postgres;

grant execute on function pgp_pub_encrypt(text, bytea, text) to sc_db_project_user;

create function pgp_pub_encrypt_bytea(bytea, bytea, text) returns bytea
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_encrypt_bytea(bytea, bytea, text) owner to postgres;

grant execute on function pgp_pub_encrypt_bytea(bytea, bytea, text) to sc_db_project_user;

create function pgp_pub_decrypt(bytea, bytea) returns text
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_decrypt(bytea, bytea) owner to postgres;

grant execute on function pgp_pub_decrypt(bytea, bytea) to sc_db_project_user;

create function pgp_pub_decrypt_bytea(bytea, bytea) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_decrypt_bytea(bytea, bytea) owner to postgres;

grant execute on function pgp_pub_decrypt_bytea(bytea, bytea) to sc_db_project_user;

create function pgp_pub_decrypt(bytea, bytea, text) returns text
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_decrypt(bytea, bytea, text) owner to postgres;

grant execute on function pgp_pub_decrypt(bytea, bytea, text) to sc_db_project_user;

create function pgp_pub_decrypt_bytea(bytea, bytea, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_decrypt_bytea(bytea, bytea, text) owner to postgres;

grant execute on function pgp_pub_decrypt_bytea(bytea, bytea, text) to sc_db_project_user;

create function pgp_pub_decrypt(bytea, bytea, text, text) returns text
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_decrypt(bytea, bytea, text, text) owner to postgres;

grant execute on function pgp_pub_decrypt(bytea, bytea, text, text) to sc_db_project_user;

create function pgp_pub_decrypt_bytea(bytea, bytea, text, text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_pub_decrypt_bytea(bytea, bytea, text, text) owner to postgres;

grant execute on function pgp_pub_decrypt_bytea(bytea, bytea, text, text) to sc_db_project_user;

create function pgp_key_id(bytea) returns text
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_key_id(bytea) owner to postgres;

grant execute on function pgp_key_id(bytea) to sc_db_project_user;

create function armor(bytea) returns text
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function armor(bytea) owner to postgres;

grant execute on function armor(bytea) to sc_db_project_user;

create function armor(bytea, text[], text[]) returns text
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function armor(bytea, text[], text[]) owner to postgres;

grant execute on function armor(bytea, text[], text[]) to sc_db_project_user;

create function dearmor(text) returns bytea
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function dearmor(text) owner to postgres;

grant execute on function dearmor(text) to sc_db_project_user;

create function pgp_armor_headers(text, out key text, out value text) returns setof record
    immutable
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function pgp_armor_headers(text, out text, out text) owner to postgres;

grant execute on function pgp_armor_headers(text, out text, out text) to sc_db_project_user;

create function fips_mode() returns boolean
    strict
    parallel safe
    language c
as
$$
begin
-- missing source code
end;
$$;

alter function fips_mode() owner to postgres;

grant execute on function fips_mode() to sc_db_project_user;

create function show_spares_available()
    returns TABLE(company_name character varying, item_name character varying, description character varying, quantity integer, price numeric, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            (SELECT c.name FROM company AS c
                WHERE c.id = s.company_id),
            s.name,
            s.description,
            s.quantity,
            s.retail_price,
            (CASE
                 WHEN s.quantity = 0 THEN 'OUT OF STOCK'      -- Priority 1: No items left
                 ELSE 'In Stock'                              -- Priority 2: All good
                END)::VARCHAR AS status

        FROM "spares" AS s
        ORDER BY s.quantity; -- Puts 'OUT OF STOCK' items at the very top
END;
$$;

alter function show_spares_available() owner to sc_db_project_user;

create function show_spares_stock(p_company_id integer)
    returns TABLE(part_number character varying, name character varying, description character varying, quantity integer, price numeric, location character varying, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            s.part_number,
            s.name,
            s.description,
            s.quantity,
            s.retail_price,
            s.location,
            (CASE
                 WHEN s.quantity = 0 THEN 'OUT OF STOCK'      -- Priority 1: No items left
                 WHEN s.quantity < s.reorder_level THEN 'Reorder Required' -- Priority 2: Below limit
                 ELSE 'In Stock'                              -- Priority 3: All good
            END)::VARCHAR AS status

        FROM "spares" AS s
        WHERE s.company_id = p_company_id
        ORDER BY s.quantity; -- Puts 'OUT OF STOCK' items at the very top
END;
$$;

alter function show_spares_stock(integer) owner to sc_db_project_user;

create function show_equipment_detail(p_company_id integer)
    returns TABLE(serial_number character varying, name character varying, category character varying, last_service date, next_service date, day_remaining integer, maintenance_status character varying, operational_status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            e.serial_number,
            e.name,
            e.category,
            e.last_service_date,
            e.next_service_data,

            (e.next_service_data - CURRENT_DATE) AS day_remaining,

            (CASE
                 WHEN e.next_service_data < CURRENT_DATE THEN 'OVERDUE'
                 WHEN e.next_service_data = CURRENT_DATE THEN 'DUE TODAY'
                 WHEN (e.next_service_data - CURRENT_DATE) BETWEEN 1 AND 90 THEN 'Due Soon'
                 ELSE 'OK'
                END)::VARCHAR AS performance_status,
            e.operational_status

        FROM "equipment" AS e
        WHERE e.company_id = p_company_id
        ORDER BY day_remaining;
END;
$$;

alter function show_equipment_detail(integer) owner to sc_db_project_user;

create function authenticate_customer(p_identifier character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_user_id INT;
BEGIN
    SELECT id INTO v_user_id
    FROM "customer"
    WHERE (username = p_identifier OR email = p_identifier)
      -- Check if the input password matches the stored hash
      AND password = crypt(p_password, password);

    RETURN v_user_id; -- return null if user doesn't exist or input not match
END;
$$;

alter function authenticate_customer(varchar, varchar) owner to sc_db_project_user;

create function authenticate_employee(p_identifier character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_user_id INT;
BEGIN
    SELECT id INTO v_user_id
    FROM "employee"
    WHERE (username = p_identifier OR email = p_identifier)
      -- Check if the input password matches the stored hash
      AND password = crypt(p_password, password);

    RETURN v_user_id;
END;
$$;

alter function authenticate_employee(varchar, varchar) owner to sc_db_project_user;

create function show_spares_available_by_company_id(p_company_id integer)
    returns TABLE(company_name character varying, item_name character varying, description character varying, quantity integer, price numeric, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            (SELECT c.name FROM company AS c
                WHERE c.id = s.company_id),
            s.name,
            s.description,
            s.quantity,
            s.retail_price,
            (CASE
                 WHEN s.quantity = 0 THEN 'OUT OF STOCK'      -- Priority 1: No items left
                 ELSE 'In Stock'                              -- Priority 2: All good
                END)::VARCHAR AS status

        FROM "spares" AS s
        WHERE s.company_id = p_company_id
        ORDER BY s.quantity; -- Puts 'OUT OF STOCK' items at the very top
END;
$$;

alter function show_spares_available_by_company_id(integer) owner to sc_db_project_user;

create function show_vehicle_by_owner_id(p_owner_id integer)
    returns TABLE(p_brand character varying, p_model character varying, p_year integer, p_license_plate character varying, p_vin character varying, p_mileage integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            v.brand,
            v.model,
            v.year,
            v.license_plate,
            v.vin,
            v.mileage
        FROM "vehicle" v
        WHERE v.owner_id = p_owner_id;
END;
$$;

alter function show_vehicle_by_owner_id(integer) owner to sc_db_project_user;

create function add_service(p_company_id integer, p_name character varying, p_detail character varying, p_approximate_duration integer, p_min_cost numeric, p_max_cost numeric) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "service" (company_id, name, detail, approximate_duration, min_cost, max_cost)
    VALUES (p_company_id, p_name, p_detail, p_approximate_duration, p_min_cost, p_max_cost)
    RETURNING id INTO v_id;
    RETURN v_id;
END;
$$;

alter function add_service(integer, varchar, varchar, integer, numeric, numeric) owner to sc_db_project_user;

create function add_service_record(p_service_id integer, p_appointment_id integer, p_lead_mechanic_id integer, p_type character varying, p_cost integer, p_duration integer, p_received_date date, p_expected_finish_date date, p_status character varying DEFAULT 'in progress'::character varying) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "service_record" (service_id, appointment_id, lead_mechanic_id, type, cost,
                                  duration, received_date, expected_finish_date, status)
    VALUES (p_service_id, p_appointment_id, p_lead_mechanic_id, p_type, p_cost,
            p_duration, p_received_date, p_expected_finish_date, p_status);
END;
$$;

alter function add_service_record(integer, integer, integer, varchar, integer, integer, date, date, varchar) owner to sc_db_project_user;

create function add_employee_schedule(p_employee_id integer, p_date date, p_start_time time without time zone, p_end_time time without time zone, p_status character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO employee_schedule (
        employee_id, date, start_time, end_time, status
    ) VALUES (
                 p_employee_id, p_date, p_start_time, p_end_time, p_status
             ) RETURNING schedule_id INTO v_id;

    RETURN v_id;
END;
$$;

alter function add_employee_schedule(integer, date, time, time, varchar) owner to sc_db_project_user;

create function show_company_services(p_company_id integer)
    returns TABLE(service_name character varying, service_detail character varying, duration_hour numeric, minimum_cost numeric, maximum_cost numeric)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            name,
            detail,
            approximate_duration,
            min_cost,
            max_cost
        FROM "service"
        WHERE company_id = p_company_id;
END;
$$;

alter function show_company_services(integer) owner to sc_db_project_user;

create function show_company_appointments(p_company_id integer)
    returns TABLE(appointment_date timestamp without time zone, customer_name text, contact_number character varying, vehicle_info text, details character varying, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            a.appointment_date,
            -- Combine First/Last name
            (c.first_name || ' ' || c.last_name)::TEXT AS customer_name,
            c.telephone_no,
            -- Combine Car Brand/Model/Plate
            (v.brand || ' ' || v.model || ' [' || v.license_plate || ']')::TEXT AS vehicle_info,
            a.details,
            a.status
        FROM "appointment" a
                 JOIN "vehicle" v ON a.vehicle_id = v.id
                 JOIN "customer" c ON v.owner_id = c.id
        WHERE a.company_id = p_company_id
        ORDER BY CASE
                     WHEN a.status = 'pending' THEN 1
                     ELSE 2
                     END,
            a.appointment_date;
END;
$$;

alter function show_company_appointments(integer) owner to sc_db_project_user;

create function add_membership(p_company_id integer, p_name character varying, p_detail character varying, p_rank integer, p_price numeric, p_expired_date date, p_discount_percent numeric) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "membership" (
        company_id, name, detail, rank, price, expired_date, discount_percent
    ) VALUES (
                 p_company_id, p_name, p_detail, p_rank, p_price, p_expired_date, p_discount_percent
             ) RETURNING id INTO v_id;
    RETURN v_id;
END;
$$;

alter function add_membership(integer, varchar, varchar, integer, numeric, date, numeric) owner to sc_db_project_user;

create function show_membership(p_company_id integer)
    returns TABLE(name character varying, detail character varying, price numeric)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            m.name,
            m.detail,
            m.price
        FROM "membership" AS m
        LEFT JOIN membership_plan mp ON m.membership_plan_id = mp.membership_plan_id 
        WHERE mp.company_id = p_company_id
        ORDER BY m.price;
END;
$$;

alter function show_membership(integer) owner to sc_db_project_user;

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

create function remove_vehicle(p_vin character varying) returns boolean
    language plpgsql
as
$$
DECLARE
    v_deleted_count INT;
BEGIN
    DELETE FROM "vehicle"
    WHERE vin = p_vin;

    -- Check if a row was actually deleted
    GET DIAGNOSTICS v_deleted_count = ROW_COUNT;

    -- Return TRUE if deleted, FALSE if not found or mismatch
    RETURN v_deleted_count > 0;
END;
$$;

alter function remove_vehicle(varchar) owner to sc_db_project_user;

create function add_transaction(p_appointment_id integer, p_service_id integer, p_amount numeric, p_payment_method character varying, p_reference_id character varying, p_description text, p_currency character varying DEFAULT 'THB'::character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "transaction" (
        appointment_id, service_id, amount, payment_method,
        reference_id, description, currency
    ) VALUES (
                 p_appointment_id, p_service_id, p_amount, p_payment_method,
                 p_reference_id, p_description, p_currency
             ) RETURNING transaction_id INTO v_id;
    PERFORM update_appointment_status(p_appointment_id, 'accepted');

    RETURN v_id;
END;
$$;

alter function add_transaction(integer, integer, numeric, varchar, varchar, text, varchar) owner to sc_db_project_user;

create function show_transactions()
    returns TABLE(trans_id integer, date_recorded timestamp without time zone, service_name character varying, description text, amount_display text, method character varying, ref_id character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            t.transaction_id,
            t.created_at,

            -- Get Service Name or fallback if null
            COALESCE(s.name, 'General Service')::VARCHAR,

            t.description,

            -- Combine Amount + Currency (e.g., "500.00 THB")
            (t.amount::TEXT || ' ' || t.currency),

            t.payment_method,
            t.reference_id
        FROM "transaction" t
                 LEFT JOIN "service" s ON t.service_id = s.id
        ORDER BY t.created_at DESC;
END;
$$;

alter function show_transactions() owner to sc_db_project_user;

create function show_full_transaction_details()
    returns TABLE(trans_id integer, amount_paid text, payment_method character varying, reference character varying, date_paid timestamp without time zone, status text, customer_name text, vehicle_info text, appointment_detail character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            t.transaction_id,
            (t.amount::TEXT || ' ' || t.currency),
            t.payment_method,
            t.reference_id,
            t.created_at,
            t.description,

            -- 1. Get Customer Name (via Appointment -> Vehicle -> Customer)
            COALESCE((c.first_name || ' ' || c.last_name), 'Unknown')::TEXT,

            -- 2. Get Vehicle Name (Brand + Model + Plate)
            COALESCE((v.brand || ' ' || v.model || ' (' || v.license_plate || ')'), 'No Vehicle')::TEXT,

            -- 3. Get Appointment Details
            COALESCE(a.details, 'Walk-in / Direct Payment')

        FROM "transaction" t
                 LEFT JOIN "appointment" a ON t.appointment_id = a.id
                 LEFT JOIN "vehicle" v ON a.vehicle_id = v.id
                 LEFT JOIN "customer" c ON v.owner_id = c.id

        ORDER BY t.created_at DESC;
END;
$$;

alter function show_full_transaction_details() owner to sc_db_project_user;

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

create function show_available_spares(p_company_id integer)
    returns TABLE(part_number character varying, name character varying, description character varying, quantity integer, price numeric, location character varying, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT s.part_number,
               s.name,
               s.description,
               s.quantity,
               s.retail_price,
               s.location,
               'In Stock'::VARCHAR AS status

        FROM "spares" AS s
        WHERE s.company_id = p_company_id
          AND s.quantity > 0
          AND s.quantity >= s.reorder_level

        ORDER BY s.quantity;
END;
$$;

alter function show_available_spares(integer) owner to sc_db_project_user;

create function show_unavailable_spares(p_company_id integer)
    returns TABLE(part_number character varying, name character varying, description character varying, quantity integer, price numeric, location character varying, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT s.part_number,
               s.name,
               s.description,
               s.quantity,
               s.retail_price,
               s.location,
               'Out Of Stock'::VARCHAR AS status

        FROM "spares" AS s
        WHERE s.company_id = p_company_id
          AND s.quantity = 0

        ORDER BY s.quantity;
END;
$$;

alter function show_unavailable_spares(integer) owner to sc_db_project_user;

create function add_owner(p_username character varying, p_display_name character varying, p_first_name character varying, p_middle_name character varying, p_last_name character varying, p_address character varying, p_city character varying, p_postal_code character varying, p_email character varying, p_telephone_no character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_owner_id INT;
BEGIN
    -- Insert the new customer
    INSERT INTO "owner" (username, display_name,
                            first_name, middle_name, last_name,
                            address, city, postal_code,
                            email, telephone_no, password)
    VALUES (p_username,
            p_display_name,
            p_first_name,
            p_middle_name, -- Can be NULL
            p_last_name,
            p_address,
            p_city,
            p_postal_code,
            p_email,
            p_telephone_no,
            crypt(p_password, gen_salt('bf')))
    RETURNING id INTO new_owner_id;

    -- Return the ID of the new customer
    RETURN new_owner_id;

EXCEPTION
    -- Catch duplicate username or email errors nicely
    WHEN unique_violation THEN
        RAISE EXCEPTION 'User creation failed: Username or Email already exists.';
END;
$$;

alter function add_owner(varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar) owner to sc_db_project_user;

create function authenticate_owner(p_identifier character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_user_id INT;
BEGIN
    SELECT id
    INTO v_user_id
    FROM "owner"
    WHERE (username = p_identifier OR email = p_identifier)
      -- Check if the input password matches the stored hash
      AND password = crypt(p_password, password);

    RETURN v_user_id;
END;
$$;

alter function authenticate_owner(varchar, varchar) owner to sc_db_project_user;

create function add_employee(p_company_id integer, p_username character varying, p_first_name character varying, p_middle_name character varying, p_last_name character varying, p_address character varying, p_city character varying, p_postal_code character varying, p_email character varying, p_telephone_no character varying, p_specialize character varying, p_password character varying, p_salary numeric, p_hire_date date, p_contract_type character varying, p_contract_period character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "employee" (
        company_id, username, first_name, middle_name, last_name,
        address, city, postal_code, email, telephone_no,
        specialize, password,
        salary, hire_date, contract_type, contract_period
    ) VALUES (
                 p_company_id, p_username, p_first_name, p_middle_name, p_last_name,
                 p_address, p_city, p_postal_code, p_email, p_telephone_no,
                 p_specialize, p_password,
                 p_salary, p_hire_date, p_contract_type, p_contract_period
             ) RETURNING id INTO v_id;
    RETURN v_id;
END;
$$;

alter function add_employee(integer, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, numeric, date, varchar, varchar) owner to sc_db_project_user;

create function show_employees(p_owner_id integer)
    returns TABLE(username character varying, first_name character varying, middle_name character varying, last_name character varying, address character varying, city character varying, postal_code character varying, email character varying, telephone_no character varying, specialize character varying, salary numeric, contract_type character varying, contract_period character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            e.username,
            e.first_name,
            e.middle_name,
            e.last_name,
            e.address,
            e.city,
            e.postal_code,
            e.email,
            e.telephone_no,
            e.specialize,
            e.salary,
            e.contract_type,
            e.contract_period
        FROM "employee" e
                 JOIN "company" c ON e.company_id = c.id
        WHERE c.owner_id = p_owner_id;
END;
$$;

alter function show_employees(integer) owner to sc_db_project_user;

create function show_company_requests(p_company_id integer)
    returns TABLE(req_id integer, applicant_name text, contact_info text, specialize character varying, location text)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            r.request_id,
            (r.first_name || ' ' || r.last_name)::TEXT,
            (r.email || ' | ' || r.telephone_no)::TEXT,
            r.specialize,
            (r.city || ', ' || r.postal_code)::TEXT
        FROM "request_form" r
        WHERE r.company_id = p_company_id;
END;
$$;

alter function show_company_requests(integer) owner to sc_db_project_user;

create function add_request_form(p_company_id integer, p_first_name character varying, p_middle_name character varying, p_last_name character varying, p_address character varying, p_city character varying, p_postal_code character varying, p_email character varying, p_telephone_no character varying, p_specialize character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_request_id INTEGER;
BEGIN
    INSERT INTO "request_form" (
        company_id, first_name, middle_name, last_name,
        address, city, postal_code, email, telephone_no, specialize
    ) VALUES (
                 p_company_id, p_first_name, p_middle_name, p_last_name,
                 p_address, p_city, p_postal_code, p_email, p_telephone_no, p_specialize
             ) RETURNING request_id INTO new_request_id;

    RETURN new_request_id;
END;
$$;

alter function add_request_form(integer, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar) owner to sc_db_project_user;

create function add_company(p_owner_id integer, p_name character varying, p_logo_url character varying, p_address character varying, p_city character varying, p_postal_code character varying, p_capacity integer, p_open_time time without time zone, p_close_time time without time zone, p_social_media_contact character varying, p_ev_support boolean) returns integer
    language plpgsql
as
$$
DECLARE
    new_company_id INT;
BEGIN
    INSERT INTO "company" (
        owner_id,
        name,
        logo_url,
        address,
        city,
        postal_code,
        capacity,
        open_time,
        close_time,
        social_media_contact,
        ev_support
    )
    VALUES (
               p_owner_id,
               p_name,
               p_logo_url,         -- Can be NULL
               p_address,
               p_city,
               p_postal_code,
               p_capacity,
               p_open_time,
               p_close_time,
               p_social_media_contact,
               p_ev_support        -- Pass TRUE or FALSE
           )
    RETURNING id INTO new_company_id;

    RETURN new_company_id;
END;
$$;

alter function add_company(integer, varchar, varchar, varchar, varchar, varchar, integer, time, time, varchar, boolean) owner to sc_db_project_user;

create function approve_request_and_create_employee(p_email character varying, p_salary numeric, p_contract_type character varying, p_contract_period character varying) returns integer
    language plpgsql
as
$$
DECLARE
    r RECORD;
    v_new_username VARCHAR;
    v_new_password VARCHAR;
    v_employee_id INTEGER;
BEGIN
    SELECT * INTO r FROM "request_form" WHERE request_form.email = p_email;

    v_new_username := lower(r.first_name || '.' || r.last_name || r.request_id);
    -- Password: Default temporary password
    v_new_password := 'changeme1234';

    v_employee_id := add_employee(
            r.company_id,
            v_new_username,
            r.first_name,
            r.middle_name,
            r.last_name,
            r.address,
            r.city,
            r.postal_code,
            r.email,
            r.telephone_no,
            r.specialize,
            v_new_password,     -- Generated Password
            p_salary,           -- Parameter passed to this function
            CURRENT_DATE,       -- Hire Date is today
            p_contract_type,    -- Parameter passed to this function
            p_contract_period   -- Parameter passed to this function
     );

    -- 4. Delete the request (since they are now an employee)
    DELETE FROM "request_form" WHERE email = p_email;

    RETURN v_employee_id;
END;
$$;

alter function approve_request_and_create_employee(varchar, numeric, varchar, varchar) owner to sc_db_project_user;

create function show_employee(p_company_id integer)
    returns TABLE(username character varying, first_name character varying, middle_name character varying, last_name character varying, address character varying, city character varying, postal_code character varying, email character varying, telephone_no character varying, specialize character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT e.username,
               e.first_name,
               e.middle_name,
               e.last_name,
               e.address,
               e.city,
               e.postal_code,
               e.email,
               e.telephone_no,
               e.specialize
        FROM employee e
        WHERE e.company_id = p_company_id;
END;
$$;

alter function show_employee(integer) owner to sc_db_project_user;

create function add_subscription_plan(p_name character varying, p_detail text, p_rank integer, p_price numeric, p_duration integer) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "subscription_plan" (name, detail, rank, price, duration)
    VALUES (p_name, p_detail, p_rank, p_price, p_duration)
    RETURNING subscription_id INTO v_id;

    RETURN v_id;
END;
$$;

alter function add_subscription_plan(varchar, text, integer, numeric, integer) owner to sc_db_project_user;

create function show_subscription_plans()
    returns TABLE(plan_id integer, plan_name character varying, details text, price_thb numeric, duration_days integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            subscription_id,
            name,
            detail,
            price,
            duration
        FROM "subscription_plan"
        ORDER BY rank;
END;
$$;

alter function show_subscription_plans() owner to sc_db_project_user;

create function purchase_subscription(p_owner_id integer, p_subscription_id integer, p_payment_method character varying, p_reference_id character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_trans_id INTEGER;
    v_price DECIMAL;
    v_plan_name VARCHAR;
    v_duration INT;
BEGIN
    -- 1. Get details from the NEW table name
    SELECT price, name, duration
    INTO v_price, v_plan_name, v_duration
    FROM "subscription_plan"
    WHERE subscription_id = p_subscription_id;

    IF v_duration IS NULL THEN
        RAISE EXCEPTION 'Subscription Plan ID % not found', p_subscription_id;
    END IF;

    -- 2. Insert the Transaction
    INSERT INTO "subscription_transaction" (
        owner_id,
        subscription_id,
        amount,
        payment_method,
        reference_id,
        description,
        purchased_date,
        expired_date
    ) VALUES (
                 p_owner_id,
                 p_subscription_id,
                 v_price,
                 p_payment_method,
                 p_reference_id,
                 'Purchase of ' || v_plan_name || ' Plan',
                 CURRENT_DATE,
                 CURRENT_DATE + (v_duration || ' days')::INTERVAL
             ) RETURNING transaction_id INTO v_trans_id;

    RETURN v_trans_id;
END;
$$;

alter function purchase_subscription(integer, integer, varchar, varchar) owner to sc_db_project_user;

create function register_company_with_free_trial(p_owner_id integer, p_name character varying, p_logo_url character varying, p_address character varying, p_city character varying, p_postal_code character varying, p_capacity integer, p_open_time time without time zone, p_close_time time without time zone, p_social_media_contact character varying, p_ev_support boolean) returns integer
    language plpgsql
as
$$
DECLARE
    v_company_id INTEGER;
    v_starter_plan_id INTEGER;
BEGIN
    -- 1. Call the existing add_company function instead of raw INSERT
    v_company_id := add_company(
            p_owner_id,
            p_name,
            p_logo_url,
            p_address,
            p_city,
            p_postal_code,
            p_capacity,
            p_open_time,
            p_close_time,
            p_social_media_contact,
            p_ev_support
                    );

    -- 2. Find the 'Starter' plan (cheapest one)
    SELECT subscription_id INTO v_starter_plan_id
    FROM "subscription_plan"
    ORDER BY price ASC
    LIMIT 1;

    -- Safety check: Only give free trial if a plan actually exists
    IF v_starter_plan_id IS NOT NULL THEN
        -- 3. Create the FREE Transaction (Amount 0.00)
        INSERT INTO "subscription_transaction" (
            owner_id,
            subscription_id,
            amount,
            payment_method,
            reference_id,
            description,
            purchased_date,
            expired_date
        ) VALUES (
                     p_owner_id,
                     v_starter_plan_id,
                     0.00,           -- FREE!
                     'System Grant',
                     'FREE-TRIAL-CO-' || v_company_id,
                     'Free 1-Month Trial for registering ' || p_name,
                     CURRENT_DATE,
                     CURRENT_DATE + INTERVAL '30 days' -- 1 Month Free
                 );
    END IF;

    RETURN v_company_id;
END;
$$;

alter function register_company_with_free_trial(integer, varchar, varchar, varchar, varchar, varchar, integer, time, time, varchar, boolean) owner to sc_db_project_user;

create function show_company_schedule(p_company_id integer)
    returns TABLE(employee_name text, work_date text, shift_time text, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            (e.first_name || ' ' || e.last_name)::TEXT AS employee_name,
            to_char(s.date, 'DD/MM/YYYY')::TEXT AS work_date,
            (to_char(s.start_time, 'HH24:MI') || ' - ' || to_char(s.end_time, 'HH24:MI'))::TEXT AS shift_time,
            s.status
        FROM employee_schedule s
                 JOIN "employee" e ON s.employee_id = e.id
        WHERE e.company_id = p_company_id
          -- Show schedules starting from today onwards
          AND s.date >= CURRENT_DATE
        ORDER BY s.date, e.first_name;
END;
$$;

alter function show_company_schedule(integer) owner to sc_db_project_user;

create function show_employee_schedule(p_employee_id integer)
    returns TABLE(work_date text, day_name text, shift_time text, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            to_char(s.date, 'DD/MM/YYYY')::TEXT,
            TRIM(to_char(s.date, 'Day'))::TEXT,
            (to_char(s.start_time, 'HH24:MI') || ' - ' || to_char(s.end_time, 'HH24:MI'))::TEXT,
            s.status
        FROM employee_schedule s
        WHERE s.employee_id = p_employee_id
        ORDER BY s.date;
END;
$$;

alter function show_employee_schedule(integer) owner to sc_db_project_user;

create function remove_service(p_service_id integer) returns boolean
    language plpgsql
as
$$
DECLARE
    v_rows_deleted INT;
BEGIN
    DELETE FROM "service"
    WHERE id = p_service_id;

    -- Check if any row was actually removed
    GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;

    RETURN v_rows_deleted > 0;
END;
$$;

alter function remove_service(integer) owner to sc_db_project_user;

create function add_membership_plan(p_company_id integer, p_name character varying, p_detail character varying, p_rank integer, p_price numeric, p_duration integer) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "membership_plan" (
        company_id, name, detail, rank, price, duration, is_active
    ) VALUES (
                 p_company_id, p_name, p_detail, p_rank, p_price, p_duration, TRUE
             ) RETURNING membership_plan_id INTO v_id;

    RETURN v_id;
END;
$$;

alter function add_membership_plan(integer, varchar, varchar, integer, numeric, integer) owner to sc_db_project_user;

create function show_membership_plans(p_company_id integer)
    returns TABLE(plan_name character varying, plan_detail character varying, plan_rank integer, price_thb numeric, duration_days integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            name,
            detail,
            rank,
            price,
            duration
        FROM "membership_plan"
        WHERE company_id = p_company_id
        ORDER BY rank;
END;
$$;

alter function show_membership_plans(integer) owner to sc_db_project_user;

create function show_company_membership_plans(p_company_id integer)
    returns TABLE(plan_id integer, plan_name character varying, plan_detail text, plan_rank integer, price_thb numeric, duration_days integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            membership_plan_id,
            name,
            detail,
            rank,
            price,
            duration
        FROM "membership_plan"
        WHERE company_id = p_company_id
        ORDER BY rank ;
END;
$$;

alter function show_company_membership_plans(integer) owner to sc_db_project_user;

create function toggle_membership_plan_status(p_plan_id integer) returns boolean
    language plpgsql
as
$$
DECLARE
    v_new_status BOOLEAN;
BEGIN
    UPDATE "membership_plan"
    SET is_active = NOT is_active
    WHERE membership_plan_id = p_plan_id
    RETURNING is_active INTO v_new_status;

    RETURN v_new_status;
END;
$$;

alter function toggle_membership_plan_status(integer) owner to sc_db_project_user;

create function show_appointments(p_company_id integer)
    returns TABLE(appointment_id integer, customer_name character varying, vehicle_info character varying, date_str character varying, time_str character varying, service_detail character varying, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT a.id AS appointment_id,
               (c.first_name || ' ' || c.last_name)::character varying,
               (v.brand || ' ' || v.model)::character varying,
               to_char(a.appointment_date, 'MM/DD/YYYY')::character varying,
               to_char(a.appointment_date, 'HH12:MI AM')::character varying,
               a.details,
               a.status
        FROM "appointment" a
                 JOIN "vehicle" v ON a.vehicle_id = v.id
                 JOIN "customer" c ON v.owner_id = c.id
        WHERE a.company_id = p_company_id

        ORDER BY CASE
                     WHEN a.status = 'pending' THEN 1
                     WHEN a.status = 'accepted' THEN 2
                     ELSE 3
                     END,
                 a.appointment_date;
END;
$$;

alter function show_appointments(integer) owner to sc_db_project_user;

create function add_appointment(p_company_id integer, p_vehicle_id integer, p_details character varying, p_appointment_date timestamp without time zone) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "appointment" (company_id, vehicle_id, details, appointment_date, status)
    VALUES (p_company_id, p_vehicle_id, p_details, p_appointment_date,
           'pending')
    RETURNING id INTO v_id;
    RETURN v_id;
END;
$$;

alter function add_appointment(integer, integer, varchar, timestamp) owner to sc_db_project_user;

create function add_equipment(p_company_id integer, p_name character varying, p_serial_number character varying, p_purchase_cost numeric, p_last_service_date date, p_category character varying, p_quantity integer, p_next_service_date date, p_operational_status character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_id INT;
BEGIN
    INSERT INTO "equipment" (company_id, name, serial_number,
                             purchase_cost, last_service_date, category,
                             quantity, next_service_data, operational_status)
    VALUES (p_company_id, p_name, p_serial_number,
            p_purchase_cost, p_last_service_date, p_category,
            p_quantity, p_next_service_date,
            COALESCE(p_operational_status, 'operational') --
           )
    RETURNING id INTO new_id;

    RETURN new_id;
END;
$$;

alter function add_equipment(integer, varchar, varchar, numeric, date, varchar, integer, date, varchar) owner to sc_db_project_user;

create function show_service_records(p_company_id integer)
    returns TABLE(company_name character varying, service_name character varying, appointment_detail character varying, lead_mechanic_name character varying, record_type character varying, cost integer, duration_minutes integer, received_date date, expected_finish_date date, status character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            c.name::VARCHAR AS company_name,
            s.name::VARCHAR AS service_name,
            COALESCE(a.details, 'N/A')::VARCHAR AS appointment_detail,
            (e.first_name || ' ' || e.last_name)::VARCHAR AS lead_mechanic_name,

            sr.type,
            sr.cost,
            sr.duration,
            sr.received_date,
            sr.expected_finish_date,
            sr.status

        FROM "service_record" sr
                 JOIN "service" s ON sr.service_id = s.id
                 JOIN "company" c ON s.company_id = c.id
                 JOIN "appointment" a ON sr.appointment_id = a.id
            LEFT JOIN "employee" e ON sr.lead_mechanic_id = e.id

        WHERE s.company_id = p_company_id
        ORDER BY sr.received_date DESC;
END;
$$;

alter function show_service_records(integer) owner to sc_db_project_user;

create function update_appointment_status(p_appointment_id integer, p_new_status character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_rows_updated INTEGER;
BEGIN
    UPDATE "appointment"
    SET status = p_new_status
    WHERE id = p_appointment_id;
    GET DIAGNOSTICS v_rows_updated = ROW_COUNT;
    IF v_rows_updated > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$;

alter function update_appointment_status(integer, varchar) owner to sc_db_project_user;

create function show_membership_transactions(p_company_id integer)
    returns TABLE(transaction_id integer, customer_name text, amount_paid text, payment_method character varying, reference_id character varying, purchased_date date, expired_date date, description text)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            mt.id,

            -- Get Customer Name
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

create function add_financial_record(p_company_id integer, p_month integer, p_year integer, p_total_revenue numeric, p_net_income numeric, p_date_reported date DEFAULT CURRENT_DATE) returns integer
    language plpgsql
as
$$
DECLARE
    new_financial_record_id INTEGER;
BEGIN
    INSERT INTO "financial_record" (
        company_id, month, year, total_revenue, net_income, date_reported
    ) VALUES (
                 p_company_id, p_month, p_year, p_total_revenue, p_net_income, p_date_reported
             ) RETURNING record_id INTO new_financial_record_id;

    RETURN new_financial_record_id;
END;
$$;

alter function add_financial_record(integer, integer, integer, numeric, numeric, date) owner to sc_db_project_user;

create function show_financial_records(p_company_id integer)
    returns TABLE(record_id integer, company_name character varying, period character varying, total_revenue character varying, net_income character varying, date_reported date)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT fr.record_id,
               c.name::character varying,
               (fr.month || '/' || fr.year)::character varying,
               (fr.total_revenue::character varying || ' THB'),
               (fr.net_income::character varying || ' THB'),
               fr.date_reported
        FROM "financial_record" fr
                 JOIN "company" c ON fr.company_id = c.id
        WHERE fr.company_id = p_company_id
        ORDER BY fr.year DESC, fr.month DESC;
END;
$$;

alter function show_financial_records(integer) owner to sc_db_project_user;

create function get_yearly_financial_summary(p_company_id integer, p_year integer)
    returns TABLE(year integer, total_revenue_year character varying, total_net_income_year character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            f.year,
            (COALESCE(SUM(total_revenue), 0.00)::VARCHAR || ' THB')::VARCHAR,
            (COALESCE(SUM(net_income), 0.00)::VARCHAR || ' THB')::VARCHAR
        FROM "financial_record" AS f
        WHERE company_id = p_company_id
          AND f.year = p_year
        group by f.year;
END;
$$;

alter function get_yearly_financial_summary(integer, integer) owner to sc_db_project_user;

create function show_company()
    returns TABLE(owner_full_name character varying, company_name character varying, logo_url character varying, address character varying, city character varying, postal_code character varying, capacity integer, open_time time without time zone, close_time time without time zone, social_media_contact character varying, ev_support boolean)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT (e.first_name || ' ' || e.last_name)::VARCHAR AS owner_full_name,
               c.name,
               c.logo_url,
               c.address,
               c.city,
               c.postal_code,
               c.capacity,
               c.open_time,
               c.close_time,
               c.social_media_contact,
               c.ev_support

        FROM company c
                 JOIN owner e ON c.owner_id = e.id;
END;
$$;

alter function show_company() owner to sc_db_project_user;

create function show_company_by_id(p_company_id integer)
    returns TABLE(owner_full_name character varying, company_name character varying, logo_url character varying, address character varying, city character varying, postal_code character varying, capacity integer, open_time time without time zone, close_time time without time zone, social_media_contact character varying, ev_support boolean)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT (e.first_name || ' ' || e.last_name)::VARCHAR AS owner_full_name,
               c.name,
               c.logo_url,
               c.address,
               c.city,
               c.postal_code,
               c.capacity,
               c.open_time,
               c.close_time,
               c.social_media_contact,
               c.ev_support

        FROM company c
         JOIN owner e ON c.owner_id = e.id
        WHERE c.id = p_company_id
    ;
END;
$$;

alter function show_company_by_id(integer) owner to sc_db_project_user;

create function show_membership_plans_for_customers(p_company_id integer)
    returns TABLE(plan_name character varying, plan_detail character varying, plan_rank integer, price_thb numeric, duration_days integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT name,
               detail,
               rank,
               price,
               duration
        FROM "membership_plan"
        WHERE company_id = p_company_id
          AND is_active = TRUE -- Only show active plans
        ORDER BY rank;
END;
$$;

alter function show_membership_plans_for_customers(integer) owner to sc_db_project_user;

create function add_membership_transaction(p_member_id integer, p_amount numeric, p_payment_method character varying, p_reference_id character varying, p_description text, p_expired_date date, p_currency character varying DEFAULT 'THB'::character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_transaction_id INTEGER;
BEGIN
    INSERT INTO "membership_transaction" (
        member_id,
        amount,
        payment_method,
        reference_id,
        description,
        expired_date,
        currency,
        purchased_date
    ) VALUES (
                 p_member_id,
                 p_amount,
                 p_payment_method,
                 p_reference_id,
                 p_description,
                 p_expired_date,
                 p_currency,
                 CURRENT_DATE
             ) RETURNING id INTO new_transaction_id;

    RETURN new_transaction_id;
END;
$$;

alter function add_membership_transaction(integer, numeric, varchar, varchar, text, date, varchar) owner to sc_db_project_user;

create function add_customer(p_username character varying, p_display_name character varying, p_first_name character varying, p_middle_name character varying, p_last_name character varying, p_address character varying, p_city character varying, p_postal_code character varying, p_email character varying, p_telephone_no character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_customer_id INT;
BEGIN
    -- Insert the new customer
    INSERT INTO "customer" (username, display_name,
                            first_name, middle_name, last_name,
                            address, city, postal_code,
                            email, telephone_no, password)
    VALUES (p_username,
            p_display_name,
            p_first_name,
            p_middle_name, -- Can be NULL
            p_last_name,
            p_address,
            p_city,
            p_postal_code,
            p_email,
            p_telephone_no,
            crypt(p_password, gen_salt('bf')))
    RETURNING id INTO new_customer_id;

    RETURN new_customer_id;

EXCEPTION
    WHEN unique_violation THEN
        RAISE EXCEPTION 'User creation failed: Username or Email already exists.';
END;
$$;

alter function add_customer(varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar) owner to sc_db_project_user;

create function purchase_membership(p_customer_id integer, p_membership_plan_id integer, p_payment_method character varying, p_reference_id character varying, p_description text DEFAULT 'Membership Purchase'::text, p_currency character varying DEFAULT 'THB'::character varying) returns integer
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

create function show_company_customers(p_company_id integer)
    returns TABLE(customer_name character varying, email character varying, phone character varying, membership_type character varying, start_date date, expiry_date date, days_until_expiry character varying, status character varying)
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
                 JOIN "membership" m ON c.id = m.customer_id
                 JOIN "membership_plan" mp ON m.membership_plan_id = mp.membership_plan_id
        WHERE mp.company_id = p_company_id
        ORDER BY mp.rank DESC, m.expired_date DESC;
END;
$$;

alter function show_company_customers(integer) owner to sc_db_project_user;

create function get_total_membership_revenue(p_company_id integer) returns numeric
    language plpgsql
as
$$
DECLARE
    v_total NUMERIC(15, 2);
BEGIN
    SELECT COALESCE(SUM(mt.amount), 0.00) INTO v_total
    FROM "membership_transaction" mt
             -- Join to Plan to find out which Company owns this transaction
    WHERE mt.id = p_company_id;

    RETURN v_total;
END;
$$;

alter function get_total_membership_revenue(integer) owner to sc_db_project_user;


