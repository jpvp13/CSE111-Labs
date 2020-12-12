-- TODO 5.  Find how many distinct suppliers supply the least expensive part (p_retailprice).

SELECT COUNT(*)
FROM (SELECT DISTINCT ps_suppkey
    FROM partsupp
    JOIN(   --joins the two tables with things match
        SELECT p_partkey
        FROM part
        WHERE p_retailprice = (SELECT MIN(p_retailprice) FROM part)) --this does an inside query that outputs the value to
                                                                    -- p_retailprice
WHERE p_partkey = ps_partkey) part

