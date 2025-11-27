create function add_employee(p_company_id integer, p_username character varying, p_first_name character varying,
                             p_middle_name character varying, p_last_name character varying,
                             p_address character varying, p_city character varying, p_postal_code character varying,
                             p_email character varying, p_telephone_no character varying,
                             p_specialize character varying, p_password character varying, p_salary numeric,
                             p_hire_date date, p_contract_type character varying,
                             p_contract_period character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INTEGER;
BEGIN
    INSERT INTO "employee" (company_id, username, first_name, middle_name, last_name,
                            address, city, postal_code, email, telephone_no,
                            specialize, password,
                            salary, hire_date, contract_type, contract_period)
    VALUES (p_company_id, p_username, p_first_name, p_middle_name, p_last_name,
            p_address, p_city, p_postal_code, p_email, p_telephone_no,
            p_specialize, p_password,
            p_salary, p_hire_date, p_contract_type, p_contract_period)
    RETURNING id INTO v_id;
    RETURN v_id;
END;
$$;

alter function add_employee(integer, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, numeric, date, varchar, varchar) owner to sc_db_project_user;

