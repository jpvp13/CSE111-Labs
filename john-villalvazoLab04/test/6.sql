
SELECT s_name, o_orderpriority, COUNT(o_orderkey)
FROM supplier, orders, nation, part, lineitem
WHERE s_nationkey = n_nationkey
    AND p_partkey = l_partkey
    AND l_suppkey = s_suppkey
    AND l_orderkey = o_orderkey
    AND n_regionkey = 1
    GROUP BY s_name, o_orderpriority;