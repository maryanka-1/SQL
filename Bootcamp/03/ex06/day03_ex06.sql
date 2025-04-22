WITH ppp AS (
    SELECT m.pizza_name, p.name AS pizzeria_name, price
    FROM menu m
    JOIN pizzeria p
    ON m.pizzeria_id = p.id
)
SELECT p1.pizza_name, p1.pizzeria_name AS pizzeria_name_1, p2.pizzeria_name AS pizzeria_name_2, p1.price
FROM ppp p1
JOIN ppp p2
ON (p1.pizza_name = p2.pizza_name AND p1.price = p2.price)
AND p2.pizzeria_name > p1.pizzeria_name
ORDER BY pizza_name;