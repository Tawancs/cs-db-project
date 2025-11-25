-- auto-generated definition
create function add_customer(p_member_id integer, p_username character varying, p_display_name character varying, p_first_name character varying, p_middle_name character varying, p_last_name character varying, p_address character varying, p_city character varying, p_postal_code character varying, p_email character varying, p_telephone_no character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_customer_id INT;
BEGIN
    -- Insert the new customer
    INSERT INTO "customer" (
        member_id, username, display_name,
        first_name, middle_name, last_name,
        address, city, postal_code,
        email, telephone_no, password
    )
    VALUES (
               p_member_id,
               p_username,
               p_display_name,
               p_first_name,
               p_middle_name, -- Can be NULL
               p_last_name,
               p_address,
               p_city,
               p_postal_code,
               p_email,
               p_telephone_no,
               p_password
           )
    RETURNING id INTO new_customer_id;

    -- Return the ID of the new customer
    RETURN new_customer_id;

EXCEPTION
    -- Catch duplicate username or email errors nicely
    WHEN unique_violation THEN
        RAISE EXCEPTION 'User creation failed: Username or Email already exists.';
END;
$$;

alter function add_customer(integer, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar) owner to sc_db_project_user;

