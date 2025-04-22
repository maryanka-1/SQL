create table  nodes(point1 varchar NOT NULL,
              point2 varchar NOT NULL,
              cost numeric NOT NULL);

insert into nodes values ('a', 'b', 10);
insert into nodes values ('a', 'c', 15);
insert into nodes values ('a', 'd', 20);

insert into nodes values ('b', 'a', 10);
insert into nodes values ('b', 'c', 35);
insert into nodes values ('b', 'd', 25);

insert into nodes values ('c', 'a', 15);
insert into nodes values ('c', 'b',  35);
insert into nodes values ('c', 'd', 30);

insert into nodes values ('d', 'a', 20);
insert into nodes values ('d', 'b', 25);
insert into nodes values ('d', 'c', 30);

WITH temp AS (
    WITH recursive req AS (
        SELECT point1, point2, cost, 1 AS step, array[cost] AS costs, array[point1] AS path, FALSE AS visit
        FROM nodes n1
        WHERE point1 = 'a'
        UNION ALL 
        SELECT n2.point1, n2.point2, n2.cost + req.cost AS cost, req.step + 1 AS step, req.costs || n2.cost AS costs, req.path || n2.point1 AS path, n2.point1 = ANY(req.path) AS visit
        FROM nodes n2
        JOIN req
        ON req.point2 = n2.point1 AND NOT visit
    )
    SELECT cost-costs[5] AS total_cost, path AS tour
    FROM req
    WHERE 'a' = ANY(path) AND 'b' = ANY (path) AND 'c' = ANY (path) AND 'd' = ANY (path) AND path[1] = path[5]
    ORDER BY total_cost, tour
)
SELECT DISTINCT *
FROM temp
WHERE total_cost = (SELECT MIN(total_cost)
                    FROM temp);