WITH pizza_pizzeria AS (
    SELECT m.pizza_name, p.name AS pizzeria_name, m.id AS menu_id
    FROM menu m
    JOIN pizzeria p
    ON p.id = m.pizzeria_id
),
pp_person_id AS (
    SELECT pizza_name, pizzeria_name, person_id
    FROM pizza_pizzeria pp
    NATURAL JOIN person_order po
)
SELECT pizza_name, pizzeria_name
FROM pp_person_id ppid
JOIN person p
ON ppid.person_id = p.id
WHERE p.name = 'Anna' OR p.name = 'Denis'
ORDER BY pizza_name, pizzeria_name;