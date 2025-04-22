(SELECT p.name, count (*), 'order' AS action_type
FROM person_order po
JOIN menu m
    ON m.id = po.menu_id
JOIN pizzeria p 
    ON p.id = m.pizzeria_id
GROUP BY p.name
ORDER BY count DESC LIMIT 3)
UNION
(SELECT p.name, count (*), 'visit' AS action_type
FROM person_visits pv
JOIN pizzeria p
ON pv.pizzeria_id = p.id
GROUP BY p.name
ORDER BY count DESC LIMIT 3)
ORDER BY action_type ASC, count DESC;