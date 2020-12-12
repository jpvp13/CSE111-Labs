
--  TODO Find the number of orders made by customers from PERU in 1996.


SELECT COUNT(DISTINCT o_orderkey)
FROM part, nation, orders, customer
WHERE c_custkey = o_custkey
    AND c_nationkey = n_nationkey
    AND n_name = 'PERU'
    AND o_orderdate LIKE '1996-%';