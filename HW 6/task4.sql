-- 1                     

SELECT cust_name
FROM restBill
WHERE waiter_no IN(SELECT S1.staff_no
                FROM restStaff as S1
                INNER JOIN restStaff as S2
                ON S2.staff_no = S1.headwaiter
                WHERE S2.first_name = 'Charles')
AND bill_total > 450.00;

-- 2

SELECT T1.first_name, T1.surname 
FROM restStaff T1
INNER JOIN restStaff T2
ON T1.staff_no = T2.headwaiter
WHERE T2.headwaiter IN (SELECT headwaiter
    FROM restStaff
    INNER JOIN restBill
    ON restBill.waiter_no = restStaff.staff_no
    WHERE cust_name = 'Nerida Smith'
    AND bill_date = '160111');

-- 3

SELECT cust_name
FROM restBill
WHERE bill_total IN (SELECT MIN(bill_total)
                FROM restBill);

-- 4

SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (SELECT staff_no
                        FROM restStaff
                        INNER JOIN restBill
                        ON restStaff.staff_no = restBill.waiter_no);

-- 5

SELECT cust_name, T2.first_name, T2.surname, room_name
FROM restBill
INNER JOIN restStaff T1
ON T1.staff_no = restBill.waiter_no
INNER JOIN restStaff T2
ON T1.headwaiter = T2.staff_no
INNER JOIN restRest_table
ON restRest_table.table_no = restBill.table_no
WHERE bill_total IN (SELECT MAX(bill_total)
                    FROM restBill);
