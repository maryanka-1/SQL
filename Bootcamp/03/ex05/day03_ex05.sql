WITH pizza_menu AS (
    SELECT m.id AS menu_id, p.id AS pizzeria_id, p.name AS pizzeria_name
    FROM menu m
    JOIN pizzeria p
    ON p.id = m.pizzeria_id
),
andrey_order AS (
    SELECT pizzeria_name
    FROM (
        SELECT p.name, menu_id 
        FROM person p
        JOIN person_order po
        ON p.id = po.person_id
        WHERE p.name = 'Andrey') AS order_a
    JOIN pizza_menu pm
    ON order_a.menu_id = pm.menu_id
),
andrey_visit AS (
    SELECT p.name AS pizzeria_name
    FROM (
        SELECT p.name, pizzeria_id
        FROM person p
        JOIN person_visits pv
        ON p.id = pv.person_id
        WHERE p.name = 'Andrey') AS visit
    JOIN pizzeria p
    ON p.id = visit.pizzeria_id
)
SELECT *
FROM andrey_visit v
EXCEPT
SELECT *
FROM andrey_order o
;