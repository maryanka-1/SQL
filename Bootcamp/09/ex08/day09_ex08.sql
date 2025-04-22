CREATE FUNCTION fnc_fibonacci (pstop bigint default 10)
RETURNS TABLE (f bigint) AS 
$$
WITH RECURSIVE fibonachi (first, second) AS 
    (SELECT 0 AS first, 1 AS second
    UNION ALL
    SELECT second, first+second
    FROM fibonachi
    WHERE second<pstop)
SELECT first
FROM fibonachi;
$$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

