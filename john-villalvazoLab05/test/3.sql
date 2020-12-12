-- For the line items ordered in May 1995(o_orderdate), 
-- find the largest discount that is less than the average discount among all the orders.


SELECT MAX(l_discount)  -- finds largest discount amount
FROM (SELECT AVG(l_discount) AS avg_discount
      FROM lineitem), orders, lineitem
WHERE l_orderkey = o_orderkey
      AND o_orderdate LIKE '1995-%'
      AND avg_discount > l_discount;