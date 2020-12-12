-- TODO  How many items are supplied by suppliers inASIAfor orders made by customers inARGENTINA?


SELECT COUNT(*)
FROM (
    SELECT *
    FROM orders, customer, nation
    WHERE n_nationkey = c_nationkey
    AND c_custkey = o_custkey
    AND n_name = "ARGENTINA"),
    (SELECT *
        FROM lineitem
    INNER JOIN supplier ON lineitem.l_suppkey = supplier.s_suppkey
    INNER JOIN nation ON supplier.s_nationkey = nation.n_nationkey
    INNER JOIN region ON region.r_regionkey = nation.n_regionkey
    WHERE r_name = "ASIA")
WHERE l_orderkey = o_orderkey;