WITH list_person AS (
    SELECT id AS person_id, name
    FROM person
    WHERE gender = 'male' 
    AND (address = 'Moscow'
        OR address = 'Samara')
),
list_menu AS (
    SELECT id AS menu_id
    FROM menu
    WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
),
person_who_order AS (
    SELECT *
    FROM person_order po
    JOIN list_person lp
    ON po.person_id = lp.person_id
)

SELECT name
FROM person_who_order pwo
JOIN list_menu lm
ON pwo.menu_id = lm.menu_id
ORDER BY name DESC;