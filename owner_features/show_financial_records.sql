create function show_financial_records(p_company_id integer)
    returns TABLE(record_id integer, company_name character varying, period character varying, total_revenue character varying, net_income character varying, date_reported date)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
        SELECT fr.record_id,
               c.name::character varying,
               (fr.month || '/' || fr.year)::character varying,
               (fr.total_revenue::character varying || ' THB'),
               (fr.net_income::character varying || ' THB'),
               fr.date_reported
        FROM "financial_record" fr
                 JOIN "company" c ON fr.company_id = c.id
        WHERE fr.company_id = p_company_id
        ORDER BY fr.year DESC, fr.month DESC;
END;
$$;

alter function show_financial_records(integer) owner to sc_db_project_user;

