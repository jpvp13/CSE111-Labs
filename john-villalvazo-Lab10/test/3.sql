/*
Create a trigger t3 that resets the comment to Positive balance if the balance
goes back positive from negative.  Write a SQL statement that sets the balance to 100 
for all the customers in ROMANIA. Write a query that returns the number of customers 
with negative balance from EUROPE. Put all the SQL statements in file test/3.sql
*/

CREATE TRIGGER t3 AFTER UPDATE ON customer
BEGIN
    UPDATE customer
    SET c_comment = 'Positive balance'
    WHERE c_custkey = new.c_custkey
        AND new.c_acctbal > 0
        AND old.c_acctbal < 0;
END;

UPDATE customer
SET c_acctbal = 100
WHERE c_nationkey = 19;

SELECT COUNT(*)
FROM customer, region, nation
WHERE c_acctbal < 0
    AND c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey 
    AND r_regionkey = 3;
