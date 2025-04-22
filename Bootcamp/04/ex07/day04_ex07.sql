SELECT *
FROM mv_dmitriy_visits_and_eats;

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT MAX(id)+1
        FROM person_visits pv),
    (SELECT id
        FROM person c
        WHERE name = 'Dmitriy'),
    (SELECT p.id
        FROM pizzeria p
        inner join menu m 
        ON p.id = m.pizzeria_id
        WHERE p.name <> 'Papa Johns' 
            AND price < 800
        LIMIT 1),
    '2022-01-08'
    )
ON CONFLICT (id) DO NOTHING;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT *
FROM mv_dmitriy_visits_and_eats;

-- DELETE FROM person_visits
-- WHERE id = 22;