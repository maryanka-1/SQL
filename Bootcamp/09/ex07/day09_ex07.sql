CREATE FUNCTION func_minimum(arr NUMERIC[])
RETURNS NUMERIC AS $$
    SELECT MIN(a) 
    FROM UNNEST(arr) AS a;
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
