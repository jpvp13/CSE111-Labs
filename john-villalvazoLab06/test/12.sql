-- TODO 12.  Find the nation(s) having customers that spend the largest amount of money (o_totalprice).

SELECT n_name
FROM customer, nation, orders
WHERE n_nationkey = c_nationkey 
    AND o_custkey = c_custkey
GROUP BY n_name
HAVING SUM(o_totalprice) = (SELECT MAX(tot) --returning the value of max tot to the SUM of the total price that is made up of the SUM of totalprice
                            FROM (SELECT SUM(o_totalprice) AS tot
                            FROM customer, nation, orders
                            WHERE c_nationkey = n_nationkey 
                                AND o_custkey = c_custkey 
                            GROUP BY n_name) AS tot);