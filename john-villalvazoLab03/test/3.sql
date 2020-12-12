-- lineitem Scheme 
-- SELECT * FROM lineitem WHERE (i_returnflag = 'R' AND i_reciptdate = "1992-30-5");

-- lineitem Scheme 
-- SELECT l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity, l_extendedprice,l_discount,l_tax, l_returnflag, l_linestatus, l_shipdate,l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment FROM lineitem WHERE l_returnflag = 'R';


SELECT l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity, l_extendedprice,l_discount,l_tax, l_returnflag, l_linestatus, l_shipdate,l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment
FROM Lineitem
WHERE l_returnflag = 'R' AND l_receiptdate = '1992-05-30';

/*
SELECT we want all tupples that match with all the attributes
FROM Self Explanitory 
WHERE finds both parameters we are asked for