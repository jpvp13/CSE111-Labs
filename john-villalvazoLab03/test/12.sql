-- TODO Find the number of orders having status F for each customer region and display them in descending order. 
-- TODO Print the region name and the number of status F orders.

--! l_linestatus, 
-- original

-- SELECT 
-- (SELECT r_name
-- FROM region, orders, customer, nation, lineitem
-- WHERE r_regionkey = n_regionkey
--         AND o_orderkey = l_orderkey
--         AND o_custkey = c_custkey
--         AND c_nationkey = n_nationkey
--         AND l_linestatus = 'F'
-- );        


-- SELECT  *
-- FROM (
--     SELECT r_name, COUNT(l_linestatus)
--     FROM region, customer, lineitem, orders
--     WHERE r_regionkey = n_regionkey
--     AND o_orderkey = l_orderkey
--     AND o_custkey = c_custkey
--     AND c_nationkey = n_nationkey
--     AND l_linestatus = "F"
-- )cust



SELECT r_name, n.sumvals
FROM region
INNER JOIN (
	SELECT n_regionkey, SUM(c.vals) sumvals
	FROM nation
	INNER JOIN (
		SELECT c_nationkey, COUNT(*) vals
		FROM customer
		INNER JOIN (
			SELECT o_custkey
            FROM orders
            WHERE o_orderstatus = 'F'
		) o ON o_custkey = c_custkey 
		GROUP BY c_nationkey
	) c ON c_nationkey = n_nationkey
	GROUP BY n_regionkey
) n ON r_regionkey = n_regionkey
ORDER BY r_name