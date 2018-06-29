CONNECT salon/salon;

-- Open log file.
SPOOL create_salon.log

-- Set SQL*Plus environmnet variables.
SET ECHO ON
SET FEEDBACK ON
SET NULL '<Null>'
SET PAGESIZE 999
SET SERVEROUTPUT ON


DROP SEQUENCE tran_detail_s1;
DROP SEQUENCE tran_s1;
DROP SEQUENCE employee_s1;
DROP SEQUENCE location_s1;
DROP SEQUENCE customer_s1;
DROP SEQUENCE product_s1;

DROP TABLE tran_detail;
DROP TABLE tran;
DROP TABLE employee;
DROP TABLE location;
DROP TABLE customer;
DROP TABLE product;

-- Your code goes here --
CREATE TABLE customer
( customer_id                  NUMBER
, name                         VARCHAR2(45) CONSTRAINT nn_customer_1 NOT NULL
, email                        VARCHAR2(45)
, phone                        CHAR(10)     CONSTRAINT nn_customer_2 NOT NULL
, CONSTRAINT pk_customer       PRIMARY KEY(customer_id)
);

CREATE SEQUENCE customer_s1 START WITH 1;

CREATE UNIQUE INDEX customer_idx1 ON customer(name, phone);

CREATE TABLE product
( product_id                  NUMBER
, name                        VARCHAR2(45) CONSTRAINT nn_product_1 NOT NULL
, type                        VARCHAR2(45) CONSTRAINT nn_product_2 NOT NULL
, unitSize                    VARCHAR2(45)
, price                       DECIMAL(5,2) CONSTRAINT nn_product_3 NOT NULL
, CONSTRAINT pk_product       PRIMARY KEY(product_id)
);

CREATE SEQUENCE product_s1 START WITH 1;

CREATE UNIQUE INDEX product_idx1 ON product(name, type, unitSize);


CREATE TABLE location
( location_id                 NUMBER
, address1                    VARCHAR2(45) CONSTRAINT nn_location_1 NOT NULL
, address2                    VARCHAR2(45)
, city                        VARCHAR2(45) CONSTRAINT nn_location_2 NOT NULL
, state                       CHAR(2)      CONSTRAINT nn_location_3 NOT NULL
, zip                         CHAR(5)      CONSTRAINT nn_location_4 NOT NULL
, CONSTRAINT pk_location      PRIMARY KEY(location_id)
);

CREATE SEQUENCE location_s1 START WITH 1;

CREATE UNIQUE INDEX location_idx1 ON location(address1, address2, zip);

CREATE TABLE employee
( employee_id                 NUMBER
, name                        VARCHAR2(45)   CONSTRAINT nn_employee_1 NOT NULL
, title                       VARCHAR2(45)   CONSTRAINT nn_employee_2 NOT NULL
, hireDate                    DATE           CONSTRAINT nn_employee_3 NOT NULL
, terminationDate             DATE
, email                       VARCHAR2(45)   CONSTRAINT nn_employee_4 NOT NULL
, phone                       CHAR(10)       CONSTRAINT nn_employee_5 NOT NULL
, location_id                 NUMBER         CONSTRAINT nn_employee_6 NOT NULL
, manager_id                  NUMBER
, CONSTRAINT pk_employee      PRIMARY KEY(employee_id)
, CONSTRAINT fk_location      FOREIGN KEY(location_id)
                              REFERENCES location(location_id)
, CONSTRAINT fk_manager       FOREIGN KEY(manager_id)
                              REFERENCES employee(employee_id));

CREATE SEQUENCE employee_s1 START WITH 1;

CREATE UNIQUE INDEX employee_idx1 ON employee(email);

CREATE TABLE tran
( tran_id                     NUMBER
, employee_id                 NUMBER        CONSTRAINT nn_tran_2 NOT NULL
, customer_id                 NUMBER        CONSTRAINT nn_tran_3 NOT NULL
, CONSTRAINT pk_tran          PRIMARY KEY(tran_id)
, tran_date                   DATE          CONSTRAINT nn_tran_1 NOT NULL
, CONSTRAINT fk_employee      FOREIGN KEY(employee_id) 
                              REFERENCES employee(employee_id)
, CONSTRAINT fk_customer      FOREIGN KEY(customer_id) 
                              REFERENCES customer(customer_id));

CREATE SEQUENCE tran_s1 START WITH 1;

CREATE UNIQUE INDEX tran_idx1 ON tran(customer_id, employee_id, tran_date);

CREATE TABLE tran_detail
( tran_detail_id              NUMBER
, tran_id                     NUMBER            CONSTRAINT nn_tran_detail_1 NOT NULL
, product_id                  NUMBER            CONSTRAINT nn_tran_detail_2 NOT NULL
, amount_charged              DECIMAL(6,2)      CONSTRAINT nn_tran_detail_3 NOT NULL
, CONSTRAINT pk_tran_detail   PRIMARY KEY(tran_detail_id)
, CONSTRAINT fk_tran          FOREIGN KEY(tran_id)
                              REFERENCES tran(tran_id)
, CONSTRAINT fk_product       FOREIGN KEY(product_id)
                              REFERENCES product(product_id)   
);

CREATE SEQUENCE tran_detail_s1 START WITH 1;

CREATE UNIQUE INDEX tran_detail_idx1 ON tran_detail(tran_id, product_id, amount_charged);




-- Close log file.
SPOOL OFF;
