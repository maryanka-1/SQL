SELECT p1.name AS person1, p2.name AS person2, p1.address AS common_address
FROM person p1
JOIN person p2 
ON p1.address = p2.address
AND p2.id < p1.id;
