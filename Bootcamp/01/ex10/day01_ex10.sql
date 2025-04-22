SELECT person_name, pizza_name, name AS pizzeria_name
FROM (
  SELECT name AS person_name, pizza_name, pizzeria_id
  FROM (
      SELECT * 
        FROM (SELECT person_id, menu_id FROM person_order) AS person_order
        NATURAL JOIN (SELECT id AS person_id, name FROM person) as person) AS name_menu_id
  NATURAL JOIN (SELECT id AS menu_id, pizzeria_id, pizza_name FROM menu) AS name_pizza_id) AS name_namepizza
  JOIN pizzeria p ON name_namepizza.pizzeria_id = p.id
  ORDER BY person_name, pizza_name, pizzeria_name;

