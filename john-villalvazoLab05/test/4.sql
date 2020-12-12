-- How many customers and suppliers are in every country fromEUROPE?
SELECT n_name AS Country, COUNT (DISTINCT c_name) AS numCustomer, COUNT (DISTINCT s_name) AS numSupplier
FROM customer, supplier, nation 
WHERE c_nationkey = n_nationkey AND
      n_nationkey = s_nationkey AND
      n_regionkey = 3
GROUP BY n_name;
