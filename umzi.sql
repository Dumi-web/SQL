-- Adminer 4.7.6 PostgreSQL dump

DROP TABLE IF EXISTS "customers";
DROP SEQUENCE IF EXISTS customers_customersid_seq;
CREATE SEQUENCE customers_customersid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."customers" (
    "customersid" integer DEFAULT nextval('customers_customersid_seq') NOT NULL,
    "first_name" character varying(50) NOT NULL,
    "last_name" character varying(50) NOT NULL,
    "gender" character varying NOT NULL,
    "address" character varying(200) NOT NULL,
    "phone" integer NOT NULL,
    "email" character varying(100) NOT NULL,
    "city" character varying(20) NOT NULL,
    "country" character varying(50) NOT NULL,
    CONSTRAINT "customers_pkey" PRIMARY KEY ("customersid")
) WITH (oids = false);

INSERT INTO "customers" ("customersid", "first_name", "last_name", "gender", "address", "phone", "email", "city", "country") VALUES
(1,	'John',	'Hibert',	'Male',	'284 chaucer st',	84789657,	'john@gmail.com',	'Johannesburg',	'South Africa'),
(2,	'Thando',	'Sithole',	'Female',	'240 Sect 1',	794445584,	'thando@gmail.com',	'Cape Town',	'South Africa'),
(3,	'Leon',	'Glen',	'Male',	'81 Everton Rd, Gillits',	820832830,	'Leon@gmail.com',	'Durban',	'South Africa'),
(4,	'Charl',	'Muller',	'Male',	'290A Dorset Ecke',	834567896,	'Charl.muller@yahoo.com',	'Berlin',	'Germany'),
(5,	'Julia',	'Stein',	'Female',	'2 Wernerring',	792398557,	'Js234@yahoo.com',	'Frankfurt',	'Germany');

DROP TABLE IF EXISTS "employee";
DROP SEQUENCE IF EXISTS employee_employeeid_seq;
CREATE SEQUENCE employee_employeeid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."employee" (
    "employeeid" integer DEFAULT nextval('employee_employeeid_seq') NOT NULL,
    "first_name" character varying(50) NOT NULL,
    "last_name" character varying(50) NOT NULL,
    "email" character varying(100) NOT NULL,
    "job_title" character varying(20) NOT NULL,
    CONSTRAINT "employee_pkey" PRIMARY KEY ("employeeid")
) WITH (oids = false);

INSERT INTO "employee" ("employeeid", "first_name", "last_name", "email", "job_title") VALUES
(1,	'Kani',	'Matthew',	'at@gmail.com',	'Manager'),
(2,	'Lesly',	'Cronje',	'LesC@gmail.com',	'Clerk'),
(3,	'Gideon',	'Maduku',	'm@gmail.com',	'Accountant');

DROP TABLE IF EXISTS "orders";
DROP SEQUENCE IF EXISTS orders_orderid_seq;
CREATE SEQUENCE orders_orderid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."orders" (
    "orderid" integer DEFAULT nextval('orders_orderid_seq') NOT NULL,
    "productid" integer,
    "paymentid" integer,
    "employeeid" integer,
    "date_required" date,
    "date_shipped" date,
    "status" character varying(20),
    CONSTRAINT "orders_pkey" PRIMARY KEY ("orderid"),
    CONSTRAINT "orders_employeeid_fkey" FOREIGN KEY (employeeid) REFERENCES employee(employeeid) NOT DEFERRABLE,
    CONSTRAINT "orders_paymentid_fkey" FOREIGN KEY (paymentid) REFERENCES payments(paymentid) NOT DEFERRABLE,
    CONSTRAINT "orders_productid_fkey" FOREIGN KEY (productid) REFERENCES products(productid) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "orders" ("orderid", "productid", "paymentid", "employeeid", "date_required", "date_shipped", "status") VALUES
(1,	1,	1,	2,	'2018-05-09',	NULL,	'Not shipped'),
(2,	1,	2,	2,	'2018-04-09',	'2018-03-09',	'Shipped'),
(3,	3,	3,	3,	'2018-06-09',	NULL,	'Not shipped');

DROP TABLE IF EXISTS "payments";
DROP SEQUENCE IF EXISTS payments_paymentid_seq;
CREATE SEQUENCE payments_paymentid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."payments" (
    "customersid" integer NOT NULL,
    "paymentid" integer DEFAULT nextval('payments_paymentid_seq') NOT NULL,
    "payment_date" date NOT NULL,
    "amount" numeric NOT NULL,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("paymentid"),
    CONSTRAINT "payments_customersid_fkey" FOREIGN KEY (customersid) REFERENCES customers(customersid) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "payments" ("customersid", "paymentid", "payment_date", "amount") VALUES
(1,	1,	'2018-01-09',	150.75),
(5,	2,	'2018-03-09',	150.75),
(4,	3,	'2018-03-09',	700.60);

DROP TABLE IF EXISTS "products";
DROP SEQUENCE IF EXISTS products_productid_seq;
CREATE SEQUENCE products_productid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."products" (
    "productid" integer DEFAULT nextval('products_productid_seq') NOT NULL,
    "product_name" character varying(100) NOT NULL,
    "description" character varying(300) NOT NULL,
    "buy_price" numeric(19,2) NOT NULL,
    CONSTRAINT "products_pkey" PRIMARY KEY ("productid")
) WITH (oids = false);

INSERT INTO "products" ("productid", "product_name", "description", "buy_price") VALUES
(1,	'Harley Davidson Chopper',	'This replica features working kickstand, front suspension, gear-shift lever',	150.75),
(2,	'Classic Car',	'Turnable front wheels, steering function',	550.75),
(3,	'Sports car',	'Turnable front wheels, steering function',	700.60);

-- 2020-03-10 13:04:17.646278+00
