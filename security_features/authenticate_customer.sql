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

