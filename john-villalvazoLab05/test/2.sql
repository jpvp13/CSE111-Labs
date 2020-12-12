--  TODO How  many  suppliers  in  every  region  have  more  balance  in  their  account  
--  TODO than  the  average  accountbalance of their own region?

-- SELECT r_name, COUNT(s_nationkey)
-- FROM nation, supplier, region, customer
-- WHERE EXISTS (
--     c_acctbal > AVG(c_acctbal)
-- ) 
--     AND r_regionkey = n_regionkey
    
--     GROUP BY s_nationkey
--     ORDER BY r_name;


SELECT r_name, COUNT(s_acctbal)
FROM (SELECT r_name AS regionName, AVG(s_acctbal) AS regionAcct -- renaming columns to help see what is happening
      --through this nested select a region average is created
      FROM region, nation, supplier
      WHERE s_nationkey = n_nationkey 
            AND r_regionkey = n_regionkey 
            GROUP BY r_name), region , nation , supplier
WHERE r_name = regionName
      AND s_acctbal > regionAcct
      AND r_regionkey = n_regionkey 
      AND s_nationkey = n_nationkey
      GROUP BY r_name;