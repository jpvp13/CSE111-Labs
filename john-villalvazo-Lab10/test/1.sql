/*
Create a trigger t1 that for every new order entry automatically fills the o_orderdate attribute with 
the date 2020-12-01.  Insert into orders all the orders from November 1995, paying close attention on 
how the o_orderkey attribute is set.  Write a query that returns the number of orders from 2020. Put all 
the three SQL statements in filetest/1.sql. 
*/



DROP TRIGGER t1;


CREATE TRIGGER t1 BEFORE INSERT ON orders   --insert before the orders is called to select all
BEGIN
    update orders
    set o_orderdate = '2020-12-01'
    where o_orderkey = new.o_orderkey;
end;


DELETE FROM orders      --Delete any stragglers that are made when inserting to not pollute the result in the select all SQL statement
WHERE o_orderkey = 'o_orderkey';

INSERT INTO orders(o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate, o_orderpriority, o_clerk, o_shippriority, o_comment)
VALUES ('o_orderkey', 'o_custkey', 'o_orderstatus', 'o_totalprice', '1995-11-%%', 'o_orderpriority', 'o_clerk', 'o_shippriority', 'o_comment');


SELECT COUNT(*)
FROM orders
WHERE o_orderdate LIKE '2020-%%-%%';