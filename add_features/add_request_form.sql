create function add_request_form(p_company_id integer, p_first_name character varying, p_middle_name character varying,
                                 p_last_name character varying, p_address character varying, p_city character varying,
                                 p_postal_code character varying, p_email character varying,
                                 p_telephone_no character varying, p_specialize character varying) returns integer
    language plpgsql
as
$$
DECLARE
    new_request_id INTEGER;
BEGIN
    INSERT INTO "request_form" (company_id, first_name, middle_name, last_name,
                                address, city, postal_code, email, telephone_no, specialize)
    VALUES (p_company_id, p_first_name, p_middle_name, p_last_name,
            p_address, p_city, p_postal_code, p_email, p_telephone_no, p_specialize)
    RETURNING request_id INTO new_request_id;

    RETURN new_request_id;
END;
$$;

alter function add_request_form(integer, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar, varchar) owner to sc_db_project_user;

