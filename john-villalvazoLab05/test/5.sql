--  For parts whom type containsSTEEL, return the name of the supplier fromAMERICAthat can supplythem at minimum cost (pssupplycost), for every part size.  
-- Print the supplier name together withthe part size and the minimum cost.
-- select s_name,p_size ,min(ps_supplycost)
-- from supplier, partsupp, nation, part, region
-- where s_suppkey = ps_suppkey 
--     and s_nationkey = n_nationkey 
--     and n_regionkey = r_regionkey 
--     and r_name = 'AMERICA' 
--     and p_partkey = ps_partkey 
--     and p_type like '%STEEL'

-- order by p_size;

SELECT s_name, p_size, supplycost
FROM (SELECT DISTINCT s_name, p_size , MIN(ps_supplycost) AS supplycost
      FROM supplier, part, partsupp, nation
      WHERE p_type LIKE '%STEEL%' AND
            n_regionkey = 1 AND
            s_nationkey = n_nationkey AND
            s_suppkey = ps_suppkey AND
            ps_partkey = p_partkey
GROUP BY p_size);
