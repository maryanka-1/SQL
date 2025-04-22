WITH pre_result AS (
    SELECT menu_id, order_date
    FROM (
        SELECT id AS menu_id
        FROM menu m) AS new_menu
    LEFT JOIN person_order USING(menu_id)
)
SELECT menu_id
FROM pre_result
WHERE order_date IS NULL
ORDER BY menu_id;