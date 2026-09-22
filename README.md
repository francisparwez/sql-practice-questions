# 20 SQL Practice Questions

A beginner-to-intermediate **SQL Server / T-SQL practice database** designed to help develop practical SQL querying skills using a small relational e-commerce dataset.

The project contains customers, orders, products, and order items, with primary-key and foreign-key relationships between the tables.

---

## 📌 Project Overview

This project creates an **`ECommerceDB`** database in Microsoft SQL Server and populates it with realistic sample e-commerce data.

The database can be used to practice:

- SQL `SELECT` statements
- Filtering with `WHERE`
- Sorting with `ORDER BY`
- Aggregations with `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- `GROUP BY` and `HAVING`
- `INNER JOIN` and `LEFT JOIN`
- Subqueries
- Common Table Expressions (CTEs)
- `CASE` statements
- Date functions
- Window functions
- Ranking
- Customer and product analysis
- Business-oriented SQL questions

---

## 🗄️ Database

**Database Name:**

```text
ECommerceDB
```

**Database System:**

```text
Microsoft SQL Server
```

**Language:**

```text
T-SQL
```

---

## 🧱 Database Schema

The database contains four tables:

```text
customers
    │
    │ 1-to-many
    ▼
orders
    │
    │ 1-to-many
    ▼
order_items
    ▲
    │ many-to-one
    │
products
```

### Entity Relationship

```text
customers
-----------
customer_id (PK)
customer_name
city
signup_date
      │
      │
      │ customer_id
      ▼
orders
-----------
order_id (PK)
customer_id (FK)
order_date
amount
status
      │
      │
      │ order_id
      ▼
order_items
-----------
order_id (PK, FK)
product_id (PK, FK)
quantity
      │
      │ product_id
      ▼
products
-----------
product_id (PK)
product_name
category
price
```

---

# 📋 Tables

## 1. Customers

Stores information about customers registered on the e-commerce platform.

| Column          | Data Type    | Description                  |
| --------------- | ------------ | ---------------------------- |
| `customer_id`   | INT          | Unique customer identifier   |
| `customer_name` | VARCHAR(100) | Customer name                |
| `city`          | VARCHAR(50)  | Customer's city              |
| `signup_date`   | DATE         | Date the customer registered |

**Primary Key:** `customer_id`

**Records:** 20

---

## 2. Orders

Stores information about customer orders.

| Column        | Data Type     | Description                   |
| ------------- | ------------- | ----------------------------- |
| `order_id`    | INT           | Unique order identifier       |
| `customer_id` | INT           | Customer who placed the order |
| `order_date`  | DATE          | Date of the order             |
| `amount`      | DECIMAL(10,2) | Order amount                  |
| `status`      | VARCHAR(20)   | Order status                  |

Possible statuses in the dataset:

```text
Completed
Pending
Cancelled
```

**Primary Key:** `order_id`

**Foreign Key:** `customer_id → customers.customer_id`

**Records:** 20

---

## 3. Products

Stores the products available in the e-commerce system.

| Column         | Data Type     | Description               |
| -------------- | ------------- | ------------------------- |
| `product_id`   | INT           | Unique product identifier |
| `product_name` | VARCHAR(100)  | Product name              |
| `category`     | VARCHAR(50)   | Product category          |
| `price`        | DECIMAL(10,2) | Product price             |

Product categories include:

```text
Electronics
Accessories
Furniture
Stationery
Lifestyle
```

**Primary Key:** `product_id`

**Records:** 20

---

## 4. Order Items

Stores the products included in each order.

| Column       | Data Type | Description                   |
| ------------ | --------- | ----------------------------- |
| `order_id`   | INT       | Associated order              |
| `product_id` | INT       | Product included in the order |
| `quantity`   | INT       | Quantity purchased            |

The table uses a **composite primary key**:

```text
(order_id, product_id)
```

Foreign keys:

```text
order_id   → orders.order_id
product_id → products.product_id
```

**Records:** 20

---

# 🔗 Relationships

### Customers → Orders

One customer can place multiple orders.

```text
customers.customer_id
        ↓
orders.customer_id
```

Relationship:

```text
1 : Many
```

---

### Orders → Order Items

One order can contain one or more order items.

```text
orders.order_id
        ↓
order_items.order_id
```

Relationship:

```text
1 : Many
```

---

### Products → Order Items

One product can appear in multiple order items.

```text
products.product_id
        ↓
order_items.product_id
```

Relationship:

```text
1 : Many
```

---

# 📊 Dataset

The SQL script inserts:

| Table       | Records |
| ----------- | ------: |
| Customers   |      20 |
| Orders      |      20 |
| Products    |      20 |
| Order Items |      20 |
| **Total**   |  **80** |

The dataset contains customers from cities including:

- Karachi
- Lahore
- Islamabad
- Rawalpindi
- Multan
- Faisalabad

---

# 🛠️ SQL Script Structure

The SQL script is organized into the following stages:

### 1. Database Creation

Creates the `ECommerceDB` database.

### 2. Table Creation

Creates:

```text
customers
orders
products
order_items
```

### 3. Constraints

Defines:

- Primary keys
- Foreign keys
- Composite primary key on `order_items`
- `NOT NULL` constraints

### 4. Data Insertion

Inserts 20 records into each table.

The insertion order follows the foreign-key dependencies:

```text
customers
    ↓
orders

products
    ↓
order_items
```

This ensures that referenced records exist before inserting dependent records.

---

# 💻 Example Queries to Practice

After running the setup script, you can use the database to practice questions such as:

### Basic Queries

```sql
-- Display all customers
SELECT *
FROM customers;
```

```sql
-- Display products costing more than 10,000
SELECT *
FROM products
WHERE price > 10000;
```

---

### Aggregation

```sql
-- Find total order amount
SELECT SUM(amount) AS total_sales
FROM orders;
```

```sql
-- Find average order value
SELECT AVG(amount) AS average_order_value
FROM orders;
```

---

### GROUP BY

```sql
-- Count customers by city
SELECT
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city;
```

---

### JOIN

```sql
-- Display orders with customer names
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.amount,
    o.status
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;
```

---

### Multi-Table JOIN

```sql
-- Display order, customer and product information
SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    oi.quantity,
    p.price
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
INNER JOIN products AS p
    ON oi.product_id = p.product_id;
```

---

# 🎯 SQL Skills Practiced

This database is suitable for practicing the following SQL concepts:

### Beginner

- `SELECT`
- `WHERE`
- `ORDER BY`
- `TOP`
- `DISTINCT`
- `AND` / `OR`
- `IN`
- `BETWEEN`
- `LIKE`
- `IS NULL`

### Intermediate

- `COUNT`
- `SUM`
- `AVG`
- `MIN`
- `MAX`
- `GROUP BY`
- `HAVING`
- `INNER JOIN`
- `LEFT JOIN`
- Multiple-table joins
- `CASE`
- Date functions
- Subqueries

### Advanced

- CTEs
- Window functions
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`\_
