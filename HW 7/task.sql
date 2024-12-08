-- 1

CREATE VIEW samsBills
AS SELECT first_name, surname, bill_date, cust_name, bill_total
    FROM restBill
    INNER JOIN restStaff
    ON restStaff.staff_no = restBill.waiter_no
    WHERE first_name = "Sam"
    AND surname =  "Pitt";

-- 2

SELECT *
FROM samsBills
WHERE bill_total > 400;

--3

CREATE VIEW roomTotals
AS SELECT room_name, sum(bill_total) AS total_sum
    FROM restBill
    INNER JOIN restRest_table
    ON restRest_table.table_no = restBill.table_no
    GROUP BY room_name;

-- 4

CREATE VIEW teamTotals
AS SELECT CONCAT(T2.first_name , " " , T2.surname) AS headwaiter_name, SUM(bill_total) as total_sum
    FROM restBill
    INNER JOIN restStaff T1
    ON T1.staff_no = restBill.waiter_no
    INNER JOIN restStaff T2
    ON T2.staff_no = T1.headwaiter
    GROUP BY T2.staff_no;

                     