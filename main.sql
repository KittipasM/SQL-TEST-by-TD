-- Create an answer table to hold the results.
CREATE TABLE answer (
  product_class_name TEXT,
  rank INTEGER,
  product_name TEXT,
  sales_value INTEGER
  )
-- Add the results from Class A to the answer table
INSERT INTO answer
SELECT product_class_name, DENSE_RANK() OVER (ORDER BY (retail_price*quantity) DESC) rank, product_name, (retail_price*quantity) as sales_value
FROM Product p
INNER JOIN ProductClass pc ON p.product_class_id = pc.product_class_id
INNER JOIN SalesTransaction st ON p.product_id = st.product_id
WHERE product_class_name = "Class A"
ORDER BY product_class_name, (retail_price*quantity) DESC, quantity
LIMIT 2
-- Add the results from Class B to the answer table
INSERT INTO answer
SELECT product_class_name, DENSE_RANK() OVER (ORDER BY (retail_price*quantity) DESC) rank, product_name, (retail_price*quantity) as sales_value
FROM Product p
INNER JOIN ProductClass pc ON p.product_class_id = pc.product_class_id
INNER JOIN SalesTransaction st ON p.product_id = st.product_id
WHERE product_class_name = "Class B"
ORDER BY product_class_name, (retail_price*quantity) DESC, quantity
LIMIT 2
-- Add the results from Class C to the answer table
INSERT INTO answer
SELECT product_class_name, DENSE_RANK() OVER (ORDER BY (retail_price*quantity) DESC) rank, product_name, (retail_price*quantity) as sales_value
FROM Product p
INNER JOIN ProductClass pc ON p.product_class_id = pc.product_class_id
INNER JOIN SalesTransaction st ON p.product_id = st.product_id
WHERE product_class_name = "Class C"
ORDER BY product_class_name, (retail_price*quantity) DESC, quantity
LIMIT 2
-- Show the Result
SELECT *
FROM answer
