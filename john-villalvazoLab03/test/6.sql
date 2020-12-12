--  What are the countries of customers who ordered items betweenMarch 10-12, 1995?
-- nation and customer and Order

-- use o_custkey and cross check nationflag?

-- SELECT o_orderdate, o_custkey
-- FROM orders
-- WHERE o_orderdate BETWEEN 1995-03-10 AND 1995-03-12;



-- SELECT DISTINCT n_name
-- FROM nation, customer, orders
-- WHERE c_custkey = o_custkey 
--     AND o_orderdate >= '1995-03-10' 
--     AND o_orderdate <= '1995-03-12';




SELECT DISTINCT n_name
FROM nation, customer, orders
WHERE c_custkey = o_custkey 
        AND c_nationkey = n_nationkey
        AND o_orderdate >= '1995-03-10' 
        AND o_orderdate <= '1995-03-12'
        ORDER BY n_name;
/*
SELECT DISTINCT used to only return a query with distinct values (not repeated)
FROM using multiple tables where all these items are used and "loaded"
WHERE we "load" in the similar attribute from table customer and order to compare the customer keys since they match in each table
AND this brings in the parameters that are asked for
*/