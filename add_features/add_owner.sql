create function add_owner(p_username character varying, p_display_name character varying,
                          p_first_name character varying, p_middle_name character varying,
                          p_last_name character varying, p_address character varying, p_city character varying,
                          p_postal_code character varying, p_email character varying, p_telephone_no character varying,
                          p_password character varying) returns integer
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

