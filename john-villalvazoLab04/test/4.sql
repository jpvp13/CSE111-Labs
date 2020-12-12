-- TODO How many parts with size below 30 does every supplier from CHINA offer? 
-- TODO Print the name of the supplier and the number of parts.

-- SELECT s_name, COUNT(DISTINCT p_partkey)
-- FROM part, nation, supplier, lineitem
-- WHERE l_partkey = p_partkey
--     AND l_suppkey = s_suppkey
--     AND s_nationkey = n_nationkey
--     AND n_name = 'CHINA'
--     AND p_size < 30
-- GROUP BY s_name;

SELECT s_name, COUNT (DISTINCT p_partkey)
FROM supplier, part, nation, partsupp
WHERE s_nationkey = n_nationkey 
AND      p_partkey = ps_partkey 
AND       ps_suppkey = s_suppkey 
AND      n_name = 'CHINA' 
AND      p_size < 30 
GROUP BY s_name;

