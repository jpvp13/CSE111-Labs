-- TODO Find the number of distinct orders completed in 1994 by the suppliers in every country. 
-- TODO An order status of F stands for complete. 
-- TODO Print only those countries for which the number of orders is larger than 300.



SELECT n_name, COUNT(DISTINCT(l_orderkey))
FROM orders, supplier, nation, region, lineitem
WHERE s_nationkey = n_nationkey 
      AND n_regionkey = r_regionkey 
      AND l_suppkey = s_suppkey 
      AND o_orderkey = l_orderkey 
      AND o_orderstatus = 'F'
      AND o_orderdate >= '1994-01-01'
      AND o_orderdate <= '1994-12-31'
GROUP BY n_name
HAVING COUNT(DISTINCT(l_orderkey)) > 300;


-- SELECT n_name,  COUNT(DISTINCT (l_orderkey))
-- FROM nation, orders, supplier, lineitem, region
-- WHERE l_orderkey = o_orderkey
--     AND s_nationkey = n_regionkey
--     AND n_regionkey = r_regionkey
--     AND l_suppkey = s_suppkey
--     AND o_orderstatus = 'F'
--     AND o_orderdate >= '1994-01-01'
--     AND o_orderdate <= '1994-12-31'
-- GROUP BY n_name
-- HAVING COUNT( l_orderkey) > 300;