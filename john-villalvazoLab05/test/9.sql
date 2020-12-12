--  Count the number of supplied parts that have total value (pssupplycost*psavailqty) in the top3% values across all the supplied parts
--   and are supplied by suppliers fromCANADA. Hint: Use theLIMITkeyword.
SELECT COUNT(*) AS numSuppParts
FROM nation, supplier, partsupp
WHERE s_nationkey = n_nationkey 
      AND n_name = 'CANADA' 
      AND s_suppkey = ps_suppkey 
      AND ps_supplycost * ps_availqty IN 
      (SELECT ps_supplycost * ps_availqty 
      FROM partsupp
ORDER BY ps_supplycost * ps_availqty 
DESC LIMIT 
(SELECT COUNT(*) * 0.03 
FROM partsupp));