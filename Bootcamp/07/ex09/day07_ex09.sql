SELECT address,
TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM ROUND(MAX(age)-(MIN(age)/MAX(age::numeric)),2)::TEXT)) AS formula,
TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM ROUND(AVG(age),2)::TEXT)) AS average,
ROUND(MAX(age)-(MIN(age)/MAX(age::numeric)),2)>ROUND(AVG(age), 2) AS comparison
FROM person
GROUP BY address
ORDER BY address;