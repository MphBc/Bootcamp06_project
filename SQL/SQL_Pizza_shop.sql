-- Create table customers
CREATE TABLE dim_CUSTOMERS (
  CUSTOMER_ID INT PRIMARY KEY,
  CUSTOMER_NAME TEXT,
  GENDER TEXT,
  ADDRESS TEXT,
  STATE TEXT,
  CITY TEXT,
  COUNTRY TEXT,
  PHONE TEXT,
  EMAIL TEXT
);
-- Insert customers
INSERT INTO dim_CUSTOMERS VALUES
  (1, 'Frank Harris', 'Male',   '1600 Amphitheatre Parkway', 'CA', 'Mountain View',  'USA', '+1 (650) 253-0000', 'fharris@google.com'),
	(2, 'Jack Smith',   'Male',   '1 Microsoft Way',           'WA', 'Redmond',        'USA', '+1 (425) 882-8080', 'jacksmith@microsoft.com'),
  (3, 'Kathy Chase',  'Female', '801 W 4th Street',          'NV', 'Reno',           'USA', '+1 (775) 223-7665', 'kachase@hotmail.com'),
  (4, 'Julia Barnett','Female', '302 S 700 E',               'UT', 'Salt Lake City', 'USA', '+1 (801) 531-7272', 'jubarnett@gmail.com'),
  (5, 'Patrick Gray', 'Male',   '1033 N Park Ave',           'AZ', 'Tucson',         'USA', '+1 (520) 622-4200', 'patrick.gray@aol.com'),
	(6, 'Dan Miller',	  'Male',   '541 Del Medio Avenue',	     'CA', 'Mountain View',	 'USA',	'+1 (650) 644-3358', 'dmiller@comcast.com'),
	(7,	'John Gordon',	'Male',	  '69 Salem Street',	         'MA', 'Boston',	       'USA',	'+1 (617) 522-1333', 'johngordon22@yahoo.com');


-- Create table product
CREATE TABLE dim_PRODUCT (
		PRODUCT_ID INT PRIMARY KEY,
  	PRODUCT_NAME TEXT,
  	SIZE TEXT,
  	PRICE REAL
);
--Insert product
INSERT INTO dim_PRODUCT VALUES
	  (1, 'Island Deligtht', 'S', 195),
    (2, 'Island Deligtht', 'M', 350),
    (3, 'Island Deligtht', 'L', 485),
    (4, 'Seafood Supreme', 'S', 225),
    (5, 'Seafood Supreme', 'M', 395),
    (6, 'Seafood Supreme', 'L', 525),
    (7, 'Meat Supreme',    'S', 195),
    (8, 'Meat Supreme',    'M', 350),
    (9, 'Meat Supreme',    'L', 485),
    (10, 'Hawaiian',       'S', 195),
    (11, 'Hawaiian',       'M', 350),
    (12, 'Hawaiian',       'L', 485);


-- Create table service
CREATE TABLE dim_SERVICE (
		SERVICE_ID INT PRIMARY KEY,
  	SERVICE_TYPES TEXT,
  	HOW_TO_ORDER_ID INT,
  	FOREIGN KEY (HOW_TO_ORDER_ID) REFERENCES HOW_TO_ORDER(HOW_TO_ORDER_ID)
);
-- Insert service
INSERT INTO dim_SERVICE VALUES
		(1, 'Delivery', 1),
    (2, 'Delivery', 2),
    (3, 'Delivery', 3),
    (4, 'Pick up', ''),
    (5, 'Dine-in', '');


-- Create table how_to
CREATE TABLE dim_HOW_TO_ORDER (
		HOW_TO_ORDER_ID INT PRIMARY KEY,
  	HOW_TO_ORDER TEXT
);
-- Insert how_to
INSERT INTO dim_HOW_TO_ORDER VALUES
		(1, 'Application'),
    (2, 'Website'),
    (3, 'Phone');


-- Create table payment
CREATE TABLE dim_PAYMENT (
		PAYMENT_ID INT PRIMARY KEY,
  	PAYMENT_METHOD TEXT
);
-- Insert payment
INSERT INTO dim_PAYMENT VALUES
		(1, 'Cash'),
    (2, 'Moblie banking'),
    (3, 'Card'),
    (4, 'Cash on delivery'),
    (5, 'E-wallet');


-- Create table promotion
CREATE TABLE dim_PROMOTION (
		PROMOTION_ID INT PRIMARY KEY,
  	PROMOTION_TYPES TEXT
);
-- Insert promotion
INSERT INTO dim_PROMOTION VALUES
		(1, 'Flash Deal'),
    (2, 'Free delivery'),
    (3,	'Buy one get one'),
		(4,	'Price off'),
		(5,	'Redeem Your Point'),
		(6,	'Coupon'),
		(7,	'Cash back');

-- Create table order_pizza
CREATE TABLE fact_ORDER_PIZZA (
    ORDER_ID INT PRIMARY KEY,
    ORDER_DATE DATE,
    CUSTOMER_ID INT,
    PRODUCT_ID INT,
    SEVICE_ID INT,
    PAYMENT_ID INT,
    PROMOTION_ID INT,
		FOREIGN KEY (CUSTOMER_ID) REFERENCES dim_CUSTOMERS(CUSTOMER_ID),
		FOREIGN KEY (PRODUCT_ID) REFERENCES dim_PRODUCT(PRODUCT_ID),
		FOREIGN KEY (SEVICE_ID) REFERENCES dim_SERVICE(SEVICE_ID),
		FOREIGN KEY (PAYMENT_ID) REFERENCES dim_PAYMENT(PAYMENT_ID),
		FOREIGN KEY (PROMOTION_ID) REFERENCES dim_PROMOTION(PROMOTION_ID)
);
-- Insert order_pizza
INSERT INTO fact_ORDER_PIZZA VALUES
		(1,   '2022-05-01', 4, 2, 4, 1, 3),
		(2,   '2022-05-01', 4, 11, 4, 1, 3),
    (3,   '2022-05-01', 2, 6, 2, 2, 4),
    (4,   '2022-05-02', 1, 4, 5, 1, ''),
    (5,   '2022-05-03', 5, 3, 1, 4, 3),
    (6,   '2022-05-03', 5, 3, 1, 4, 3),
    (7,   '2022-05-03', 3, 10, 5, 2, ''),
    (8,   '2022-05-03', 3, 4, 5, 2, ''),
		(9,	  '2022-05-04', 7, 2,	4, 3,	3),
		(10,	'2022-05-04',	7, 2,	4, 3,	3),
		(11,	'2022-05-04',	7, 6,	4, 3,	3),
		(12,	'2022-05-04', 7, 6,	4, 3,	3),
		(13,	'2022-05-05',	6, 9,	5, 2,	''),
		(14,	'2022-05-05',	3, 10, 5,	2, ''),
		(15,	'2022-05-05',	4, 6,	3, 3,	7);


------- Analyze data --------
.mode table
.header on 
-- Report seller weekly  
SELECT 
	product_name AS ProductName,
  COUNT(product_name) AS COUNT_Piece,
  SUM(PRICE) AS Total
FROM fact_ORDER_PIZZA AS ORDER_PIZZA
JOIN dim_PRODUCT AS DP
	ON ORDER_PIZZA.product_id = DP.product_id
GROUP BY ProductName
ORDER BY SUM(PRICE) DESC;

 -- different pay
SELECT 
	PAYMENT_METHOD,
	COUNT(PAYMENT_METHOD) AS COUNT_PAY,
    SUM(price) AS Total,
    ROUND(AVG(price), 2) AS AVG_price
FROM fact_ORDER_PIZZA AS fop
JOIN dim_PAYMENT AS dpm
	ON dpm.payment_id = fop.payment_id
join dim_PRODUCT AS dpd
	on fop.product_id = dpd.product_id
GROUP BY payment_method
ORDER BY SUM(price) DESC;

-- count service
SELECT
	service_types,
    COALESCE(how_to_order, ' ') AS channel,
    COUNT(service_types) AS COUNT_SEVICE
FROM fact_ORDER_PIZZA AS fop
JOIN dim_SERVICE AS dsv
	on fop.SEVICE_ID = dsv.service_id
LEFT JOIN dim_HOW_TO_ORDER as hto
	on dsv.HOW_TO_ORDER_ID = hto.HOW_TO_ORDER_ID
GROUP BY service_types, how_to_order;

-- gender use promotion
-- subquery
SELECT 
  gender,
  promotion_types,
  COUNT(promotion_types) AS COUNT_PROMO
FROM ( 
  SELECT *
  FROM fact_ORDER_PIZZA AS fop
  JOIN dim_CUSTOMERS AS dcm
      on fop.CUSTOMER_ID = dcm.customer_id
  JOIN dim_PROMOTION AS dpm
      on fop.promotion_id = dpm.PROMOTION_ID
)
GROUP BY gender,promotion_types
ORDER BY 3 DESC;
