--  TODO How many customers are not from EUROPE or AFRICA

SELECT COUNT(*)
FROM customer
WHERE c_nationkey NOT IN  -- checks to make sure nationkey is not within region key
( 
	SELECT n_nationkey
	FROM nation
	WHERE n_regionkey IN (  --checks to make sure regionkey does contain EUROPE and AFRICA
		SELECT r_regionkey
		FROM region
		WHERE r_name = 'EUROPE' OR r_name = 'AFRICA'
	)
)