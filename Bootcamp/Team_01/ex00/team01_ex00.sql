WITH bal AS (
    SELECT user_id, type, currency_id, SUM(money) AS volume
    FROM balance b
    GROUP BY user_id, type, currency_id
),
cur AS (
    SELECT id, name, MAX(updated) AS last_updated 
    FROM currency c 
    GROUP BY id, name
),
las AS (
    SELECT c1.id AS currency_id, c1.rate_to_usd
    FROM currency c1 
    JOIN cur ON c1.id = cur.id AND c1.updated = cur.last_updated
)
SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    bal.type,
    bal.volume,
    COALESCE(cur.name, 'not defined') AS currency_name,
    COALESCE(las.rate_to_usd, 1) AS last_rate_to_usd,
    CAST(bal.volume::numeric * COALESCE(las.rate_to_usd, 1) AS FLOAT) AS total_volume_in_usd
FROM bal
FULL JOIN "user" u 
    ON u.id = bal.user_id
FULL JOIN cur 
    ON cur.id = bal.currency_id
LEFT JOIN las   
    ON las.currency_id = bal.currency_id
ORDER BY name DESC, lastname, type;
