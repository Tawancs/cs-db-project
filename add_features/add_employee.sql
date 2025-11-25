create function add_employee(p_company_id integer, p_username character varying, p_first_name character varying, p_middle_name character varying, p_last_name character varying, p_address character varying, p_city character varying, p_postal_code character varying, p_email character varying, p_telephone_no character varying, p_specialize character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_employee_id INT;
BEGIN
    INSERT INTO "employee" (
        company_id,
        username,
        first_name,
        middle_name,
        last_name,
        address,
        city,
        postal_code,
        email,
        telephone_no,
        specialize,
        password
    )
    VALUES (
               p_company_id,
               p_username,
               p_first_name,
               p_middle_name, -- This can be NULL
               p_last_name,
               p_address,
               p_city,
               p_postal_code,
               p_email,
               p_telephone_no,
               p_specialize,
               -- Securely hash the password
               crypt(p_password, gen_salt('bf'))
           )
    RETURNING id INTO new_employee_id;

    RETURN new_employee_id;

EXCEPTION
    WHEN unique_violation THEN
        RAISE EXCEPTION 'Employee creation failed: Username or Email already exists.';
END;
$$;

alter function add_employee(integer, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar) owner to sc_db_project_user;

