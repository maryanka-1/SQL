WITH list_person AS (
    SELECT id AS person_id, name
    FROM person
    WHERE gender = 'female'
),
list_menu AS (
    SELECT person_id, m.id AS menu_id, pizza_name
    FROM menu m
    JOIN person_order po
    ON m.id = po.menu_id
    WHERE pizza_name IN ('cheese pizza', 'pepperoni pizza')
),
person_pizza AS (
    SELECT *
    FROM list_menu
    NATURAL JOIN list_person
),
list_cheese AS (
    SELECT *
    FROM person_pizza
    WHERE pizza_name = 'cheese pizza'
),
list_pepperoni AS (
    SELECT *
    FROM person_pizza
    WHERE pizza_name = 'pepperoni pizza'
)
SELECT lc.name AS name
FROM list_cheese lc
JOIN list_pepperoni lpp
ON lc.person_id = lpp.person_id
ORDER BY name ASC;