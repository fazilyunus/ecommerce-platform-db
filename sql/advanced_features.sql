-- Full-text search implementation
ALTER TABLE products ADD COLUMN search_vector tsvector;

-- Create a Trigger to Update search_vector
CREATE FUNCTION update_search_vector() RETURNS trigger AS $$
BEGIN
    NEW.search_vector := to_tsvector('english', NEW.product_name || ' ' || COALESCE(NEW.description, ''));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER products_search_vector_update
BEFORE INSERT OR UPDATE ON products
FOR EACH ROW EXECUTE FUNCTION update_search_vector();

-- Update Existing Records
UPDATE products SET search_vector = to_tsvector('english', product_name || ' ' || COALESCE(description, ''));

-- Stored Procedures for Order Processing
-- Create Stored Procedure to Handle Order Processing

CREATE OR REPLACE FUNCTION process_order(user_id INT, product_id INT, quantity INT) RETURNS VOID AS $$
DECLARE
    product_price NUMERIC(10, 2);
    total_amount NUMERIC(10, 2);
BEGIN
    -- Get the product price
    SELECT price INTO product_price FROM products WHERE product_id = product_id;
    
    -- Calculate total amount
    total_amount := product_price * quantity;

    -- Insert into orders table
    INSERT INTO orders (user_id, total) VALUES (user_id, total_amount) RETURNING order_id INTO order_id;

    -- Insert into order_items table
    INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (order_id, product_id, quantity, product_price);

    -- Update inventory
    UPDATE inventory SET quantity = quantity - quantity WHERE product_id = product_id;

    -- Insert into transactions table
    INSERT INTO transactions (order_id, amount) VALUES (order_id, total_amount);
END;
$$ LANGUAGE plpgsql;

-- Triggers for Inventory Updates

CREATE FUNCTION update_inventory() RETURNS trigger AS $$
BEGIN
    UPDATE inventory
    SET quantity = quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER order_items_after_insert
AFTER INSERT ON order_items
FOR EACH ROW EXECUTE FUNCTION update_inventory();

--
