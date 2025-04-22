UPDATE menu
SET price = ROUND(800*0.9)
WHERE pizza_name = 'Greek pizza';

SELECT *
FROM menu;