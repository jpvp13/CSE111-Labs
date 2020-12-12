-- TODO 2.  Find the number of customers that had at most two orders in August 1996(o_orderdate).

-- SELECT SUM(c_custkey) 
-- FROM customer, orders
-- WHERE  o_custkey = c_custkey
--     -- AND o_orderkey <= 2
--     AND o_orderdate = '1996-08-01'
--     GROUP BY o_custkey
-- HAVING COUNT(*) <= 2;
    -- AND  o_orderdate = '1996-08-31';

SELECT COUNT(*)
FROM 
    (SELECT o_custkey
    FROM orders
    WHERE strftime('%Y', o_orderdate) = '1996' 
        AND strftime('%m', o_orderdate) = '08'
        GROUP BY o_custkey
HAVING COUNT(*) <= 2) cust

-- ! SELECT COUNT(*) returns ALL choices
-- ! FROM (subquery) where the year and month match, which is grouped by the customerkey since all are distinct
-- ! we want COUNT(*) which returned ALL choices to only return those that come up 2 times or less