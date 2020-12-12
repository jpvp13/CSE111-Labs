-- TODO 7.  Find  how  many  suppliers  have  less 
-- TODO  than  30  distinct  orders  from  customers  in GERMANY and FRANCE together.


-- SELECT COUNT(*)
-- FROM (SELECT o_orderkey
--         FROM orders, lineitem
--         JOIN(
--             SELECT c_custkey
--             FROM customer
--             WHERE c_nationkey IN (
--                 SELECT n_nationkey
--                 FROM nation
--                 WHERE n_name = 'GERMANY'
--                     OR n_name = 'FRANCE'
--             )
--         ) WHERE o_custkey = c_custkey 
--             AND o_orderkey = l_orderkey
--     GROUP BY o_custkey
--     HAVING COUNT(*) < 30
-- ) y

SELECT COUNT(DISTINCT(l_suppkey))   --agregrate by distinct values and count them
FROM orders, (SELECT l_suppkey, COUNT(DISTINCT o_orderkey) AS less30    --this returns the specific items that make up
    FROM orders, lineitem, nation, customer
    WHERE (n_name = 'FRANCE' OR n_name = 'GERMANY') --check whether the name comes up
        AND n_nationkey = c_nationkey
        AND c_custkey = o_custkey
        AND o_orderkey = l_orderkey
        GROUP BY l_suppkey) AS res --groups the results and sets it under name res
    WHERE res.less30 < 30;  --as orders are less than 30
