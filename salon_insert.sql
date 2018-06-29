CONNECT salon/salon;

-- Open log file.
SPOOL salon_insert.log

INSERT INTO location
VALUES (
  location_s1.nextval
  , '100 N Main St.'
  , 'Suite 3'
  , 'Rexburg'
  , 'ID'
  , '83441');
  
INSERT INTO location
VALUES (
  location_s1.nextval
  , '200 N Center St.'
  , NULL
  , 'Rigby'
  , 'ID'
  , '83442');
     
INSERT INTO employee
VALUES (
  employee_s1.nextval
, 'Jenny Jensen'
, 'Owner'
, '15-JUN-2013'
, NULL
, 'jensenj@salon.com'
, '2081112222'
, (SELECT location_id FROM LOCATION WHERE city = 'Rexburg')
, NULL);

INSERT INTO employee
VALUES (
  employee_s1.nextval
, 'Haley Lopez'
, 'Assistant Manager'
, '15-AUG-2013'
, NULL
, 'lopezh@salon.com'
, '2083334444'
, (SELECT location_id FROM LOCATION WHERE city = 'Rexburg')
, (SELECT employee_id FROM EMPLOYEE WHERE name = 'Jenny Jensen'));

INSERT INTO employee
VALUES (
  employee_s1.nextval
, 'Robert Green'
, 'Associate'
, '03-JAN-2014'
, NULL
, 'greenr@salon.com'
, '2085556666'
, (SELECT location_id FROM LOCATION WHERE city = 'Rexburg')
, (SELECT employee_id FROM EMPLOYEE WHERE name = 'Haley Lopez'));

INSERT INTO employee
VALUES (
  employee_s1.nextval
, 'Olive Adams'
, 'Manager'
, '07-JUL-2015'
, NULL
, 'adamso@salon.com'
, '2087778888'
, (SELECT location_id FROM LOCATION WHERE city = 'Rigby')
, (SELECT employee_id FROM EMPLOYEE WHERE name = 'Jenny Jensen'));

INSERT INTO employee
VALUES (
  employee_s1.nextval
, 'Julie Davis'
, 'Associate'
, to_date('20-OCT-2015')
, NULL
, 'davisj@salon.com'
, '2089990000'
, (SELECT location_id FROM LOCATION WHERE city = 'Rigby')
, (SELECT employee_id FROM EMPLOYEE WHERE name = 'Olive Adams'));

INSERT INTO customer
VALUES (
  customer_s1.nextval
, 'Jeana Bradford'
, 'jb@gmail.com'
, '1112223333');

INSERT INTO customer
VALUES (
  customer_s1.nextval
, 'Sandra Hobbs'
, 'sh@gmail.com'
, '1112223334');

INSERT INTO customer
VALUES (
  customer_s1.nextval
, 'Ryan Taylor'
, 'rt@gmail.com'
, '1112223334');

INSERT INTO customer
VALUES (
  customer_s1.nextval
, 'Michelle Drake'
, 'md@gmail.com'
, '1112223336');

INSERT INTO customer
VALUES (
  customer_s1.nextval
, 'Heidi Nolan'
, 'hn@gmail.com'
, '1112223337');

INSERT INTO customer
VALUES (
  customer_s1.nextval
, 'Karen Smith'
, 'ks@gmail.com'
, '1112223338');

INSERT INTO customer
VALUES (
  customer_s1.nextval
, 'Jose Mendez'
, 'jm@gmail.com'
, '1112223339');

INSERT INTO product
VALUES (
   product_s1.nextval
, 'Shampoo'
, 'Product'
, '8 oz'
, 4.95);

INSERT INTO product
VALUES (
   product_s1.nextval
, 'Shampoo'
, 'Product'
, '16 oz'
, 8.95);

INSERT INTO product
VALUES (
   product_s1.nextval
, 'Conditioner'
, 'Product'
, '12 oz'
, 8.95);

INSERT INTO product
VALUES (
   product_s1.nextval
, 'Hairspray'
, 'Product'
, '8 oz'
, 7.95);

INSERT INTO product
VALUES (
   product_s1.nextval
, 'Shampoo'
, 'Service'
, NULL
, 8.00);

INSERT INTO product
VALUES (
   product_s1.nextval
, 'Men Hair Cut'
, 'Service'
, NULL
, 15.00);

INSERT INTO product
VALUES (
   product_s1.nextval
, 'Women Hair Cut'
, 'Service'
, NULL
, 25.00);

INSERT INTO product
VALUES (
   product_s1.nextval
, 'Color'
, 'Service'
, NULL
, 50.00);

INSERT INTO product
VALUES (
   product_s1.nextval
, 'Perm'
, 'Service'
, NULL
, 60.00);

INSERT INTO tran
VALUES (
   tran_s1.nextval
, (SELECT employee_id FROM EMPLOYEE WHERE name = 'Jenny Jensen')
, (SELECT customer_id FROM CUSTOMER WHERE name = 'Jose Mendez')
, TO_DATE('2016-03-25','YYYY-MM-DD'));

INSERT INTO tran
VALUES (
   tran_s1.nextval
, (SELECT employee_id FROM EMPLOYEE WHERE name = 'Jenny Jensen')
, (SELECT customer_id FROM CUSTOMER WHERE name = 'Karen Smith')
, TO_DATE('2016-03-25','YYYY-MM-DD'));

INSERT INTO tran
VALUES (
   tran_s1.nextval
, (SELECT employee_id FROM EMPLOYEE WHERE name = 'Haley Lopez')
, (SELECT customer_id FROM CUSTOMER WHERE name = 'Heidi Nolan')
, TO_DATE('2016-03-25','YYYY-MM-DD'));

INSERT INTO tran
VALUES (
   tran_s1.nextval
, (SELECT employee_id FROM EMPLOYEE WHERE name = 'Robert Green')
, (SELECT customer_id FROM CUSTOMER WHERE name = 'Michelle Drake')
, TO_DATE('2016-03-25','YYYY-MM-DD'));

INSERT INTO tran
VALUES (
   tran_s1.nextval
, (SELECT employee_id FROM EMPLOYEE WHERE name = 'Olive Adams')
, (SELECT customer_id FROM CUSTOMER WHERE name = 'Ryan Taylor')
, TO_DATE('2016-03-25','YYYY-MM-DD'));

INSERT INTO tran_detail
VALUES (
   tran_detail_s1.nextval
, (SELECT tran_id FROM TRAN WHERE tran_id = '1')
, (SELECT product_id FROM PRODUCT WHERE product_id = '1')
, 7.95);

INSERT INTO tran_detail
VALUES (
   tran_detail_s1.nextval
, (SELECT tran_id FROM TRAN WHERE tran_id = '1')
, (SELECT product_id FROM PRODUCT WHERE product_id = '6')
, 15.00);

INSERT INTO tran_detail
VALUES (
   tran_detail_s1.nextval
, (SELECT tran_id FROM TRAN WHERE tran_id = '2')
, (SELECT product_id FROM PRODUCT WHERE product_id = '9')
, 60.00);

INSERT INTO tran_detail
VALUES (
   tran_detail_s1.nextval
, (SELECT tran_id FROM TRAN WHERE tran_id = '2')
, (SELECT product_id FROM PRODUCT WHERE product_id = '3')
, 8.95);

INSERT INTO tran_detail
VALUES (
   tran_detail_s1.nextval
, (SELECT tran_id FROM TRAN WHERE tran_id = '3')
, (SELECT product_id FROM PRODUCT WHERE product_id = '8')
, 50.00);

INSERT INTO tran_detail
VALUES (
   tran_detail_s1.nextval
, (SELECT tran_id FROM TRAN WHERE tran_id = '4')
, (SELECT product_id FROM PRODUCT WHERE product_id = '7')
, 25.00);

INSERT INTO tran_detail
VALUES (
   tran_detail_s1.nextval
, (SELECT tran_id FROM TRAN WHERE tran_id = '4')
, (SELECT product_id FROM PRODUCT WHERE product_id = '2')
, 8.95);

INSERT INTO tran_detail
VALUES (
   tran_detail_s1.nextval
, (SELECT tran_id FROM TRAN WHERE tran_id = '5')
, (SELECT product_id FROM PRODUCT WHERE product_id = '6')
, 15.00);

SPOOL OFF