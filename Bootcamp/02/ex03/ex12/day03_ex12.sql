INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT s+(SELECT MAX(id)
        FROM person_order) AS id,
       id,
       (SELECT id
        FROM menu
        WHERE pizza_name = 'Greek pizza'),
       '2022-02-25'
FROM person 
INNER JOIN generate_series(1,(select count(*) from person)) as s 
ON s = person.id
ON CONFLICT (id) DO NOTHING
;

-- DELETE FROM person_order
-- WHERE id > 22;

SELECT *
FROM person_order;
