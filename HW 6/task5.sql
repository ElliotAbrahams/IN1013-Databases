-- 1

SELECT first_name, surname, bill_date,COUNT(*)
FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
GROUP BY waiter_no, bill_date
HAVING COUNT(*) >= 2;

-- 2

SELECT room_name, count(*)
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3

SELECT room_name, COUNT(*)
FROM restBill
INNER JOIN restRest_table 
ON restRest_table.table_no = restBill.table_no
GROUP BY room_name;

-- 4

SELECT T2.first_name, T2.surname, SUM(bill_total)
FROM restBill
INNER JOIN restStaff T1
ON T1.staff_no = restBill.waiter_no
INNER JOIN restStaff T2
ON T1.headwaiter = T2.staff_no
GROUP BY T2.staff_no
ORDER BY SUM(bill_total) DESC;

-- 5

SELECT cust_name, AVG(bill_total)
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6

SELECT first_name, surname, COUNT(*)
FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
GROUP BY waiter_no, bill_date
Having COUNT(*) >= 3;




