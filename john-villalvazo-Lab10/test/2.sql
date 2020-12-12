/*
Create  a  trigger t2 that  sets  a  warning Negative balance!!! in  the  comment  attribute
of  the customer table  every  time c_acctbal is  updated  to  a  negative  value  from  a  
positive  one.   Write  a SQL  statement  that  sets  the  balance  to -100 for  all  the  customers  
in EUROPE.  Write  a  query  that returns the number of customers with negative balance from FRANCE.
 Put all the SQL statements in file test/2.sql
*/

CREATE TRIGGER t2 AFTER UPDATE ON customer
BEGIN
    UPDATE customer
    SET c_comment = 'Negative balance!!!'
    WHERE c_custkey = new.c_custkey
        AND new.c_acctbal < 0
        AND old.c_acctbal > 0;
END;

-- UPDATE customer
-- SET c_acctbal = -100
-- WHERE c_nationkey = (SELECT n_nationkey
--                     FROM nation, region
--                     WHERE n_regionkey = r_regionkey
--                         AND r_regionkey = 3);


UPDATE customer
SET c_acctbal = -100
WHERE c_nationkey IN (SELECT n_nationkey
                      FROM nation,
                           region
                      WHERE n_regionkey = r_regionkey
                        AND r_regionkey = 3);

SELECT COUNT(*)
FROM customer, nation
WHERE c_nationkey = n_nationkey 
    AND c_acctbal LIKE '-%'
    AND n_nationkey = '6';