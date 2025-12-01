create function approve_request_and_create_employee(p_email character varying, p_salary numeric,
                                                    p_contract_type character varying,
                                                    p_contract_period character varying) returns integer
    language plpgsql
as
$$
DECLARE
r RECORD;
    v_new_username
VARCHAR;
    v_new_password
VARCHAR;
    v_employee_id
INTEGER;
BEGIN
SELECT *
INTO r
FROM "request_form"
WHERE request_form.email = p_email;

v_new_username
:= lower(r.first_name || '.' || r.last_name || r.request_id);
    -- Password: Default temporary password
    v_new_password
:= 'changeme1234';

    v_employee_id
:= add_employee(
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
            p_salary,           
            CURRENT_DATE,       
            p_contract_type,    
            p_contract_period   
     );

    -- delete the request 
DELETE
FROM "request_form"
WHERE email = p_email;

RETURN v_employee_id;
END;
$$;

alter function approve_request_and_create_employee(varchar, numeric, varchar, varchar) owner to sc_db_project_user;

