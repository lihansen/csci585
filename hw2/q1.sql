-- SQLite
-- Entities are based on E-R gram in HW1

CREATE TABLE sponsor (
  name VARCHAR(255),
  phone VARCHAR(20),
  address VARCHAR(255),
  amount_sponsored DECIMAL(10,2)
);


INSERT INTO sponsor (name, phone, address, amount_sponsored)
VALUES
  ('John Doe', '555-1234', '123 Main St, Anytown USA', 1000.00),
  ('Jane Smith', '555-5678', '456 Oak St, Anytown USA', 2500.00),
  ('Bob Johnson', '555-9012', '789 Elm St, Anytown USA', 500.00),
  ('Alice Brown', '555-3456', '321 Pine St, Anytown USA', 750.00),
  ('Charlie Lee', '555-7890', '654 Cedar St, Anytown USA', 2000.00);


SELECT name, phone, amount_sponsored
FROM sponsor
WHERE amount_sponsored = (
SELECT MAX(amount_sponsored)
FROM sponsor
);


-- DROP TABLE sponsor;
