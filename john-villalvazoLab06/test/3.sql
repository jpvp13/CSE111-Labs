-- TODO 3.  Find how many parts are supplied by more than one supplier from CANADA.

-- Orignial Idea


-- SELECT COUNT(*) 
-- FROM supplier, partsupp, nation
-- WHERE ps_suppkey = s_suppkey
--     AND s_nationkey = n_nationkey
--     -- AND s_name > 1
--     AND n_name = 'CANADA'
--     GROUP BY s_suppkey
--     HAVING COUNT(*) > 1

-- 

SELECT COUNT(*)
FROM (SELECT ps_partkey     --subquery that selects from within partsupp the partskey
    FROM partsupp
    JOIN(                   --joins the query from partsupp to the table of supplier
        SELECT s_suppkey
        FROM supplier, nation
        WHERE s_nationkey = n_nationkey --make sure these match between the two tables
        AND n_name = 'CANADA')      --only from CANADA...ay
WHERE ps_suppkey = s_suppkey    --where the supply keys match
GROUP BY ps_partkey         
HAVING COUNT(*) > 1)parts       -- only want the tupples that apply more than once