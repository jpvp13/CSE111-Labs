
SELECT c_region, s_region, COUNT(*) 
FROM 
    (SELECT *, r_name AS c_region
    FROM orders
    INNER JOIN customer ON orders.o_custkey = customer.c_custkey
    INNER JOIN nation ON nation.n_nationkey = customer.c_nationkey
    INNER JOIN region ON nation.n_regionkey = region.r_regionkey),
    (SELECT *,r_name AS s_region
        FROM lineitem
        INNER JOIN supplier ON supplier.s_suppkey = lineitem.l_suppkey
        INNER JOIN nation ON supplier.s_nationkey = nation.n_nationkey
        INNER JOIN region ON region.r_regionkey = nation.n_regionkey)
WHERE l_orderkey = o_orderkey
GROUP BY c_region,s_region;