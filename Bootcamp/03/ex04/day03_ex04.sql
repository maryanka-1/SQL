WITH pizz_menu AS (
    SELECT pizzeria_id, person_id
    FROM menu m
    JOIN person_order po
    ON m.id = po.menu_id
),
person_pizzeria AS (
SELECT person_id, name AS pizzeria_name
FROM pizz_menu pm
JOIN pizzeria p
ON pm.pizzeria_id = p.id
),
gender_pizzeria AS (
SELECT pizzeria_name, gender
FROM person_pizzeria pp
JOIN person p
ON p.id = pp.person_id
), 
female_order AS (
SELECT *
FROM gender_pizzeria
WHERE gender = 'female'
UNION
SELECT *
FROM gender_pizzeria
WHERE gender = 'female'
),
male_order AS (
SELECT *
FROM gender_pizzeria
WHERE gender = 'male'
UNION
SELECT *
FROM gender_pizzeria
WHERE gender = 'male'
),
match_pizzeria
SELECT pizzeria_name
FROM (
    SELECT *
    FROM female_order 
    UNION
    SELECT *
    FROM male_order) AS result
WHERE pizzeria_name NOT IN (
    SELECT mo.pizzeria_name
    FROM male_order mo
    JOIN female_order fo
    ON mo.pizzeria_name = fo.pizzeria_name)
;
