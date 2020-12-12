-- Find the highest value items (lextendedprice*(1-ldiscount)) not shipped as ofOctober 2, 1994.
-- Print the name of the part corresponding to these items.
SELECT partName
FROM (SELECT p_name AS partName, MAX(l_extendedprice*(1-l_discount)), p_partkey
      FROM lineitem, part
      WHERE l_partkey = p_partkey AND
            l_shipdate > '1994-10-02');
      