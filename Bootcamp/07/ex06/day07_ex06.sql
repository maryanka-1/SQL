SELECT name, count(*) AS count_of_orders, ROUND(AVG(m.price), 2) AS average_price, MAX(m.price) AS max_price, MIN(m.price) AS min_price
FROM person_order po
JOIN menu m 
    ON m.id = po.menu_id
JOIN pizzeria p
    ON p.id = m.pizzeria_id
GROUP BY name
ORDER BY name;