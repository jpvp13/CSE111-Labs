-- -- Q1 --

CREATE INDEX customer_idx_c_name ON customer(c_name);



-- DROP INDEX customer_idx_c_name;
-- DROP INDEX customer_idx_c_custkey_c_name;

-- -- -- Q2 --  
CREATE INDEX supplier_idx_s_acctbal ON supplier(s_acctbal DESC);
-- DROP INDEX supplier_idx_s_acctbal;

-- -- -- Q3 -- 
CREATE INDEX lineitem_idx_l_returnflag_l_receiptdate ON lineitem( l_returnflag, l_receiptdate);
-- DROP INDEX lineitem_idx_l_returnflag_l_receiptdate; 

-- -- -- Q4 -- 
-- -- --No index

-- -- -- Q5 -- 
CREATE INDEX customer_idx_c_mktsegment ON customer(c_mktsegment);
-- DROP INDEX customer_idx_c_mktsegment;


-- -- -- Q6 -- 
CREATE INDEX orders_idx_o_orderdate ON orders(o_orderdate,o_orderdate);
CREATE INDEX customer_idx_c_custkey ON customer(c_custkey);
CREATE INDEX nation_idx_n_nationkey ON nation(n_nationkey);

-- -- DROP INDEX orders_idx_o_orderdate;
-- -- DROP INDEX nation_idx_n_nationkey;
-- -- DROP INDEX customer_idx_c_custkey;

-- -- Q7 -- 
CREATE INDEX customer_idx_c_name_c_custkey ON customer(c_name, c_custkey);
CREATE INDEX orders_idx_o_custkey_o_orderkey ON orders(o_custkey, o_orderkey);
CREATE INDEX lineitem_idx_l_orderkey_l_receiptdate ON lineitem(l_orderkey, l_receiptdate);



-- DROP INDEX customer_idx_c_name_c_custkey;
-- DROP INDEX lineitem_idx_l_orderkey_l_receiptdate;
-- DROP INDEX orders_idx_o_custkey_o_orderkey;

-- -- Q8 -- 
CREATE INDEX region_idx_r_name_r_regionkey ON region(r_name, r_regionkey);

CREATE INDEX nation_idx_n_regionkey_n_nationkey ON nation(n_regionkey, n_nationkey);

CREATE INDEX supplier_idx_s_nationkey_s_acctbal ON supplier(s_nationkey,s_acctbal);


-- -- DROP INDEX region_idx_r_name_r_regionkey;
-- -- DROP INDEX nation_idx_n_regionkey_n_nationkey;
-- -- DROP INDEX supplier_idx_s_nationkey_s_acctbal;

-- Q9 -- 

CREATE INDEX nation_idx_n_name_n_nationkey ON nation(n_name, n_nationkey);
CREATE INDEX supplier_idx_s_nationkey_s_acctbal ON supplier(s_nationkey);

-- DROP INDEX nation_idx_n_name_n_nationkey;
-- Q10 -- 

CREATE INDEX region_idx_r_name_r_regionkey ON region(r_name, r_regionkey);
CREATE INDEX nation_idx_n_regionkey_n_nationkey ON nation(n_regionkey, n_nationkey);
CREATE INDEX customer_idx_c_nationkey_c_custkey ON customer(c_nationkey, c_custkey);
CREATE INDEX orders_idx_o_custkey_o_orderkey ON orders(o_custkey, o_orderkey);



-- DROP INDEX region_idx_r_name_r_regionkey;
-- DROP INDEX nation_idx_n_regionkey_n_nationkey;
-- DROP INDEX orders_idx_o_custkey_o_orderkey;

-- Q11 -- 

CREATE INDEX orders_idx_o_custkey_o_orderkey ON orders(o_custkey, o_orderkey);
CREATE INDEX lineitem_idx_l_orderkey_l_discount ON lineitem(l_orderkey, l_discount);
-- Q12 -- 

CREATE INDEX orders_idx_o_orderstatus ON orders(o_orderstatus);
CREATE INDEX customer_idx_c_custkey ON customer(c_custkey);
CREATE INDEX nation_idx_n_nationkey ON nation(n_nationkey);
CREATE INDEX region_idx_r_regionkey_r_name ON region(r_regionkey, r_name);

-- Q13 
-- No Index Needed

-- Q14
 
CREATE INDEX orders_idx_o_orderpriority_o_orderkey ON orders(o_orderpriority);
CREATE INDEX nation_idx_n_name_n_nationkey ON nation(n_name, n_nationkey);
CREATE INDEX customer_idx_c_nationkey_c_custkey ON customer(c_nationkey, c_custkey);

-- Q15 -- 
DROP INDEX orders_idx_o_orderpriority_o_orderkey;
DROP INDEX lineitem_idx_l_orderkey_l_receiptdate;
DROP INDEX supplier_idx_s_suppkey;
DROP INDEX nation_idx_n_nationkey;
DROP INDEX region_idx_r_regionkey_r_name;

-- CREATE INDEX orders_idx_o_orderpriority_o_orderkey ON orders(o_orderpriority, o_orderkey);
CREATE INDEX orders_idx_o_orderpriority_o_orderkey ON orders(o_orderpriority, o_orderkey); 
CREATE INDEX lineitem_idx_l_orderkey_l_receiptdate ON lineitem(l_orderkey,l_receiptdate);
CREATE INDEX supplier_idx_s_suppkey ON supplier(s_suppkey);
CREATE INDEX nation_idx_n_nationkey ON nation(n_nationkey);
CREATE INDEX region_idx_r_regionkey_r_name ON region(r_regionkey, r_name);


