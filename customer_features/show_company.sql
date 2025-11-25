create function show_company()
    returns TABLE(owner_full_name character varying, company_name character varying, logo_url character varying, address character varying, city character varying, postal_code character varying, capacity integer, open_time time without time zone, close_time time without time zone, social_media_contact character varying, ev_support boolean)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT
            (e.first_name || ' ' || e.last_name)::VARCHAR AS owner_full_name,
            c.name,
            c.logo_url,
            c.address,
            c.city,
            c.postal_code,
            c.capacity,
            c.open_time,
            c.close_time,
            c.social_media_contact,
            c.ev_support

        FROM company c
                 JOIN employee e ON c.employee_id = e.id;
END;
$$;

alter function show_company() owner to sc_db_project_user;

