SELECT name, count(*) AS total_count
FROM ((SELECT p.name
FROM person_order po
JOIN menu m
    ON m.id = po.menu_id
JOIN pizzeria p 
    ON p.id = m.pizzeria_id
)
UNION ALL
(SELECT p.name
FROM person_visits pv
JOIN pizzeria p
ON pv.pizzeria_id = p.id
)) AS new_list
GROUP BY name
ORDER BY total_count DESC, name ASC
;