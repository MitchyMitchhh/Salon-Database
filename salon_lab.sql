

--@/home/student/Data/cit225/oracle/salon/cleanup_oracle.sql;
--@/home/student/Data/cit225/oracle/salon/create_salon.sql;
--@/home/student/Data/cit225/oracle/salon/salon_insert.sql;
@"C:\Users\Mitch\Downloads\Mitch\School\Semester 4\CIT 225\Salon\create_salon.sql";
@"C:\Users\Mitch\Downloads\Mitch\School\Semester 4\CIT 225\Salon\salon_insert.sql";
--@"C:\Users\Mitch\Downloads\Mitch\School\Semester 4\CIT 225\Salon\cleanup_oracle.sql";


-- Show the Name, Type and Price of items (products and services) purchased by each customer sorted by customer name
SELECT DISTINCT C.name AS customer_name, P.name, P.type, P.price
FROM PRODUCT P JOIN TRAN_DETAIL TD on P.product_id = TD.product_id
     JOIN TRAN T ON TD.tran_id = T.tran_id
     JOIN CUSTOMER C ON C.customer_id = T.customer_id;

-- Show the total spend of each customer sorted by spend descending
SELECT C.name AS "Customer Name", SUM(TD.amount_charged) AS Total  
FROM CUSTOMER C JOIN TRAN T ON C.customer_id = T.customer_id
     JOIN TRAN_DETAIL TD ON T.tran_id = TD.tran_id
GROUP BY C.name
ORDER BY total DESC;

-- Show the total revenue generated by each employee sorted by revenue descending
SELECT E.name AS "Employee Name", SUM(TD.amount_charged) AS Total  
FROM EMPLOYEE E JOIN TRAN T ON E.employee_id = T.employee_id
     JOIN TRAN_DETAIL TD ON T.tran_id = TD.tran_id
GROUP BY E.name
ORDER BY total DESC;


-- Show each employee with their title, hire date, manager and manager title   
SELECT E.name, E.title, E.hireDate, M.name as manager, M.title AS "Manager Title"
FROM
    EMPLOYEE E, EMPLOYEE M
WHERE E.manager_id = M.employee_id OR M.name = 'Jenny Jensen' AND E.name = 'Jenny Jensen';
-- Unnormalized Data

