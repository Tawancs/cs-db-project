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

