INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (
    (SELECT MAX(id)+1
    FROM menu), 
    (SELECT id
    FROM pizzeria
    WHERE name = 'Dominos'),
    'Sicilian pizza',
    900
    )
ON CONFLICT (id) DO NOTHING;

-- DELETE FROM menu
-- WHERE id = 21;

SELECT *
FROM menu;
