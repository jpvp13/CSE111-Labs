-- Based on the available quantity of items, who is the manufacturerpmfgrof 
-- the most popular item(the more popular an item is, the less available it is inpsavailqty) fromSupplier#000000053?
SELECT p_mfgr
FROM (SELECT p_mfgr, MIN(ps_availqty)
      FROM part, partsupp, supplier
      WHERE p_partkey = ps_partkey AND
            ps_suppkey = s_suppkey AND
            s_name = 'Supplier#000000053')
