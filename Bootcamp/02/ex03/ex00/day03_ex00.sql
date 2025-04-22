WITH person_pizzeria AS (
    SELECT p.name, p.id AS person_id, pz.pizzeria_id, pz.visit_date
    FROM person p
    JOIN person_visits pz ON p.id = pz.person_id
    WHERE p.name = 'Kate'
),
menu_pizzeria AS (
    SELECT m.pizza_name, m.price, pp.pizzeria_id, pp.visit_date
    FROM person_pizzeria pp
    JOIN menu m ON pp.pizzeria_id = m.pizzeria_id
),
result AS (
    SELECT mp.pizza_name, mp.price, p.name AS pizzeria_name, mp.visit_date
    FROM menu_pizzeria mp
    JOIN pizzeria p ON p.id = mp.pizzeria_id
)
SELECT *
FROM result
WHERE (price >= 800 AND price <= 1000)
ORDER BY pizza_name, price, pizzeria_name;
