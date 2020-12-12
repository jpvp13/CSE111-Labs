--  TODO Find the customers that received at least a 5% discount for at least 70 items. 
-- TODO Print the custkey and the number of discounted items.



-- from bryan
-- SELECT *
-- FROM (SELECT COUNT(c_name) AS amtCust, l_discount, c_name
--       FROM lineitem, orders, customer
--       WHERE l_discount >= .04
--             AND c_name >= 70
--             AND l_orderkey = o_orderkey
--             AND o_custkey = c_custkey
--             GROUP BY c_name);


SELECT  c_custkey, COUNT(l_quantity)
FROM lineitem, orders, customer
WHERE o_orderkey = l_orderkey
AND c_custkey = o_custkey
AND l_discount >= 0.05
GROUP BY c_custkey
HAVING COUNT(l_quantity) >= 70;


-- SELECT DISTINCT c_custkey, SUM(l_quantity) 
-- FROM customer, orders, lineitem
-- WHERE o_orderkey = l_orderkey
-- AND o_custkey = c_custkey
-- AND l_discount >= .04
-- UNION
-- SELECT c_custkey, l_quantity
-- FROM lineitem, customer
-- WHERE l_quantity >= 70;
      -- WHERE l_discount >= 0.4)cust

