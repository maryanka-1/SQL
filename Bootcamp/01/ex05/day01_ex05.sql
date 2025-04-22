SELECT person.id, person.name, person.age, person.gender, person.address, 
pizzeria.id as id_pizzeria, pizzeria.name as name_pizzeria, pizzeria.rating
FROM person
CROSS JOIN pizzeria
ORDER BY id;