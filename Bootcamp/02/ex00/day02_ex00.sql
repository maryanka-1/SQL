SELECT name, rating
FROM (
    SELECT *
    FROM (
        SELECT id AS pizzeria_id, name, rating
        FROM pizzeria) AS pizzeria_new
    LEFT JOIN person_visits USING (pizzeria_id)) AS result
WHERE result.id IS NULL;