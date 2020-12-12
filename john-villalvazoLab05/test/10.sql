-- How many customers from every region have never placed an order 
-- and have more than the averageaccount balance?
SELECT r_name, COUNT(DISTINCT c_custkey)
FROM customer, nation, region, orders
WHERE c_nationkey = n_nationkey AND
      n_regionkey = r_regionkey AND
      NOT c_custkey IN (SELECT o_custkey
                        FROM orders) AND
      c_acctbal > (SELECT AVG(c_acctbal)
                       FROM customer)
GROUP BY r_name;

