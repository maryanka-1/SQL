WITH pre_result AS (
    SELECT menu_id, order_date
    FROM (
        SELECT id AS menu_id
        FROM menu m) AS new_menu
    LEFT JOIN person_order USING(menu_id)
),
lost_pizza AS (
    SELECT menu_id
    FROM pre_result
    WHERE order_date IS NULL
    ORDER BY menu_id
),
    pizza_non_order AS (
    SELECT lp.menu_id, pizzeria_id, pizza_name, price
    FROM lost_pizza lp
    JOIN menu m
    ON lp.menu_id = m.id
)
SELECT pizza_name, price, p.name AS name_pizzeria
FROM pizza_non_order pn
JOIN pizzeria p
ON p.id = pn.pizzeria_id
ORDER BY pizza_name, price;