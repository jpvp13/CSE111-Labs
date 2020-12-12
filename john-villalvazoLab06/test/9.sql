-- TODO 9.  Find the parts (pname) ordered by customers from AMERICA that are supplied by exactly 4 distinctsuppliers from ASIA.


SELECT DISTINCT p_name
FROM part, lineitem
WHERE l_orderkey IN ( --checks to see that the follow is true
           SELECT o_orderkey
            FROM region, nation, customer, orders
            WHERE r_name = 'AMERICA'    --checks that orderkey is within the following parameters and are from AMERICA
                AND r_regionkey = n_regionkey 
                AND c_nationkey = n_nationkey   --checking that all these elements match
                AND c_custkey = o_custkey)
    AND p_partkey IN (  --checks to see that the following are true within p_partkey
            SELECT l_partkey
            FROM region, nation, supplier, lineitem
            WHERE r_name = 'ASIA'   --checks that partkey is within the following parameters and are from ASIA
                AND r_regionkey = n_regionkey
                AND n_nationkey = s_nationkey --checking that all these elements match
                AND s_suppkey = l_suppkey
            GROUP BY l_partkey
            HAVING COUNT(DISTINCT l_suppkey) = 4)   --once the reponse of the subquery is given and passed to p_partkey, we then check to make sure that newly passed value is = 4
    AND
    p_partkey = l_partkey
GROUP BY l_orderkey;