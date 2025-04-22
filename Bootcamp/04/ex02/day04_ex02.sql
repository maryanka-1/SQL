-- DROP VIEW v_generated_dates;

CREATE VIEW v_generated_dates AS
SELECT gs::date
FROM generate_series('2022-01-01', '2022-01-31', interval '1 day') as gs
ORDER BY gs;

SELECT *
FROM v_generated_dates;