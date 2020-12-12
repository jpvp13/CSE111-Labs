-- TODO 1.  Find the total quantity (lquantity) of line items shipped per month (lshipdate) in 1997.  
-- TODO Hint:check functionstrftimeto extract the month/year from a date.


-- SELECT l_shipdate, l_quantity
-- FROM lineitem
-- WHERE l_shipdate = '1997'

-- SELECT  DISTINCT ROW_NUMBER() OVER (
--         ORDER BY l_shipdate
--     ) row, SUM(l_quantity)
--     FROM lineitem;

SELECT strftime('%m', l_shipdate) Month, SUM(l_quantity)
FROM lineitem
WHERE strftime('%Y', l_shipdate) = '1997'
GROUP BY month

-- ! %m returns month, with imputs coming from l_shipdate
-- ! %Y returns the year, with inputs coming from l_shipdate