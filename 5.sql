--  DROP SCHEMA public CASCADE ;
-- create schema public;

CREATE table Customers(
    ID int NOT NULL PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Surname varchar(50) NOT NULL,
    Phone_number varchar(11),
    Gender varchar(10) CHECK ( Gender = 'Man' or Gender = 'Woman' )
);

CREATE table Online(
    ID int PRIMARY KEY,
    Customer_ID int NOT NULL REFERENCES Customers,
    Profile varchar(50) ,
    Name varchar(50) ,
    Surname varchar(50)
);


CREATE table Pay_info(
--     Customer_ID int not null ,
    Card_type varchar(50) NOT NULL CHECK ( Card_type = 'Debut' or Card_type = 'Credit' ),
    Card_number varchar(20) NOT NULL PRIMARY KEY CHECK ( textlen(Card_number) = 16 ),
    Expirition_date date  NOT NULL ,
    CVV varchar(3) NOT NULL CHECK ( textlen(CVV) = 3 ),
    online_id INT,
    FOREIGN KEY (online_id) REFERENCES Online(id)
);
--
 INSERT INTO Pay_info VALUES ( 'Credit', '5433930526473416', '2016-08-24', '018'),
 ( 'Debut', '3478627258387612', '1996-03-15', '910'),
 ( 'Debut', '0757633851040359', '2007-02-19', '331'),
 ( 'Credit', '3328284786673659', '2024-06-30', '130'),
 ( 'Debut', '3399719673754895', '2002-09-25', '991'),
 ( 'Credit', '3031351165177797', '2005-10-03', '541')
 ;


CREATE table Offline(
    Customer_ID int PRIMARY KEY,
    Bill int,
    Currency varchar(50)
);

INSERT INTO Offline VALUES (2, 166150, 'KZT'),
                           (4, 991068, 'KZT'),
                           (6, 367242, 'KZT'),
                           (10, 288972, 'KZT'),
                           (7, 553375, 'KZT');


CREATE table Company(
    ID int NOT NULL PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Address varchar(50) NOT NULL,
    Index varchar(50) NOT NULL
);

INSERT INTO Company(ID, Name, Address, Index)
VALUES ('100', 'Mechta', 'Tole-Bi', '100123'),
       ('101', 'Technodom', 'Abay', '101123'),
       ('102', 'Alser', 'Raimbek', '102123');

CREATE table Orders(
    ID int NOT NULL PRIMARY KEY,
    Customer_ID int NOT NULL,
    Ordered_Date date NOT NULL,
    Total_cost int NOT NULL ,
    Ordered_quantity int NOT NULL ,
    Unit_Price int NOT NULL,
    company_id INT,
    foreign key (company_id) references  Company(ID)
);

INSERT INTO Orders VALUES (1, 1, '1993-02-26', 1013146, 5, 202629 ),
                            (2, 2, '2023-07-07', 63477, 3, 21159 ),
                            (3, 3, '2002-04-09', 274892, 1, 274892 ),
                            (4, 4, '1998-06-10', 994721, 5, 198944 ),
                            (5, 5, '1994-12-05', 33399, 5, 6679 ),
                            (6, 6, '2014-03-29', 691904, 4, 172976 ),
                            (7, 7, '2014-07-06', 682720, 10, 68272 ),
                            (8, 8, '2005-04-13', 327005, 1, 327005 ),
                            (9, 9, '2013-01-01', 283874, 8, 35484 ),
                            (10, 10, '2017-05-14', 254381, 2, 127190 );

CREATE table Contract(
    Date date PRIMARY KEY,
    Period interval,
    Month_pay int,
    customers_id int,
    foreign key (customers_id) references Customers(ID),
    company_id int,
    foreign key (company_id) references Company(ID)
);

INSERT INTO Contract VALUES ('1997-10-15', '1 years 8 months 9 days', 130174),
                            ('2007-04-25', '2 years 3 months 22 days', 273287),
                            ('2010-01-13', '7 years 5 months 17 days', 145033);

CREATE table Transaction(
    ID int NOT NULL PRIMARY KEY,
    Customer_ID int NOT NULL,
    Product_ID int NOT NULL,
    Date_tr date NOT NULL,
    Season varchar(50),
    Region varchar(50),
    price_of_purchase int
);

-- CREATE OR REPLACE FUNCTION transaction1() RETURNS trigger AS
--     $$
--     begin
--         INSERT INTO Transaction(Customer_ID, Product_ID, Date_tr, Season, Region, price_of_purchase) VALUES (old.Customer_ID, , now(),);
--     end;
--     $$ language plpgsql;
--
-- CREATE trigger transaction12
--     AFTER insert on orders
--     for each row execute transaction1();

insert into Transaction(ID, Customer_ID, Product_ID, Date_tr, Season, Region, price_of_purchase)
VALUES ('123456', '6', '2', '2021-11-11', 'Autumn', 'North', '20000'),
       ('2', '5', '1', '2021-09-30', 'Autumn', 'West', '120000'),
       ('3', '4', '6', '2021-08-23', 'Summer', 'East', '150000'),
       ('4', '1', '5', '2021-08-15', 'Summer', 'South', '200000'),
       ('5', '7', '4', '2021-07-12', 'Summer', 'North', '260000'),
       ('6', '2', '3', '2021-07-30', 'Summer', 'South', '360000'),
       ('7', '8', '7', '2021-06-28', 'Summer', 'West', '240000'),
       ('8', '3', '8', '2021-05-17', 'Summer', 'East', '50000'),
       ('9', '9', '9', '2021-05-17', 'Spring', 'North', '10000'),
       ('10', '10', '10', '2021-04-25', 'Spring', 'West', '15000');




CREATE type product1 as(
    Type_name varchar(50),
    Color varchar(50),
    Weight int,
    Manufacturer_name varchar(50),
    Description text
);

CREATE table Product(
    ID int NOT NULL PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Measure int not null,
    Price int NOT NULL,
    Arrival_date date NOT NULL,
    Specification product1,
    company_id int,
    foreign key (company_id) references Company(ID)
);

insert into Product VALUES (1,'acm',1,15,'2021-12-12',row ('vacuum cleaner','red',45,'Samsung','show'),100);
insert into Product VALUES (2,'acm',1,15,'2021-12-12',row ('refrigerator','red',45,'Samsung','wash'),102);
insert into Product VALUES (3,'acm',1,15,'2021-12-12',row ('microwave','red',45,'Samsung','wash'),101);
insert into Product VALUES (4,'acm',1,15,'2021-12-12',row ('hair dryer','red',45,'Apple','play'),101);
insert into Product VALUES (5,'acm',1,15,'2021-12-12',row ('camera','red',45,'Huawei','play'),102);
insert into Product VALUES (6,'acm',1,15,'2021-12-12',row ('TV','red',45,'Apple','store'),101);
insert into Product VALUES (7,'acm',1,15,'2021-12-12',row ('freezer','red',45,'Huawei','store'),100);
insert into Product VALUES (8,'acm',1,15,'2021-12-12',row ('monitor','red',45,'LG','warm up'),102);
insert into Product VALUES (9,'acm',1,15,'2021-12-12',row ('mouse','red',45,'LG','show'),102);
insert into Product VALUES (10,'acm',1,15,'2021-12-12',row ('headphones','red',45,'Huawei','warm up'),102);


CREATE table Shipper(
    Tracking_number int NOT NULL PRIMARY KEY,
    Product_ID int[] NOT NULL,
    Phone_number varchar(11)
);

CREATE table Storage(
    storage_id int primary key ,
    Product_ID int[],
    Quantity int NOT NULL,
    Last_update_date date NOT NULL
);
INSERT INTO Shipper(Tracking_number, Product_ID, Phone_number)
VALUES (5, '{1,5,7}', '87777145876'),
       (6, '{2,5,3}', '87774785322'),
       (8, '{9,3,8}', '87774856998'),
       (10, '{6,1,2}', '87774788547'),
       (2, '{5,9,10}', '87774457874');
INSERT INTO Storage(storage_id, Product_ID, Quantity, Last_update_date)
VALUES ('1', '{1, 2, 3}', '25', '2021-07-02'),
       ('2', '{4, 5,6}', '45', '2021-06-30'),
       ('3', '{7, 8, 9}', '80', '2021-12-06');

CREATE table Checking(
    ID int NOT NULL PRIMARY KEY,
    Date_of_inv date NOT NULL,
    Product_ID int NOT NULL,
    Employee_ID int NOT NULL
);
INSERT INTO Checking(ID, Date_of_inv, Product_ID, Employee_ID)
VALUES ('1001', '2021-04-04', '4', '5'),
       ('1002', '2021-02-20', '8', '2'),
       ('1003', '2021-01-30', '9', '6'),
       ('1004', '2020-12-25', '6', '1');
CREATE table Purchase_Order_for_parts(
    ID int NOT NULL PRIMARY KEY,
    Product_ID int NOT NULL,
    Name varchar(50) NOT NULL,
    Quantity varchar(50) NOT NULL,
    Purchased_date date NOT NULL,
    Cost int NOT NULL
);

CREATE table Suppliers(
    ID int NOT NULL PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Address varchar(50) NOT NULL,
    Phone_number varchar(11) NOT NULL,
    Order_ID int NOT NULL
);

CREATE table Factory(
    ID int NOT NULL PRIMARY KEY,
    Product_ID int NOT NULL,
    Location varchar(50) NOT NULL
);

INSERT INTO Customers VALUES (1,'Emmett','Rocha','87528351334'),
                             (2,'Khaleesi' ,'Dupont','87404459674'),
                             (3,'Wyatt', 'Holland','87577467918'),
                             (4,'Andreas', 'Allan','87259223732'),
                             (5,'Raphael', 'Finnegan','87410990382'),
                             (6,'Malaki' ,'Sullivan','87538226702'),
                             (7,'Ruby-May', 'Mcdowell','87550475198'),
                             (8,'Abdulahi', 'Rios','87665702257'),
                             (9,'Tyreece' ,'Andrew','87662615981'),
                             (10,'Jermaine', 'Campbell','87493385938');

INSERT INTO Online VALUES (1, 5, 'Raggedy','Raphael', 'Finnegan'),
                          (2, 9, 'Andy', 'Tyreece' ,'Andrew'),
                          (3, 2, 'Khaleesi','Khaleesi' ,'Dupont');

--4
--1
select Customers.id, Customers.name, Customers.surname, customers.phone_number
from customers inner join transaction t on Customers.ID = t.customer_id
where t.id = 123456;

select Product.id, Product.name, Product.measure, Product.price
from Product inner join Transaction on Product.ID = Transaction.Product_ID
where Transaction.id = 123456;

update Transaction
set date_tr = now()
where id = 123456;

--2

select customers.id, customers.name, max(t.price_of_purchase) as max
from Customers inner join transaction t on Customers.ID = t.customer_id
where date_tr > '2020-01-01' and date_tr< '2021-12-31'
group by customers.id, customers.name
order by  max desc limit 2;



