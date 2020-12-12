-- TODO 8.  Find how many distinct customers have at least
-- TODO  one order supplied exclusively by suppliers from ASIA.


SELECT COUNT(DISTINCT(c_custkey))
FROM orders, customer
WHERE c_custkey = o_custkey
      AND o_orderkey NOT IN (SELECT DISTINCT(o_orderkey)    -- NOT IN will determine if the tuple is not inside orderkey
                             FROM nation, region, supplier, lineitem, orders
                             WHERE r_regionkey = n_regionkey
                                AND n_nationkey = s_nationkey
                                AND s_suppkey = l_suppkey
                                AND o_orderkey = l_orderkey
                                        AND r_name NOT IN ('ASIA')); --using NOT IN to make sure that the tuple returned is not from asia