/* ============================================================
1. CREATE DATABASE
============================================================ */

CREATE DATABASE ECommerceDB;
GO

USE ECommerceDB;
GO

/* ============================================================
2. CREATE CUSTOMERS TABLE
============================================================ */

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL
);
GO

/* ============================================================
3. CREATE ORDERS TABLE
============================================================ */

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT FK_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
GO

/* ============================================================
4. CREATE PRODUCTS TABLE
============================================================ */

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
GO

/* ============================================================
5. CREATE ORDER_ITEMS TABLE
============================================================ */

CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT PK_order_items PRIMARY KEY (order_id, product_id),
    CONSTRAINT FK_order_items_orders FOREIGN KEY (order_id) REFERENCES orders (order_id),
    CONSTRAINT FK_order_items_products FOREIGN KEY (product_id) REFERENCES products (product_id)
);
GO

/* ============================================================
6. INSERT 20 CUSTOMERS
============================================================ */

INSERT INTO
    customers (
        customer_id,
        customer_name,
        city,
        signup_date
    )
VALUES (
        1,
        'Ali Khan',
        'Karachi',
        '2024-01-15'
    ),
    (
        2,
        'Sara Ahmed',
        'Lahore',
        '2024-02-10'
    ),
    (
        3,
        'Usman Malik',
        'Islamabad',
        '2024-02-25'
    ),
    (
        4,
        'Ayesha Shah',
        'Karachi',
        '2024-03-05'
    ),
    (
        5,
        'Hamza Ali',
        'Lahore',
        '2024-03-18'
    ),
    (
        6,
        'Fatima Noor',
        'Islamabad',
        '2024-04-02'
    ),
    (
        7,
        'Bilal Hussain',
        'Rawalpindi',
        '2024-04-20'
    ),
    (
        8,
        'Hira Aslam',
        'Karachi',
        '2024-05-11'
    ),
    (
        9,
        'Ahmed Raza',
        'Multan',
        '2024-05-29'
    ),
    (
        10,
        'Mariam Iqbal',
        'Lahore',
        '2024-06-14'
    ),
    (
        11,
        'Zain Abbas',
        'Karachi',
        '2024-07-01'
    ),
    (
        12,
        'Sana Tariq',
        'Islamabad',
        '2024-07-19'
    ),
    (
        13,
        'Omar Farooq',
        'Faisalabad',
        '2024-08-03'
    ),
    (
        14,
        'Noor Fatima',
        'Karachi',
        '2024-08-22'
    ),
    (
        15,
        'Danish Ahmed',
        'Lahore',
        '2024-09-10'
    ),
    (
        16,
        'Iqra Javed',
        'Rawalpindi',
        '2024-09-28'
    ),
    (
        17,
        'Saad Yousuf',
        'Karachi',
        '2024-10-15'
    ),
    (
        18,
        'Mahnoor Khan',
        'Multan',
        '2024-11-02'
    ),
    (
        19,
        'Fahad Sheikh',
        'Islamabad',
        '2024-11-20'
    ),
    (
        20,
        'Laiba Hassan',
        'Lahore',
        '2024-12-05'
    );
GO

/* ============================================================
7. INSERT 20 PRODUCTS
============================================================ */

INSERT INTO
    products (
        product_id,
        product_name,
        category,
        price
    )
VALUES (
        1,
        'Laptop',
        'Electronics',
        120000.00
    ),
    (
        2,
        'Wireless Mouse',
        'Electronics',
        3500.00
    ),
    (
        3,
        'Keyboard',
        'Electronics',
        5000.00
    ),
    (
        4,
        'Monitor',
        'Electronics',
        45000.00
    ),
    (
        5,
        'Headphones',
        'Electronics',
        8500.00
    ),
    (
        6,
        'Smartphone',
        'Electronics',
        85000.00
    ),
    (
        7,
        'USB Cable',
        'Accessories',
        1200.00
    ),
    (
        8,
        'Power Bank',
        'Accessories',
        4500.00
    ),
    (
        9,
        'Backpack',
        'Accessories',
        6000.00
    ),
    (
        10,
        'Office Chair',
        'Furniture',
        28000.00
    ),
    (
        11,
        'Desk Lamp',
        'Furniture',
        4500.00
    ),
    (
        12,
        'Standing Desk',
        'Furniture',
        55000.00
    ),
    (
        13,
        'Notebook',
        'Stationery',
        800.00
    ),
    (
        14,
        'Pen Set',
        'Stationery',
        600.00
    ),
    (
        15,
        'Water Bottle',
        'Lifestyle',
        2500.00
    ),
    (
        16,
        'Coffee Mug',
        'Lifestyle',
        1800.00
    ),
    (
        17,
        'Smart Watch',
        'Electronics',
        32000.00
    ),
    (
        18,
        'Webcam',
        'Electronics',
        7500.00
    ),
    (
        19,
        'Phone Stand',
        'Accessories',
        2200.00
    ),
    (
        20,
        'External SSD',
        'Electronics',
        18000.00
    );
GO

/* ============================================================
8. INSERT 20 ORDERS
============================================================ */

INSERT INTO
    orders (
        order_id,
        customer_id,
        order_date,
        amount,
        status
    )
VALUES (
        101,
        1,
        '2025-01-05',
        123500.00,
        'Completed'
    ),
    (
        102,
        2,
        '2025-01-08',
        85000.00,
        'Completed'
    ),
    (
        103,
        3,
        '2025-01-12',
        45000.00,
        'Completed'
    ),
    (
        104,
        4,
        '2025-01-18',
        9500.00,
        'Pending'
    ),
    (
        105,
        5,
        '2025-01-22',
        34000.00,
        'Completed'
    ),
    (
        106,
        6,
        '2025-02-02',
        55000.00,
        'Completed'
    ),
    (
        107,
        7,
        '2025-02-07',
        12000.00,
        'Cancelled'
    ),
    (
        108,
        8,
        '2025-02-15',
        92000.00,
        'Completed'
    ),
    (
        109,
        9,
        '2025-02-21',
        8500.00,
        'Pending'
    ),
    (
        110,
        10,
        '2025-03-01',
        28000.00,
        'Completed'
    ),
    (
        111,
        11,
        '2025-03-05',
        37000.00,
        'Completed'
    ),
    (
        112,
        12,
        '2025-03-11',
        62000.00,
        'Completed'
    ),
    (
        113,
        13,
        '2025-03-18',
        20000.00,
        'Cancelled'
    ),
    (
        114,
        14,
        '2025-03-25',
        13500.00,
        'Completed'
    ),
    (
        115,
        15,
        '2025-04-02',
        120000.00,
        'Completed'
    ),
    (
        116,
        16,
        '2025-04-09',
        32500.00,
        'Pending'
    ),
    (
        117,
        17,
        '2025-04-15',
        18500.00,
        'Completed'
    ),
    (
        118,
        18,
        '2025-04-21',
        57000.00,
        'Completed'
    ),
    (
        119,
        19,
        '2025-05-03',
        45000.00,
        'Completed'
    ),
    (
        120,
        20,
        '2025-05-10',
        85000.00,
        'Completed'
    );
GO

/* ============================================================
9. INSERT 20 ORDER ITEMS
============================================================ */

INSERT INTO
    order_items (
        order_id,
        product_id,
        quantity
    )
VALUES (101, 1, 1),
    (102, 6, 1),
    (103, 4, 1),
    (104, 2, 1),
    (105, 10, 1),
    (106, 12, 1),
    (107, 9, 2),
    (108, 6, 1),
    (109, 5, 1),
    (110, 10, 1),
    (111, 17, 1),
    (112, 20, 1),
    (113, 8, 2),
    (114, 18, 1),
    (115, 1, 1),
    (116, 17, 1),
    (117, 20, 1),
    (118, 12, 1),
    (119, 4, 1),
    (120, 6, 1);
GO