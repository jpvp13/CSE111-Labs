-- lineitem
-- commmitdate - shipdate
-- shipdate >= commitdate
SELECT AVG(julianday(l_shipdate) - julianday(l_commitdate))
FROM lineitem
WHERE l_shipdate >= l_commitdate;

/*
SELECT refer to PDF that mentions julianday
FROM obvious
WHERE PDF states specfically where shipdate >= commitdate just another parameter
*/