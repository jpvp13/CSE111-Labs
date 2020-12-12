-- What  is  the  total  supply  cost  for  parts  less  expensive  than$1000(pretailprice)  shipped  in1996(lshipdate)  by  suppliers  who  did  not  
-- supply  any  item  with  an  extended  price  less  than2000in1995?
SELECT SUM(ps_supplycost)
FROM partsupp
    INNER JOIN (
    SELECT p_partkey, l_suppkey
    FROM lineitem
        INNER JOIN (
        SELECT p_partkey
        FROM part
        WHERE p_retailprice < 1000
    ) AS partSupp ON p_partkey = l_partkey
    WHERE l_shipdate LIKE '%1996%' AND l_suppkey NOT IN (
        SELECT s_suppkey
        FROM supplier
            INNER JOIN (
            SELECT l_suppkey l1_key
            FROM lineitem
            WHERE strftime('%Y', l_shipdate) = '1995' AND l_extendedprice < 2000
        ) l1 ON l1_key = s_suppkey
    ) 
) l ON ps_partkey = p_partkey AND l_suppkey = ps_suppkey