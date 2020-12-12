-- SQLite
-- .schema


--1
select c_name, sum(o_totalprice)
from orders, customer, nation
where o_custkey = c_custkey and
	n_nationkey = c_nationkey and
	n_name = 'RUSSIA' AND
	o_orderdate like '1996-__-__'
group by c_name;

DROP VIEW V1;

-- CREATE VIEW V1 AS
-- SELECT c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, n_name AS c_nation, r_name AS  c_region
-- FROM customer, region, nation
-- WHERE c_nationkey = n_nationkey 
-- 	AND  n_regionkey = r_regionkey;


CREATE VIEW V1(c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment,c_comment, n_name, r_name) AS
SELECT c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, n_name AS c_nation, r_name AS c_region
FROM customer, nation, region
WHERE n_nationkey = c_nationkey
	AND n_regionkey = r_regionkey
GROUP BY c_name;

SELECT c_name, ROUND(SUM(o_totalprice),2) AS TOT_SUM
FROM V1, orders
WHERE o_custkey = c_custkey and
	n_name = 'RUSSIA' AND
	o_orderdate like '1996-%-%'
GROUP BY c_name;


SELECT c_name,SUM(o_totalprice)
FROM V1,orders
WHERE o_custkey = c_custkey AND c_nation = "RUSSIA"
AND o_orderdate LIKE '1996-%-%'
GROUP BY c_name;

--2

select n_name, count(*)
from supplier, nation
where s_nationkey = n_nationkey
group by n_name;

DROP VIEW V2;

CREATE VIEW V2 AS
SELECT s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, n_name AS s_nation, r_name AS s_region
FROM supplier, nation, region
WHERE s_nationkey = n_nationkey 
	AND n_regionkey = r_regionkey;

CREATE VIEW V2(s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, s_nation, s_region) AS
SELECT s_suppkey, s_name, s_address, s_phone, s_acctbal,s_comment, n_name, r_name
FROM supplier, nation, region
WHERE n_nationkey = s_nationkey
	and n_regionkey = r_regionkey;

SELECT s_nation , COUNT(s_name)
FROM V2
GROUP BY s_nation;

--3
select n_name, count(*)
from orders, nation, customer, region
where c_custkey = o_custkey and
	c_nationkey = n_nationkey AND
	n_regionkey = r_regionkey AND
	r_name = 'ASIA'
group by n_name;

SELECT n_name , COUNT(*)
                FROM V1, orders
                WHERE c_custkey = o_custkey
                    AND r_name = 'ASIA'
                GROUP BY n_name;


--4
select s_name, count(*)
from partsupp, supplier, nation, part
where p_partkey = ps_partkey
	and p_size < 30 
	and ps_suppkey = s_suppkey 
	and s_nationkey = n_nationkey 
	and n_name = 'CHINA'
group by s_name;


SELECT s_name, COUNT(p_name)
FROM V2, part, partsupp
WHERE s_suppkey = partsupp.ps_suppkey AND part.p_partkey = partsupp.ps_partkey
AND part.p_size < 30 AND s_nation = 'CHINA'
GROUP BY s_name;

--5
select count(*)
from orders, customer, nation
where o_custkey = c_custkey 
	and c_nationkey = n_nationkey
	and n_name = 'PERU' 
	and o_orderdate like '1996-__-__';


CREATE VIEW V5 AS
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate AS o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders;

SELECT COUNT(*)
FROM customer, nation, V5
WHERE o_custkey = c_custkey
	AND c_nationkey = n_nationkey
	AND n_name = 'PERU'
	AND o_orderyear LIKE '1996-__-__'

--6
select s_name, o_orderpriority, count(*)
from partsupp, orders, lineitem, supplier, region, nation
where ps_partkey = l_partkey 
	and ps_suppkey = l_suppkey
	and l_orderkey = o_orderkey
	and ps_suppkey = s_suppkey
	and s_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'AMERICA'
group by s_name, o_orderpriority;


SELECT s_name, V5.o_orderpriority, COUNT(*)
FROM supplier, partsupp, region, nation, lineitem, V5
WHERE ps_partkey = l_partkey 
	and ps_suppkey = l_suppkey
	and l_orderkey = V5.o_orderkey
	and ps_suppkey = s_suppkey
	and s_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'AMERICA'
group by s_name, V5.o_orderpriority;

--7
select n_name, o_orderstatus, count(*)
from orders, customer, nation, region
where o_custkey = c_custkey 
	and c_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'EUROPE'
group by n_name, o_orderstatus;

SELECT n_name, V5.o_orderstatus, count(*)
FROM V1, V5
WHERE 
	V5.o_custkey = V1.c_custkey AND
	V1.r_name = 'EUROPE'
GROUP BY V1.n_name, V5.o_orderstatus;

--8
select n_name, count(distinct o_orderkey) as tot_orders
from orders, nation, supplier, lineitem
where o_orderdate like '1994%'
	and o_orderstatus = 'F'
	and o_orderkey = l_orderkey 
	and l_suppkey = s_suppkey
	and s_nationkey = n_nationkey
group by n_name
having tot_orders > 300;

SELECT V2.s_nation, COUNT(DISTINCT o_orderkey) AS tot_orders
FROM lineitem, V2, V5
WHERE s_suppkey = l_suppkey
	AND l_orderkey = o_orderkey
	AND o_orderstatus = 'F'
	AND o_orderyear LIKE '1994%'
GROUP BY V2.s_nation
HAVING tot_orders > 300;

--9
select count(DISTINCT o_clerk)
from orders, supplier, nation, lineitem
where o_orderkey = l_orderkey 
	and l_suppkey = s_suppkey 
	and s_nationkey = n_nationkey 
	and n_name = 'CANADA';


SELECT COUNT(DISTINCT V5.o_clerk)
FROM V2, V5, lineitem
WHERE s_suppkey = l_suppkey
	AND s_nation = 'CANADA'
	AND l_orderkey = V5.o_orderkey;

--10
select p_type, avg(l_discount)
from lineitem, part
where l_partkey = p_partkey
	and p_type like '%PROMO%'
group by p_type;

DROP VIEW V10;

CREATE VIEW V10 AS
SELECT p_type, AVG(l_discount) AS avg_discount
FROM part, lineitem
WHERE l_partkey = p_partkey
GROUP BY p_type;


SELECT p_type, ROUND(avg_discount, 16)
FROM V10
WHERE p_type LIKE '%PROMO%'
GROUP BY p_type;
--11
select n_name, s_name, s_acctbal
from supplier s, nation n
where s_nationkey = n_nationkey
	and s_acctbal = 
		(select max(s_acctbal)
		from supplier s1
		where s.s_nationkey = s1.s_nationkey
		);

SELECT s_nation, s_name, ROUND(V2.s_acctbal, 2)
                FROM V2
                WHERE
                    V2.s_acctbal = (SELECT MAX(supp2.s_acctbal)
                                        FROM V2 supp2
                                        WHERE V2.s_nation = supp2.s_nation)
                ORDER BY s_nation ASC;




--12
select n_name, avg(s_acctbal)
from supplier, nation
where s_nationkey = n_nationkey
group by n_name;

SELECT s_nation, V2.s_acctbal
FROM V2
WHERE
	V2.s_acctbal = (SELECT MAX(supp2.s_acctbal)
						FROM V2 supp2
						WHERE V2.s_nation = supp2.n_name)
ORDER BY s_nation ASC;


--13
select count(*)
from orders, lineitem, customer
where o_orderkey = l_orderkey
	and o_custkey = c_custkey
	and l_suppkey in (
		select s_suppkey
		from supplier, nation, region
		where s_nationkey = n_nationkey
			and n_regionkey = r_regionkey
			and r_name = 'ASIA'
		)
	and c_custkey in (
		select c_custkey
		from customer, nation
		where c_nationkey = n_nationkey
			and n_name = 'ARGENTINA'
		);

-- !CHECK THIS VVVV


SELECT count(*)
FROM customer C, lineitem, orders
WHERE
	o_orderkey = l_orderkey AND
	o_custkey = c_custkey AND
	l_suppkey IN (
		SELECT V2.s_suppkey
		FROM V2
		WHERE
			V2.s_region = 'ASIA'
	) AND
	c_custkey IN (
		SELECT c_custkey AS num
		FROM V1
		WHERE
			V1.c_nation = 'ARGENTINA'
	);



SELECT count(*)
FROM customer, lineitem, orders
WHERE
	o_orderkey = l_orderkey AND
	o_custkey = c_custkey AND
	l_suppkey IN (
		SELECT V2.s_suppkey
		FROM V2
		WHERE
			V2.s_region = 'ASIA'
	) AND
	c_custkey IN (
		SELECT V1.c_custkey
		FROM V1
		WHERE
			V1.n_name = 'ARGENTINA'
	);

--14
select custRegion, suppRegion, count(*) as no
from
	orders
	join
	(select o_orderkey as custOrder, r_name as custRegion
	from orders, nation, region, customer
	where o_custkey = c_custkey
		and c_nationkey = n_nationkey
		and n_regionkey = r_regionkey
	) on o_orderkey = custOrder
	join
	(select l_orderkey as suppOrder, r_name as suppRegion
	from lineitem, region, nation, supplier
	where l_suppkey = s_suppkey
		and s_nationkey = n_nationkey
		and n_regionkey = r_regionkey
	) on o_orderkey = suppOrder
group by custRegion, suppRegion;



SELECT custRegion, suppRegion, count(*)
FROM orders JOIN
	(
	SELECT o_orderkey AS custOrder, V1.r_name AS custRegion
	FROM orders, V1
	WHERE
		o_custkey = V1.c_custkey) ON o_orderkey = custOrder
	JOIN(
	SELECT l_orderkey as suppOrder, V2.s_region AS suppRegion
	FROM lineitem, V2
	WHERE
		l_suppkey = V2.s_suppkey) ON o_orderkey = suppOrder
GROUP BY custRegion, suppRegion;



--15
select count(DISTINCT o_orderkey)
from orders, lineitem
where o_orderkey = l_orderkey
	and o_custkey in
		(select c_custkey
		from customer
		where c_acctbal < 0)
	and l_suppkey in
		(select s_suppkey
		from supplier
		where s_acctbal < 0);


CREATE VIEW V151 AS
SELECT c_custkey, c_name, c_nationkey, c_acctbal
FROM customer
WHERE c_acctbal < 0;

CREATE VIEW V152 AS 
SELECT s_suppkey, s_name, s_nationkey,s_acctbal
FROM supplier 
WHERE s_acctbal < 0;

SELECT COUNT(DISTINCT o_orderkey) AS TOT
FROM V151, V152, orders, lineitem
WHERE l_orderkey = o_orderkey
AND o_custkey IN (SELECT c_custkey
				 FROM V151)
AND l_suppkey IN (SELECT s_suppkey
				 FROM V152);



