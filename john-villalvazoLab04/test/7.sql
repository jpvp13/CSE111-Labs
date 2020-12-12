--  TODO How many orders do customers in every country in EUROPE have in 
--  TODO each status? 
--  TODO Print the country name, the order status, and the count.

SELECT n_name, o_orderstatus, COUNT(o_orderkey)
FROM nation, orders, customer
WHERE o_custkey = c_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = 3
    GROUP BY n_name, o_orderstatus;