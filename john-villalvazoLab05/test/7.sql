/*
For every order priority, count the number of parts ordered in 1996 and received later (l receiptdate)
than the commit date (l commitdate). List the results in descending priority order.
*/

-- select o_orderpriority, COUNT(p_partkey)
-- from orders, part, lineitem
-- where o_orderkey=l_orderkey and
-- l_partkey=p_partkey and
-- o_orderdate between '1996-01-01' and '1996-12-31' and
-- l_receiptdate<l_commitdate 
-- group by o_orderpriority
-- order by o_orderpriority DESC;

---------------------
SELECT o_orderpriority, COUNT(o_orderkey)
FROM orders, lineitem
WHERE o_orderkey = l_orderkey AND
      o_orderdate BETWEEN '1996-01-01' AND '1996-12-31' AND
      l_receiptdate > l_commitdate
GROUP BY o_orderpriority
ORDER BY o_orderpriority DESC;