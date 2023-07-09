
-- create
CREATE TABLE IF NOT EXISTS suppiler(
SUPP_ID INTEGER PRIMARY KEY,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL
);



CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME varchar(20) NOT NULL,
CUS_PHONE varchar(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER char,
PRIMARY KEY (CUS_ID));



CREATE TABLE IF NOT EXISTS category(
CAT_ID INT NOT NULL,
CAT_NAME varchar(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);



CREATE TABLE IF NOT EXISTS product(
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL default "DUMMY",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) references category (CAT_ID)
);




CREATE table IF NOT EXISTS supplier_pricing (
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT default 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) references product (PRO_ID),
FOREIGN KEY (SUPP_ID) references suppiler(SUPP_ID)
);




CREATE TABLE IF NOT EXISTS orderr (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE date,
CUS_ID INT NOT  NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN key (CUS_ID) references customer(CUS_ID),
FOREIGN KEY (PRICING_ID) references supplier_pricing(PRICING_ID)
);





CREATE table IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTRAS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) references orderr(ORD_ID)
);



-- insert
INSERT INTO suppiler VALUES(1,"Rajesh Retails", "Delhi", '1234567890');
INSERT INTO suppiler VALUES(2,"Appario Ltd", "Mumbai", '2589631470');
INSERT INTO suppiler VALUES(3,"Knome Products", "Banglore", '9785462315');
INSERT INTO suppiler VALUES(4,"Bansal Retails", "kochi", '8975463285');
INSERT INTO suppiler VALUES(5,"Mittal Ltd", "lucknow", '7898456532');


-- insert
INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');




INSERT INTO category VALUES( 1,"BOOKS");
INSERT INTO category VALUES(2,"GAMES");
INSERT INTO category VALUES(3,"GROCERIES");
INSERT INTO category VALUES (4,"ELECTRONICS");
INSERT INTO category VALUES(5,"CLOTHES");


-- insert
INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);



-- insert
INSERT INTO supplier_pricing VALUES(1,1,2,1500);
INSERT INTO supplier_pricing VALUES(2,3,5,30000);
INSERT INTO supplier_pricing VALUES(3,5,1,3000);
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);




-- insert
INSERT INTO orderr VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO orderr VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO orderr VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO orderr VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO orderr VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO orderr VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO orderr VALUES(107,789,"2021-09-01",3,7);
INSERT INTO orderr VALUES(108,780,"2021-09-07",5,6);
INSERT INTO orderr VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO orderr VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO orderr VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO orderr VALUES(112,789,"2021-09-16",4,7);
INSERT INTO orderr VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO orderr VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO orderr VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO orderr VALUES(116,99,"2021-09-17",2,14);



-- insert
INSERT INTO rating VALUES(1,101,4);
INSERT INTO rating VALUES(2,102,3);
INSERT INTO rating VALUES(3,103,1);
INSERT INTO rating VALUES(4,104,2);
INSERT INTO rating VALUES(5,105,4);
INSERT INTO rating VALUES(6,106,3);
INSERT INTO rating VALUES(7,107,4);
INSERT INTO rating VALUES(8,108,4);
INSERT INTO rating VALUES(9,109,3);
INSERT INTO rating VALUES(10,110,5);
INSERT INTO rating VALUES(11,111,3);
INSERT INTO rating VALUES(12,112,4);
INSERT INTO rating VALUES(13,113,2);
INSERT INTO rating VALUES(14,114,1);
INSERT INTO rating VALUES(15,115,1);
INSERT INTO rating VALUES(16,116,0);


-- fetch 
SELECT * FROM customer WHERE CUS_GENDER = 'F';
SELECT * FROM customer WHERE CUS_NAME = "NEHA";


SELECT CUS_GENDER, COUNT(DISTINCT CUS_ID) AS Total_Customers
FROM customer
JOIN `order` ON customer.CUS_ID = `order`.CUS_ID
WHERE ORD_AMOUNT >= 3000
GROUP BY CUS_GENDER;


SELECT `order`.ORD_ID, product.PRO_NAME
FROM `order`
JOIN supplier_pricing ON `order`.PRICING_ID = supplier_pricing.PRICING_ID
JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID
WHERE `order`.CUS_ID = 2;


SELECT supplier.SUPP_ID, supplier.SUPP_NAME
FROM supplier
JOIN supplier_pricing ON supplier.SUPP_ID = supplier_pricing.SUPP_ID
GROUP BY supplier.SUPP_ID, supplier.SUPP_NAME
HAVING COUNT(DISTINCT supplier_pricing.PRO_ID) > 1;


SELECT category.CAT_ID, category.CAT_NAME, product.PRO_NAME, supplier_pricing.SUPP_PRICE
FROM category
JOIN product ON category.CAT_ID = product.CAT_ID
JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
WHERE supplier_pricing.SUPP_PRICE = (
    SELECT MIN(SUPP_PRICE)
    FROM supplier_pricing
    WHERE supplier_pricing.PRO_ID = product.PRO_ID
)
GROUP BY category.CAT_ID, category.CAT_NAME;


SELECT product.PRO_ID, product.PRO_NAME
FROM `order`
JOIN supplier_pricing ON `order`.PRICING_ID = supplier_pricing.PRICING_ID
JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID
WHERE `order`.ORD_DATE > '2021-10-05';


SELECT CUS_NAME, CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';


DELIMITER //

CREATE PROCEDURE GetSupplierDetails()
BEGIN
    SELECT supplier.SUPP_ID, supplier.SUPP_NAME, rating.RAT_RATSTARS,
    CASE
        WHEN rating.RAT_RATSTARS = 5 THEN 'Excellent Service'
        WHEN rating.RAT_RATSTARS > 4 THEN 'Good Service'
        WHEN rating.RAT_RATSTARS > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
    FROM supplier
    JOIN supplier_pricing ON supplier.SUPP_ID = supplier_pricing.SUPP_ID
    JOIN rating ON supplier_pricing.PRICING_ID = rating.ORD_ID;
END//


DELIMITER ;




