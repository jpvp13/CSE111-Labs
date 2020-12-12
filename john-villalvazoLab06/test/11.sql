-- TODO 11.  Find the nation(s) with the largest number of customers.


SELECT n_name
FROM nation, customer
WHERE c_nationkey = n_nationkey
GROUP BY n_name             --passing tupples that return the max count that is made up of the total count of customer keys
HAVING COUNT(c_custkey) = (SELECT MAX(count_x) FROM (SELECT COUNT(c_custkey) AS count_x
                                                    FROM nation,customer
                                                    WHERE c_nationkey = n_nationkey
                                                    GROUP BY n_name) AS count_x);