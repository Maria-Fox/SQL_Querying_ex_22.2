-- Comments in SQL Start with dash-dash --
INSERT INTO products (name, price, can_be_returned) VALUES 
  ('chair', 44.00, 'f'), 
  ('stool', 25.99, 't'), 
  ('table', 124.00, 'f');

SELECT * FROM products;

SELECT name FROM products;

SELECT name, price FROM products;

INSERT INTO products (name, price, can_be_returned) VALUES
  ('blush', 12.99, 'f');

SELECT name FROM products WHERE can_be_returned = 't';
SELECT name FROM products WHERE can_be_returned ILIKE 't';

SELECT name, price FROM products WHERE price < 44.00;

SELECT name FROM products WHERE price BETWEEN 22.50 AND 99.99;

UPDATE products SET price = price -20;

DELETE FROM products WHERE price < 25.00;

UPDATE products SET price = price + 20;

UPDATE SET can_be_returned = 't';

