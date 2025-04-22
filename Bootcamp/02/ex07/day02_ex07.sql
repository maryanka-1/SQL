WITH menu_pizzeria AS ( 
    SELECT m.id, m.pizzeria_id, m.pizza_name, m.price, p.name AS pizzeria_name
    FROM menu m
    JOIN pizzeria p
    ON p.id = m.pizzeria_id
    WHERE price<800
),
visit_pers AS (
    SELECT *
    FROM person_visits pv
    JOIN person p
    ON pv.person_id = p.id
)
SELECT mp.pizzeria_name
FROM visit_pers vp
JOIN menu_pizzeria mp
ON vp.pizzeria_id = mp.pizzeria_id
WHERE visit_date = '2022-01-08'
    AND vp.name = 'Dmitriy'
;