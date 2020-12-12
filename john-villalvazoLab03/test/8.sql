-- Find the name of the suppliers from ASIA who have less than $1000 on account balance
-- supplier, region



-- SELECT DISTINCT s_name
-- FROM supplier, region
-- WHERE s_nationkey = r_regionkey
--     AND  r_regionkey = '2'
--     AND s_acctbal < 1000;



SELECT s_name
FROM supplier, nation, region
WHERE s_nationkey = n_nationkey
        AND n_regionkey = r_regionkey
        AND r_name = 'ASIA'
        AND s_acctbal < '1000'
    ORDER BY s_name;

/*
SELECT names from supplier
FROM different tables used
WHERE supplier nationkey and nation key are the same
AND nation region key and region region key are the same
AND included parameter
AND included parameter
ORDER BY ascending order
*/