from os import kill, truncate
import sqlite3
from sqlite3 import Error


def openConnection(_dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Open database: ", _dbFile)

    conn = None 
    try:
        conn = sqlite3.connect(_dbFile)
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    return conn

def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def create_View1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V1")

    try:
        # sql = """DROP VIEW V1"""
        sql = """CREATE VIEW V1(c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment,c_comment, n_name, r_name) AS
                SELECT c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, n_name AS c_nation, r_name AS c_region
                FROM customer, nation, region
                WHERE n_nationkey = c_nationkey
                    AND n_regionkey = r_regionkey;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)


        

        # rows = cur.fetchall()

        # for row in rows:
        #     l = '{:>20} {:<35}'.format(row[0], row[1])
        #     print(l)

    except Error as e:
        print(e)

    # CREATE VIEW c_name

    print("++++++++++++++++++++++++++++++++++")


def create_View2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V2")


    try:
        sql = """CREATE VIEW V2 AS
                SELECT s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, n_name AS s_nation, r_name AS s_region
                FROM supplier, nation, region
                WHERE s_nationkey = n_nationkey 
                    AND n_regionkey = r_regionkey;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)


        # rows = cur.fetchall()

        # for row in rows:
        #     l = '{:>20} {:<35}'.format(row[0], row[1])
        #     print(l)

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def create_View5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V5")

    try:
        sql = """CREATE VIEW V5 AS
                SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate AS o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment
                FROM orders;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def create_View10(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V10")

    try:
        # sql = """CREATE VIEW V10 AS
        #         SELECT p_type, AVG(l_discount) AS avg_discount
        #         FROM part, lineitem
        #         WHERE l_partkey = p_partkey
        #         GROUP BY p_type;
        #         """


        sql = """
            CREATE VIEW V10(p_type, avg_discount) AS
                SELECT p_type, AVG(l_discount)
                FROM part, lineitem
                WHERE
                    p_partkey = l_partkey
                GROUP BY p_type

        """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

    except Error as e:
        print(e)


    print("++++++++++++++++++++++++++++++++++")


def create_View151(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V151")

    try:
        sql = """CREATE VIEW V151 AS
                SELECT c_custkey, c_name, c_nationkey, c_acctbal
                FROM customer
                WHERE c_acctbal < 0;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

    except Error as e:
        print(e)


    print("++++++++++++++++++++++++++++++++++")


def create_View152(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V152")

    try:
        sql = """CREATE VIEW V152 AS 
                SELECT s_suppkey, s_name, s_nationkey, s_acctbal
                FROM supplier 
                WHERE s_acctbal < 0;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q1")

    try:
        sql = """SELECT c_name, ROUND(SUM(o_totalprice), 2) AS TOT_SUM
                FROM V1, orders
                WHERE o_custkey = c_custkey and
                    n_name = 'RUSSIA' AND
                    o_orderdate like '1996-%-%'
                GROUP BY c_name;
            """
        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0]) 
            # print("|")
            l = '{:.2f}'.format(row[1])
            print(str(j+ "|" + l))
  

        with open('output/1.out', 'w') as f:
            for row in rows:
                j = '{}'.format(row[0])
                k = '{:}\n'.format(row[1])       
                f.write(str(j + "|" + k))

                # l = '{}|{:}\n'.format(row[0], row[1])          
                # f.write(str(l))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q2")

    try:
        sql = """SELECT s_nation , COUNT(s_name) AS tot_Count
                FROM V2
                GROUP BY s_nation;
            """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0]) 
            # print("|")
            k = '{:}'.format(row[1])
            print(str(j+ "|" + k))


        # k = '{:>10s} {:<1s}\n'.format("c_name","o_totalprice")
        # print(k)

        with open('output/2.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0]) 
                # print("|")
                k = '{:}\n'.format(row[1])           
                f.write(str(j+ "|" + k))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q3(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q3")

    try:
        sql = """SELECT n_name , COUNT(*) AS tot_Count
                FROM V1, orders
                WHERE c_custkey = o_custkey
                    AND r_name = 'ASIA'
                GROUP BY n_name;
            """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0]) 
            # print("|")
            k = '{:}'.format(row[1])
            print(str(j+ "|" + k))


        with open('output/3.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0]) 
                l = '{:}\n'.format(row[1])           
                f.write(str(j + "|" + l))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q4(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q4")


    try:
        sql = """SELECT s_name, COUNT(p_name) AS tot_Parts
                FROM V2, part, partsupp
                WHERE s_suppkey = partsupp.ps_suppkey 
                    AND part.p_partkey = partsupp.ps_partkey
                    AND part.p_size < 30 
                    AND s_nation = 'CHINA'
                GROUP BY s_name;
            """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0]) 
            l = '{:}'.format(row[1])
            print(str(j+ "|" + l))


        with open('output/4.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0]) 
                # print("|")
                l = '{:}\n'.format(row[1])           
                f.write(str(j + "|" + l))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q5")

    try:
        sql = """SELECT COUNT(*) AS Tot
                FROM customer C , nation N, V5
                WHERE V5.o_custkey = C.c_custkey
                    AND C.c_nationkey = N.n_nationkey
                    AND N.n_name = 'PERU'
                    AND V5.o_orderyear LIKE '1996-%-%'
            """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0]) 
            print(str(j))

        with open('output/5.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0]) 
                f.write(str(j))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q6(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q6")

    try:
        sql = """SELECT s_name, V5.o_orderpriority, COUNT(*) AS Tot
                FROM supplier, partsupp, region, nation, lineitem, V5
                WHERE ps_partkey = l_partkey 
                    and ps_suppkey = l_suppkey
                    and l_orderkey = V5.o_orderkey
                    and ps_suppkey = s_suppkey
                    and s_nationkey = n_nationkey
                    and n_regionkey = r_regionkey
                    and r_name = 'AMERICA'
                group by s_name, V5.o_orderpriority;
            """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0]) 
            k = '{:<}'.format(row[1])
            l= '{:}'.format(row[2])

            
            print(str(j + "|" + k + "|" + l))

        with open('output/6.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0]) 
                k = '{:<}'.format(row[1])
                l= '{:}\n'.format(row[2])

                f.write(str(j+ "|" + k + "|" + l))
            f.close()

    except Error as e:
        print(e)


    print("++++++++++++++++++++++++++++++++++")


def Q7(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q7")

    try:
        sql = """
            SELECT n_name, V5.o_orderstatus, count(*) AS Tot
            FROM V1, V5
            WHERE V5.o_custkey = V1.c_custkey 
                AND V1.r_name = 'EUROPE'
            GROUP BY V1.n_name, V5.o_orderstatus;
            """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0]) 
            k = '{:}'.format(row[1])
            l = '{:}'.format(row[2])

            
            print(str(j + "|" + k + "|" + l))


        with open('output/7.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0]) 
                k = '{:}'.format(row[1])
                l= '{:}\n'.format(row[2])

                f.write(str(j + "|" + k + "|" + l))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q8(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q8")

    try:
        sql = """SELECT V2.s_nation, COUNT(DISTINCT o_orderkey) AS Tot_orders
                FROM lineitem, V2, V5
                WHERE s_suppkey = l_suppkey
                    AND l_orderkey = o_orderkey
                    AND o_orderstatus = 'F'
                    AND o_orderyear LIKE '1994%'
                GROUP BY V2.s_nation
                HAVING tot_orders > 300;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0]) 
            k = '{:<}'.format(row[1])

            print(str(j+ "|" + k))

        with open('output/8.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0]) 
                k = '{:}\n'.format(row[1])

                f.write(str(j + "|" + k))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q9(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q9")

    try:
        sql = """SELECT COUNT(DISTINCT V5.o_clerk) AS Tot_Clerks
                FROM V2, V5, lineitem
                WHERE s_suppkey = l_suppkey
                    AND s_nation = 'CANADA'
                    AND l_orderkey = V5.o_orderkey;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0])

            print(str(j))

        with open('output/9.out', 'w') as f:
            for row in rows:
                j = '{:<0}\n'.format(row[0])

                f.write(str(j))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q10(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q10")

    try:
        sql = """SELECT p_type, ROUND(avg_discount, 16) AS Avg_Discount
                FROM V10
                WHERE p_type LIKE '%PROMO%'
                GROUP BY p_type;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0])
            k = '{:}'.format(row[1])

            
            print(str(j + "|" + k))

        with open('output/10.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0])
                k = '{}\n'.format(row[1])

                f.write(str(j + "|" + k))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q11(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q11")

    try:
        sql = """SELECT s_nation, s_name, ROUND(V2.s_acctbal, 2) AS AcctBal
                FROM V2
                WHERE V2.s_acctbal = (SELECT MAX(supp2.s_acctbal) AS Max_AcctBal
                                        FROM V2 supp2
                                        WHERE V2.s_nation = supp2.s_nation)
                ORDER BY s_nation ASC;
                """
        
        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0])
            k = '{:.16}'.format(row[1])
            l = '{:}'.format(row[2])

            
            print(str(j + "|" + k + "|" + l))

        with open('output/11.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0])
                k = '{:<0}'.format(row[1])
                l = '{:}\n'.format((row[2]))

                f.write(str(j + "|" + k + "|" + l))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q12(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q12")
# ############## CHECK THIS
    try:
        sql = """SELECT V2.s_nation, ROUND(AVG(V2.s_acctbal),11) AS Avg_AcctBal
                FROM V2
                GROUP BY V2.s_nation;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0])
            k = '{}\n'.format(row[1])

            print(str(j + "|" + k))


        with open('output/12.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0])
                k = '{:}\n'.format(row[1])

                f.write(str(j + "|" + k))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q13(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q13")

    try:
        sql = """SELECT count(*) AS Tot_Count
                FROM customer, lineitem, orders
                WHERE o_orderkey = l_orderkey 
                    AND o_custkey = c_custkey 
                    AND l_suppkey IN (
                        SELECT V2.s_suppkey AS Supp_Key
                        FROM V2
                        WHERE
                            V2.s_region = 'ASIA') 
                    AND c_custkey IN (
                        SELECT V1.c_custkey AS Cust_Key
                        FROM V1
                        WHERE
                            V1.n_name = 'ARGENTINA');
                        """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0])

            
            print(str(j ))


        with open('output/13.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0])

                f.write(str(j))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q14(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q14")

    try:
        sql = """SELECT cust_Region, supp_Region, COUNT(*) AS Tot_Count
                FROM orders JOIN
                    (
                    SELECT o_orderkey AS cust_Order, V1.r_name AS cust_Region
                    FROM orders, V1
                    WHERE
                        o_custkey = V1.c_custkey) ON o_orderkey = cust_Order
                    JOIN(
                    SELECT l_orderkey as supp_Order, V2.s_region AS supp_Region
                    FROM lineitem, V2
                    WHERE
                        l_suppkey = V2.s_suppkey) ON o_orderkey = supp_Order
                    GROUP BY cust_Region, supp_Region;
                """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}'.format(row[0])
            k = '{:<0}'.format(row[1])
            l = '{}'.format(row[2])

            
            print(str(j + "|" + k + "|" + l))


        with open('output/14.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0])
                k = '{:<0}'.format(row[1])
                l = '{}\n'.format(row[2])

                f.write(str(j + "|" + k + "|" + l))
            f.close()

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q15(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q15")

    try:
        sql = """SELECT COUNT(DISTINCT o_orderkey) AS Tot_Count
            FROM V151, V152, orders, lineitem
            WHERE l_orderkey = o_orderkey
            AND o_custkey IN (SELECT c_custkey FROM V151)
            AND l_suppkey IN (SELECT s_suppkey FROM V152);
                            """

        args = []

        cur = _conn.cursor()
        cur.execute(sql, args)

        rows = cur.fetchall()

        for row in rows:
            j = '{:<0}\n'.format(row[0])

            print(str(j))


        with open('output/15.out', 'w') as f:
            for row in rows:
                j = '{:<0}'.format(row[0])

                f.write(str(j))
            f.close()

    except Error as e:
        print(e)


    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"data/tpch.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        create_View1(conn)
        Q1(conn)

        create_View2(conn)
        Q2(conn)

        Q3(conn)
        Q4(conn)

        create_View5(conn)
        Q5(conn)

        Q6(conn)
        Q7(conn)
        Q8(conn)
        Q9(conn)

        create_View10(conn)
        Q10(conn)

        Q11(conn)
        Q12(conn)
        Q13(conn)
        Q14(conn)

        create_View151(conn)
        create_View152(conn)
        Q15(conn)

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
