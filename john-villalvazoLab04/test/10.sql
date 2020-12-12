
--  TODO Find the average discount for every part having PROMO in its type.

SELECT p_type, AVG(l_discount) AS discount
FROM part, lineitem
WHERE l_partkey = p_partkey
    AND p_type LIKE 'PROMO %'
    GROUP BY p_type;