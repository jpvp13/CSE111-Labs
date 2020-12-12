-- TODO 6.  Find the supplier-customer pair(s) with the most expensive (o_totalprice) completed 
-- TODO (F in o_orderstatus) order(s).

SELECT s_name, c_name   --we want both of these to be printed
FROM lineitem, supplier, customer
    JOIN (SELECT o_orderkey, o_custkey  --join the tables where orderkey and custkey if totalprice is max and has orderstatus F
    FROM orders
    WHERE o_totalprice = (SELECT MAX(o_totalprice) FROM orders WHERE o_orderstatus = 'F')
    )
WHERE o_orderkey = l_orderkey
    AND s_suppkey = l_suppkey
    AND c_custkey = o_custkey