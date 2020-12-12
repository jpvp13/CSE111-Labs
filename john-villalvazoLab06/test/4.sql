-- TODO 4.  Find how many suppliers from CANADA supply at least 4 different parts.

SELECT DISTINCT COUNT(*)
FROM 
    (SELECT ps_suppkey 
    FROM partsupp
     JOIN(
        SELECT s_suppkey
        FROM nation, supplier
        WHERE s_nationkey = n_nationkey
            AND n_name = 'CANADA'
    )
WHERE s_suppkey = ps_suppkey
GROUP BY ps_suppkey
HAVING COUNT(*) >= 4
)cust