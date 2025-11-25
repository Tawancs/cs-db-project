-- auto-generated definition
create function add_company(p_employee_id integer, p_name character varying, p_logo_url character varying, p_address character varying, p_city character varying, p_postal_code character varying, p_capacity integer, p_open_time time without time zone, p_close_time time without time zone, p_social_media_contact character varying, p_ev_support boolean) returns integer
    language plpgsql
as
$$
DECLARE
    new_company_id INT;
BEGIN
    INSERT INTO "company" (
        employee_id,
        name,
        logo_url,
        address,
        city,
        postal_code,
        capacity,
        open_time,
        close_time,
        social_media_contact,
        ev_support
    )
    VALUES (
               p_employee_id,
               p_name,
               p_logo_url,         -- Can be NULL
               p_address,
               p_city,
               p_postal_code,
               p_capacity,
               p_open_time,
               p_close_time,
               p_social_media_contact,
               p_ev_support        -- Pass TRUE or FALSE
           )
    RETURNING id INTO new_company_id;

    RETURN new_company_id;
END;
$$;

alter function add_company(integer, varchar, varchar, varchar, varchar, varchar, integer, time, time, varchar, boolean) owner to sc_db_project_user;

