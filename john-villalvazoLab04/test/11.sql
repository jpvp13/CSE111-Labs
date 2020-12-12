
-- TODO Find the supplier with the largest account balance in every country. 
-- TODO Print the country name, the supplier name, and the account balance.


SELECT n_name, s_name, MAX(s_acctbal)
FROM nation, supplier
WHERE s_nationkey = n_nationkey
    GROUP BY n_name;