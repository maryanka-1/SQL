INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'Greek pizza', 800)
ON CONFLICT (id) DO NOTHING;

SELECT *
FROM menu;