create function get_yearly_financial_summary(p_company_id integer, p_year integer)
    returns TABLE
            (
                year                  integer,
                total_revenue_year    character varying,
                total_net_income_year character varying
            )
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT f.year,
               (COALESCE(SUM(total_revenue), 0.00)::VARCHAR || ' THB')::VARCHAR,
               (COALESCE(SUM(net_income), 0.00)::VARCHAR || ' THB')::VARCHAR
        FROM "financial_record" AS f
        WHERE company_id = p_company_id
          AND f.year = p_year
        group by f.year;
END;
$$;

alter function get_yearly_financial_summary(integer, integer) owner to sc_db_project_user;

