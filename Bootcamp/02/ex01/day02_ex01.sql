SELECT to_char(visit_date, 'YYYY-MM-DD') AS visit_date
FROM (
    SELECT *
    FROM (
        SELECT person_id, visit_date
        FROM person_visits
        WHERE person_id = 1 OR person_id = 2
    ) AS table_date
    RIGHT JOIN (
        SELECT generate_series AS visit_date 
        FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS generate_series
    ) AS period USING (visit_date)
) AS result
WHERE result.person_id IS NULL
ORDER BY visit_date ASC;
