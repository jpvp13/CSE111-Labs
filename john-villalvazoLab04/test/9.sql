
-- TODO How many different order clerks did the suppliers in CANADA work with?

SELECT COUNT(DISTINCT o_clerk)
FROM supplier, orders, region, nation, lineitem
WHERE n_nationkey = s_nationkey
    AND l_suppkey = s_suppkey
    AND l_orderkey = o_orderkey
    AND n_nationkey  = 3;