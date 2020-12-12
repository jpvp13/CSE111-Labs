--  For any two regions, find the gross discounted revenue (lextendedprice*(1-ldiscount)) derivedfrom  line  items  in  which  parts  are  shipped  from  a  supplier  in  the  
--  first  region  to  a  customer  in  thesecond region in1995and1996. 
--   List the supplier region, the customer region, the year (lshipdate),and the revenue from shipments that took place in that year.  
-- Order the answers by supplier region,customer region, and year.
SELECT supplierRegion.r_name as supplierRegion, customerRegion.r_name AS customerRegion, SUBSTR(l_shipdate,1,4) AS shipYear, SUM(l_extendedprice*(1-l_discount)) AS revenue 
FROM lineitem, orders, customer, nation customerNation, region customerRegion, supplier, nation supplierNation, region supplierRegion 
WHERE l_orderkey = o_orderkey 
      AND o_custkey = c_custkey 
      AND c_nationkey = customerNation.n_nationkey 
      AND customerNation.n_regionkey = customerRegion.r_regionkey 
      AND l_suppkey = s_suppkey 
      AND s_nationkey = supplierNation.n_nationkey 
      AND supplierNation.n_regionkey = supplierRegion.r_regionkey 
      AND substr(l_shipdate,1,4) IN ('1995','1996') 

GROUP BY supplierRegion.r_name, customerRegion.r_name, substr(l_shipdate,1,4) 
ORDER BY supplierRegion.r_name, customerRegion.r_name, substr(l_shipdate,1,4);