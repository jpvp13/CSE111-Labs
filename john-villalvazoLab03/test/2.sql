-- SELECT s_suppkey, s_acctbal FROM supplier ORDER BY s_acctbal desc;
SELECT MAX (s_acctbal) 
FROM supplier;
/*
SELECT MAX this is a aggregatr func that allows to search through tables in mass for specifics
after MAX, SUM, AVG, ect, tge attribute has to be in ()
*/
-- 49