-- TODO Find the minimum account balance of the suppliers from countries with less than 3 suppliers.  
-- TODO Print the country and the minimum account balance.



SELECT 
        (SELECT n_name
        FROM nation
        WHERE s_nationkey = n_nationkey) AS country, MIN(s_acctbal)
        FROM supplier
        GROUP BY s_nationkey
        HAVING COUNT(*) < 3;


        

-- SELECT *
-- FROM (SELECT n_name, MIN(s_acctbal)
--     FROM supplier, nation
--     WHERE s_nationkey = n_nationkey
--     GROUP BY n_name)
-- WHERE supplier_num < 3;

--  SELECT *
-- FROM (SELECT COUNT(*) AS supp, n_name, MIN(s_acctbal)
--     FROM supplier, nation
--     WHERE s_nationkey = n_nationkey
    
--     GROUP BY n_name)
-- WHERE supp < 3
-- ORDER BY supp DESC;



-- correct
-- SELECT *
-- FROM 
--     (SELECT COUNT(*) AS num_supp, n_name, MIN(s_acctbal)
--      FROM supplier, nation
--      WHERE s_nationkey = n_nationkey
--      GROUP BY n_name)
    
-- WHERE num_supp < 3;

 

