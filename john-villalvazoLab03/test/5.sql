-- customer table
-- find min,max,avg and total
-- market segment schema
-- decresing order


-- SELECT c_mktsegment, MIN(c_acctbal), MAX(c_acctbal), AVG(c_acctbal), SUM(c_acctbal)
-- FROM customer
-- WHERE c_mktsegment LIKE '-';
-- ORDER BY c_acctbal DESC;


SELECT c_mktsegment, MIN(c_acctbal), MAX(c_acctbal), AVG(c_acctbal), SUM(c_acctbal)
FROM customer
WHERE c_mktsegment = 'MACHINERY' 
UNION 
SELECT c_mktsegment, MIN(c_acctbal), MAX(c_acctbal), AVG(c_acctbal), SUM(c_acctbal)
FROM customer
where c_mktsegment = 'BUILDING'
UNION
SELECT c_mktsegment, MIN(c_acctbal), MAX(c_acctbal), AVG(c_acctbal), SUM(c_acctbal)
FROM customer
WHERE c_mktsegment = 'AUTOMOBILE'
UNION
SELECT c_mktsegment, MIN(c_acctbal), MAX(c_acctbal), AVG(c_acctbal), SUM(c_acctbal)
FROM customer
WHERE c_mktsegment = 'FURNITURE'
UNION
SELECT c_mktsegment, MIN(c_acctbal), MAX(c_acctbal), AVG(c_acctbal), SUM(c_acctbal)
FROM customer
WHERE c_mktsegment = 'HOUSEHOLD';   


/*
very large query but it has all attributes met
SELECT gets attributes with wanted parameters
FROM obvious
WHERE this prints the tupple that we want
UNION this is what allows us to find these specific attributes and join together

continues for all specifically wanted attributes
*/