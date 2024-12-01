-- 1

SELECT first_name, surname
FROM restStaff
INNER JOIN restBill
ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.cust_name = 'Tanya Singh';

-- 2

SELECT bill_date
FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
INNER JOIN restRoom_management
ON restRoom_management.headwaiter = restStaff.headwaiter
WHERE restRoom_management.room_name = 'Green'
AND restBill.bill_date LIKE '1602__'
AND restStaff.first_name = 'Charles';

-- 3

SELECT T1.first_name, T1.surname
FROM restStaff T1
INNER JOIN restStaff T2
ON T2.staff_no = T1.headwaiter
WHERE T2.first_name = 'Zoe'
AND T2.first_name = 'Ball';

-- 4

SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name
FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
ORDER BY restBill.bill_total;

-- 5

SELECT first_name, surname
FROM restStaff
WHERE headwaiter IN(SELECT headwaiter
                        FROM restStaff
                        INNER JOIN restBill
                        ON restBill.waiter_no = restStaff.staff_no
                        WHERE restBill.bill_no = '00014'
                        OR restBill.bill_no = '00017');

-- 6

SELECT first_name, surname
FROM restStaff
WHERE headwaiter IN(SELECT headwaiter
                    FROM restStaff
                    INNER JOIN restBill
                    ON restBill.waiter_no = restStaff.staff_no
                    INNER JOIN restRest_table
                    ON restRest_table.table_no = restBill.table_no
                    WHERE restRest_table.room_name = 'Blue')
OR staff_no IN(SELECT headwaiter
                    FROM restStaff
                    INNER JOIN restBill
                    ON restBill.waiter_no = restStaff.staff_no
                    INNER JOIN restRest_table
                    ON restRest_table.table_no = restBill.table_no
                    WHERE restRest_table.room_name = 'Blue');