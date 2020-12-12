-- TODO 10.  Find the region where customers spend the largest amount of money (l_extendedprice) buying items from suppliers in the same region.


SELECT r_name   --returning the region
FROM (SELECT r_name, MAX(maxx)  --the renamed SUM of extendedprice called maxx will calc all money from a region
    FROM(SELECT r_name, SUM(l_extendedprice) AS maxx    --this will determine only the regions that we want, in this case from the 4
        FROM region, nation, customer, supplier, lineitem
        WHERE r_regionkey = n_regionkey
            AND n_nationkey = c_nationkey
            AND s_nationkey = n_nationkey
            AND l_suppkey = s_suppkey
        GROUP BY r_name));