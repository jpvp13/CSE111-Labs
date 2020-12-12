-- 7.  What is the receipt date and the total number of ordered items per receipt date by Customer#000000106?
-- customer, lineitem


-- SELECT DISTINCT l_receiptdate
-- FROM customer, lineitem, orders
-- WHERE c_custkey = o_custkey 
--     AND o_orderdate >= '1995-03-10';




SELECT l_receiptdate, COUNT(*)
FROM lineitem, customer, orders
WHERE c_name = 'Customer#000000106' 
    AND c_custkey = o_custkey 
    AND o_orderkey = l_orderkey 
    GROUP BY l_receiptdate;



/*
SELECT receiptdate and COUNT(*) prints ALL possible tupples
FROM all tables
WHERE c_name allows us to choose our specific customer
AND allows us to know which specific customer key match and which order keys match
GROUP BY allows us to only display by receiptdate
*/

