create function all_company() returns SETOF company
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT * FROM "company";
END;
$$;

alter function all_company() owner to sc_db_project_user;

