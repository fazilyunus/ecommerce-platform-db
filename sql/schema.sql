-- Create roles table
CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INT REFERENCES roles(role_id)
);

-- Create categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- Create products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    category_id INT REFERENCES categories(category_id),
    stock INT DEFAULT 0
);

-- Create tags table
CREATE TABLE tags (
    tag_id SERIAL PRIMARY KEY,
    tag_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create product_tags table (many-to-many relationship)
CREATE TABLE product_tags (
    product_id INT REFERENCES products(product_id),
    tag_id INT REFERENCES tags(tag_id),
    PRIMARY KEY (product_id, tag_id)
);

-- Create reviews table
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    user_id INT REFERENCES users(user_id),
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMERIC(10, 2) NOT NULL
);

-- Create order_items table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

-- Create inventory table
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create transactions table
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount NUMERIC(10, 2) NOT NULL
);
