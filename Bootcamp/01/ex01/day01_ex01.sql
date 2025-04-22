
SELECT object_name
FROM (
    SELECT name AS object_name, 1 as num_table
    FROM person
    UNION ALL
    SELECT pizza_name AS object_name, 2 as num_table
    FROM menu
) AS temp_tables
ORDER BY num_table, object_name;