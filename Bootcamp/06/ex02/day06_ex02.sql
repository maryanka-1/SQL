SELECT p.name, m.pizza_name, price, TRIM_SCALE(price - price*(discount/100)) AS discount_price, pz.name AS pizzeria_name
FROM person_order po 
JOIN menu m
    ON m.id = po.menu_id
JOIN person p
    ON p.id = po.person_id
JOIN person_discounts pd 
    ON pd.person_id = po.person_id AND pd.pizzeria_id = m.pizzeria_id    
JOIN pizzeria pz 
    ON pz.id = m.pizzeria_id
ORDER BY p.name, m.pizza_name;