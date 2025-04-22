SELECT COALESCE(person_name, '-') AS person_name, visit_date, COALESCE(pizzeria_name, '-') AS pizzeria_name
FROM
    (SELECT person_id, visit_date, pizzeria_name
    FROM (
        SELECT *
        FROM person_visits
        WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS visits
    FULL JOIN (
        SELECT id AS pizzeria_id, name AS pizzeria_name
        FROM pizzeria
        ) AS name_pizzeria USING (pizzeria_id)) AS date_pizzeria
FULL JOIN (
    SELECT id AS person_id, name AS person_name
    FROM person
    ) AS name_id USING (person_id)
ORDER BY person_name, visit_date, pizzeria_name;