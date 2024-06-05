-- Insert sample roles
INSERT INTO roles (role_name) VALUES ('admin'), ('customer');

-- Insert sample users
INSERT INTO users (username, email, password, role_id) VALUES 
('admin', 'admin@example.com', 'password', 1), 
('customer1', 'customer1@example.com', 'password', 2);

-- Insert sample categories
INSERT INTO categories (category_name) VALUES ('Electronics'), ('Books'), ('Clothing');

-- Insert sample products
INSERT INTO products (product_name, description, price, category_id, stock) VALUES 
('Laptop', 'A high-performance laptop', 1000.00, 1, 10),
('Smartphone', 'A latest model smartphone', 700.00, 1, 20),
('Novel', 'A best-selling novel', 15.00, 2, 50);

-- Insert sample inventory
INSERT INTO inventory (product_id, quantity) VALUES 
(1, 10), 
(2, 20), 
(3, 50);

-- Insert sample orders
INSERT INTO orders (user_id, total) VALUES (2, 1015.00);

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES 
(1, 1, 1, 1000.00), 
(1, 3, 1, 15.00);

-- Insert sample reviews
INSERT INTO reviews (product_id, user_id, rating, comment) VALUES 
(1, 2, 5, 'Excellent laptop!'), 
(3, 2, 4, 'Good read.');

-- Insert sample transactions
INSERT INTO transactions (order_id, amount) VALUES (1, 1015.00);
