SELECT *
FROM (
    SELECT order_date, CONCAT(person.name, ' (age:', person.age, ')') AS person_information
    FROM person_order
    NATURAL JOIN (SELECT id AS person_id, name, age, gender, address FROM person) AS person
) AS result
ORDER BY order_date, person_information;