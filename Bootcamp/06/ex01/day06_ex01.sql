INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
    ROW_NUMBER( ) OVER ( ) AS id,
    person_id,
    m.pizzeria_id,
    CASE WHEN count(*) = 1 THEN 10.5
        WHEN count(*) = 2 THEN 22
        ELSE 30
    END AS discount
FROM person_order po 
JOIN menu m 
ON m.id = po.menu_id
GROUP BY person_id, m.pizzeria_id;

SELECT *
FROM person_discounts;

-- DELETE FROM person_discounts
-- WHERE id >0;