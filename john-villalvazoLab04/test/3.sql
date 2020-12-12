-- TODO How many orders are made by customers in each country in ASIA?

SELECT n_name, COUNT(DISTINCT o_orderkey)
FROM orders, customer, nation, lineitem
WHERE o_custkey = c_custkey
    AND l_orderkey = o_orderkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = 2
    GROUP BY n_name;