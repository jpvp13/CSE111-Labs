-- Todo Find the average account balance of all the customers from AFRICA in the MACHINERY market segment.

-- !c_acctbal c_nationkey, 

-- SELECT *
-- FROM (SELECT AVG(c_acctbal), r_region
--     FROM customer, nation, region
--     WHERE c_nationkey = n_nationkey
--     AND n_regionkey = r_regionkey 
--     AND c_mktsegment = 'MACHINERY'
--     AND n_regionkey = 0)cust


SELECT AVG(c_acctbal)
FROM customer
WHERE (
	c_nationkey IN (
		SELECT n_nationkey
        FROM nation
        WHERE n_regionkey = (
			SELECT r_regionkey
            FROM region
            WHERE r_name = 'AFRICA'
		)
	)
	AND c_mktsegment = 'MACHINERY'
)

/*
SELECT selects avg from account balance
FROM customer for ^
WHERE nation key inside customer(
    SELECT nation key from nation
        FROM nation ^
        WHERE region key from inside nation is = to ...
        SELECT region key from region
        FROM region
        WHERE name from inside region = "AFRICA"
    )
    continuation of original WHERE, is also filters throug MACHINERY from inside customer
)