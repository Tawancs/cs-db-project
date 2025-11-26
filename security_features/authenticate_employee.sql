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

