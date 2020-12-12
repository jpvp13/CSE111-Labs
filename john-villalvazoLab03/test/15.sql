-- todo Find  the  total  number  of 1-URGENT priority  orders  supplied  by  suppliers  in  each  region  
-- todo each  year(fromo orderdate).  
-- todo Print the year, region name, and the count sorted by the year then the region in increasing order. 
-- todo Check the substr function inSQLite


SELECT strftime('%Y', o_orderdate) AS orderdate, r_name, COUNT(o_orderpriority)
FROM orders, nation, supplier, region, lineitem
WHERE s_suppkey = l_suppkey 
      AND l_orderkey = o_orderkey 
      AND s_nationkey = n_nationkey 
      AND r_regionkey = n_regionkey 
      AND o_orderpriority = '1-URGENT' 
      GROUP BY r_name, orderdate;

/*
SELECT strftime used a string that we use to fined the year at starting place orderdate within orders table, name inside region, COUNT all occurances of orderpriority within orders table
FROM orders, nation, supplier, region, lineitem
WHERE suppkey from lineitems matches orderkey from lineitems
    AND orderkey from lineitems matches orderkey from orders
    AND nationkey from supplier matches nationkey from nation
    AND regionkey from region matches regionkey from nation 
    AND orderpriority from orders matches 1-URGENT
    GROUP BY name from region table and orderdate in ascending orderS