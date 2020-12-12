--   Count the number of orders made in the fourth quarter of1996in which
--    at least one item was receivedby a customer later than its commit date.  
--    List the count of such orders for every order priority sortedin ascending priority order.
SELECT o_orderpriority, COUNT(*) 
FROM orders 
WHERE (o_orderdate BETWEEN ('1996-10-01') AND ('1996-12-31')) AND
       EXISTS (SELECT * 
               FROM lineitem 
               WHERE l_orderkey = o_orderkey AND
                     l_receiptdate > l_commitdate)
       GROUP BY o_orderpriority;
       