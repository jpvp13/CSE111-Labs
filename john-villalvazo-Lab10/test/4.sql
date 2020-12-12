/*
 Create triggers that update the attribute o_orderpriority to HIGH every
 time a newline item tupleis added to or deleted from that order.  
 Delete all the line items corresponding to orders from November 1996. 
  Write a query that returns the number of HIGH priority orders in the
   fourth trimester of 1996.Put all the SQL statements in filetest/4.sql.
*/


CREATE TRIGGER t4_insert AFTER INSERT ON lineitem
BEGIN
        UPDATE orders
        SET o_orderpriority = 'HIGH'
        WHERE o_orderkey = new.l_orderkey;
END;

CREATE TRIGGER t4_delete AFTER DELETE ON lineitem
BEGIN
        UPDATE orders
        SET o_orderpriority = 'HIGH'
        WHERE o_orderkey = old.l_orderkey;
END;

-- DELETE FROM lineitem
-- WHERE l_orderkey IN (SELECT o_orderkey 
--                     FROM orders
--                     WHERE o_orderdate BETWEEN '1996-11-01' AND '1996-11-30');



SELECT COUNT(*)
FROM orders
WHERE o_orderpriority = 'HIGH'
    AND o_orderdate LIKE '1996-11%';