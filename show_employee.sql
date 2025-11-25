create function show_employee(p_company_id integer)
    returns TABLE(company_name character varying, username character varying, first_name character varying, middle_name character varying, last_name character varying, address character varying, city character varying, postal_code character varying, email character varying, telephone_no character varying, specialize character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            (SELECT c.name FROM company AS c
             WHERE c.id = e.company_id),
            e.username,
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

