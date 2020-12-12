--  TODO Find the total price of orders made by customers from EUROPE in 1996.



SELECT SUM(o_totalprice)
FROM nation, customer, orders, region
WHERE o_custKey = c_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
    AND o_orderdate >= '1996-01-01'
    AND o_orderdate <= '1996-12-31'