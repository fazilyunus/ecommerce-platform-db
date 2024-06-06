# E-commerce Platform Database

This project is a comprehensive database for an e-commerce platform. It includes features like user authentication, product catalog, order management, and transaction processing.

## Features

- User authentication and roles (admin, customer)
- Product catalog with categories, tags, and reviews
- Order processing and management
- Inventory management
- Transaction history and analytics

## Files

- `sql/schema.sql`: Database schema
- `sql/data_population.sql`: Sample data
- `sql/advanced_features.sql`: Advanced features
- `sql/queries_reports.sql`: Queries and reports
- `scripts/backup.sh`: Backup script

## ER Diagram Description

### Users and Roles

- **Users** to **Roles**:
  - The `role_id` column in the `Users` table is a foreign key pointing to the `role_id` column in the `Roles` table.
  - Relationship: Many users can have one role.


### Products and Categories

- **Products** to **Categories**:
- The `category_id` column in the `Products` table is a foreign key pointing to the `category_id` column in the `Categories` table.
- Relationship: Many products can belong to one category.


### Products and Tags

- **Products** to **Tags** via **Product Tags**:
- The `product_id` column in the `Product Tags` table is a foreign key pointing to the `product_id` column in the `Products` table.
- The `tag_id` column in the `Product Tags` table is a foreign key pointing to the `tag_id` column in the `Tags` table.
- Relationship: Many-to-Many relationship managed through the `Product Tags` table.


### Reviews and Products

- **Reviews** to **Products**:
- The `product_id` column in the `Reviews` table is a foreign key pointing to the `product_id` column in the `Products` table.
- Relationship: Many reviews can be written for one product.


### Reviews and Users

- **Reviews** to **Users**:
- The `user_id` column in the `Reviews` table is a foreign key pointing to the `user_id` column in the `Users` table.
- Relationship: Many reviews can be written by one user.


### Orders and Users

- **Orders** to **Users**:
- The `user_id` column in the `Orders` table is a foreign key pointing to the `user_id` column in the `Users` table.
- Relationship: Many orders can be placed by one user.


### Order Items and Orders

- **Order Items** to **Orders**:
- The `order_id` column in the `Order Items` table is a foreign key pointing to the `order_id` column in the `Orders` table.
- Relationship: Many order items can be part of one order.


### Order Items and Products

- **Order Items** to **Products**:
- The `product_id` column in the `Order Items` table is a foreign key pointing to the `product_id` column in the `Products` table.
- Relationship: Many order items can reference one product.


### Inventory and Products

- **Inventory** to **Products**:
- The `product_id` column in the `Inventory` table is a foreign key pointing to the `product_id` column in the `Products` table.
- Relationship: Each inventory record references one product.



### Transactions and Orders

- **Transactions** to **Orders**:
- The `order_id` column in the `Transactions` table is a foreign key pointing to the `order_id` column in the `Orders` table.
- Relationship: Each transaction is associated with one order.


### Product Tags and Products

- **Product Tags** to **Products**:
- The `product_id` column in the `Product Tags` table is a foreign key pointing to the `product_id` column in the `Products` table.
- Relationship: Many-to-Many relationship between products and tags.


### Product Tags and Tags

- **Product Tags** to **Tags**:
- The `tag_id` column in the `Product Tags` table is a foreign key pointing to the `tag_id` column in the `Tags` table.
- Relationship: Many-to-Many relationship between products and tags.


