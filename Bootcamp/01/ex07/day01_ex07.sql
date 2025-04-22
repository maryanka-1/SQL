SELECT *
FROM (
    SELECT order_date, CONCAT(p.name, ' (age:', p.age, ')') AS person_information
    FROM person_order pv
    JOIN person p ON pv.person_id = p.id
) AS pesult
ORDER BY order_date, person_information;