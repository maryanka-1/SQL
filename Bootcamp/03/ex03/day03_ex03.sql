WITH pizzeria_visit AS (
    SELECT *
    FROM pizzeria p
    JOIN person_visits pvv
    ON p.id = pvv.pizzeria_id
),
female AS (
SELECT 
    pizzeria_visit.name,
    COUNT(*) AS num_visits
FROM pizzeria_visit
JOIN person p
ON p.id = pizzeria_visit.person_id
WHERE gender = 'female'
GROUP BY pizzeria_visit.name
ORDER BY num_visits DESC
),
male AS (
SELECT 
    pizzeria_visit.name,
    COUNT(*) AS num_visits
FROM pizzeria_visit
JOIN person p
ON p.id = pizzeria_visit.person_id
WHERE gender = 'male'
GROUP BY pizzeria_visit.name
ORDER BY num_visits DESC   
)
SELECT f.name
FROM female f
JOIN male m
ON f.name = m.name
WHERE f.num_visits <> m.num_visits
ORDER BY name;
