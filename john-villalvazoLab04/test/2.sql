-- TODO  Find the number of suppliers from every country.

SELECT n_name, COUNT(DISTINCT s_name) AS nation
FROM nation, supplier
WHERE s_nationkey = n_nationkey
GROUP BY n_name;