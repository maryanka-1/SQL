SELECT address, pz.name, count(*) AS count_of_orders
FROM person_order po
JOIN menu m
    ON m.id = po.menu_id
JOIN pizzeria pz
    ON pz.id = m.pizzeria_id
JOIN person p
    ON p.id = po.person_id
GROUP BY address, pz.name
ORDER BY address, pz.name;