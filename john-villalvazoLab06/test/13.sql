-- 13.  Find the nation(s) with the most developed industry, i.e., 
-- selling items totaling the largest amount ofmoney (lextendedprice) in1996(lshipdate).

SELECT n_name AS nation --just the name of the column for readability
FROM orders, lineitem, nation, supplier
WHERE s_nationkey = n_nationkey
    AND l_suppkey = s_suppkey
    AND l_shipdate BETWEEN '1996-01-01' AND '1996-12-31'    --checks betwen the entirety of 1996 
    AND o_orderkey = l_orderkey 
GROUP BY n_name
HAVING SUM(l_extendedprice) = (SELECT MAX(tot)  --select the largest value
                                FROM (SELECT SUM(l_extendedprice) AS tot    --from the renamed SUM of extenedprice called tot
                                    FROM orders, lineitem, nation, supplier
                                    WHERE s_nationkey = n_nationkey
                                        AND s_suppkey = l_suppkey
                                        AND l_shipdate BETWEEN '1996-01-01' AND '1996-12-31'    --checks betwen the entirety of 1996 
                                        AND o_orderkey = l_orderkey
                                    GROUP BY n_name) AS tot);   --passes value called tot to SELECT MAX(tot)