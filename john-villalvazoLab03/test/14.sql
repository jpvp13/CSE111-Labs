-- Find how many 1-URGENT priority orders have been posted by customers from FRANCE between 1994 and 1996, combined.

SELECT COUNT(*)
    FROM orders
    WHERE o_orderpriority = '1-URGENT'
    AND o_orderdate >= '1994-01-01' 
    AND o_orderdate <= '1996-12-31' 
    AND o_custkey IN(
        SELECT c_custkey
        FROM customer
        WHERE c_nationkey =(
            SELECT n_nationkey
            FROM nation
            WHERE n_name = "FRANCE"
        )
    )



/*
SELECT where are choosing all tupples
    FROM orders table
    WHERE orderpriority equals the requested data
    AND order date is between first day of 1994
    AND order date is between last day of 1996
        SELECT customer key
        FROM customer table
        WHERE nation key inside of customer table is =...
            SELECT nation key inside of nation table
            FROM nation table
            WHERE name inside of nation table = "FRANCE"

-- SELECT COUNT(o_orderpriority)
-- FROM orders, nation, customer
-- WHERE o_orderpriority = '1-URGENT'
--     AND o_orderkey = c_custkey
--     AND c_nationkey = n_nationkey
--     AND n_name = "FRANCE"
--     AND (o_orderdate) >= '1994-01-01' 
--     AND (o_orderdate) <= '1996-12-31';


--     SELECT AVG(o_orderdate)
-- FROM orders
-- WHERE o_orderpriority = '1-URGENT'
-- AND o_custkey IN (
-- 	SELECT c_custkey 
--     FROM customer
--     WHERE c_nationkey = (
-- 		SELECT n_nationkey
--         FROM nation
--         WHERE n_name = "FRANCE"
--     )
-- ) and o_orderdate >= 1994 AND o_orderdate <= 1996

