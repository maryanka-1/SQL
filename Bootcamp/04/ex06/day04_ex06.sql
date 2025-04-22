CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT p.name AS pizza_name
FROM menu m 
INNER JOIN pizzeria p
    ON p.id = m.pizzeria_id
INNER JOIN person_visits pv
    ON m.pizzeria_id = pv.pizzeria_id
INNER JOIN person c
    ON pv.person_id = c.id
WHERE price < 800 
    AND c.name = 'Dmitriy' 
    AND visit_date = '2022-01-08';

SELECT *
FROM mv_dmitriy_visits_and_eats;

-- DELETE FROM person_visits
-- WHERE id = 22;