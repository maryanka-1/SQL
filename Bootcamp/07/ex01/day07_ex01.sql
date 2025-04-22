SELECT p.name, count(*) AS count_of_visits
FROM person_visits pv
JOIN person p 
ON p.id = pv.person_id
GROUP BY p.name, pv.person_id
ORDER BY count_of_visits DESC, person_id ASC LIMIT 4;