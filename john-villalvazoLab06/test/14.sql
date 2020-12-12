-- TODO 14.  Compute, for every country, the value of economic exchange, i.e., the difference between the number of 
-- TODO items FROM suppliers in that country sold to customers in other countries AND the number of itemsbought by 
-- TODO local customers FROM foreign suppliers in1996(l_shipdate).  Sort the results in decreasing order of the economic exchange.



SELECT tota, b-a
FROM
    (SELECT n1.n_name as tota, n2.n_name as totb, COUNT(o_orderkey) as a
    FROM nation n1, customer, orders, lineitem, supplier, nation n2
    where n1.n_name != n2.n_name
        AND n1.n_nationkey = c_nationkey
        AND c_custkey = o_custkey
        AND o_orderkey = l_orderkey
        AND l_suppkey = s_suppkey
        AND s_nationkey = n2.n_nationkey
        AND l_shipdate BETWEEN '1996-01-01' AND '1996-12-31'
    GROUP BY n1.n_name), (SELECT n1.n_name as tota1, n2.n_name as totb2, COUNT(o_orderkey) as b
                        FROM nation n1, customer, orders, lineitem, supplier, nation n2
                        WHERE n1.n_name != n2.n_name
                        AND n1.n_nationkey=c_nationkey
                        AND c_custkey=o_custkey
                        AND o_orderkey=l_orderkey
                        AND l_suppkey=s_suppkey
                        AND s_nationkey=n2.n_nationkey
                        AND l_shipdate BETWEEN '1996-01-01' AND '1996-12-31'
    GROUP BY n2.n_name)

WHERE tota = totb2
ORDER BY b
-a DESC;