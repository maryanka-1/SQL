set enable_seqscan =off;
EXPLAIN ANALYZE
SELECT m.pizza_name, p.name AS pizzeria_name 
FROM menu m
JOIN pizzeria p
ON p.id = m.pizzeria_id;
