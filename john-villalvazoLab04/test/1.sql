
-- TODO Find the total price paid on orders by every customer from RUSSIA in 1996. 
-- TODO Print the customer name and the total price.

SELECT c_name, SUM(o_totalprice)
FROM customer, orders, nation
WHERE c_custkey = o_custkey
    AND c_nationkey = n_nationkey
    AND n_name = 'RUSSIA'
    AND o_orderdate BETWEEN '1996-01-01' AND '1996-12-31'
    GROUP BY c_name;

    