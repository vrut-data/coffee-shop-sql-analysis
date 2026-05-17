INSERT INTO stores (store_id, store_name, city, opened_date) VALUES
(1, 'Downtown', 'London', '2021-03-15'),
(2, 'Riverside', 'Manchester', '2022-06-10'),
(3, 'Station', 'Birmingham', '2020-11-01');

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Espresso', 'Coffee', 2.50),
(2, 'Latte', 'Coffee', 3.75),
(3, 'Cappuccino', 'Coffee', 3.50),
(4, 'Iced Coffee', 'Coffee', 3.25),
(5, 'Green Tea', 'Tea', 2.75),
(6, 'Croissant', 'Bakery', 2.95),
(7, 'Blueberry Muffin', 'Bakery', 3.10),
(8, 'Breakfast Sandwich', 'Food', 5.50);

INSERT INTO customers (customer_id, customer_name, signup_date, loyalty_member) VALUES
(1, 'Ava Patel', '2023-01-08', 1),
(2, 'Noah Smith', '2023-02-14', 0),
(3, 'Mia Johnson', '2023-03-21', 1),
(4, 'Leo Brown', '2023-04-02', 0),
(5, 'Sofia Garcia', '2023-05-18', 1),
(6, 'Ethan Wilson', '2023-07-11', 1),
(7, 'Lily Davis', '2023-09-05', 0),
(8, 'Oscar Taylor', '2023-11-19', 1);

INSERT INTO orders (order_id, customer_id, store_id, order_date, order_time) VALUES
(101, 1, 1, '2024-01-05', '08:15'),
(102, 2, 1, '2024-01-05', '09:30'),
(103, 3, 2, '2024-01-06', '12:45'),
(104, 4, 3, '2024-01-07', '17:20'),
(105, 5, 1, '2024-01-08', '08:05'),
(106, 6, 2, '2024-01-09', '10:10'),
(107, 1, 1, '2024-01-10', '14:35'),
(108, 7, 3, '2024-01-11', '08:50'),
(109, 8, 2, '2024-01-12', '11:25'),
(110, 3, 1, '2024-01-13', '16:40'),
(111, 5, 3, '2024-01-14', '09:05'),
(112, 6, 1, '2024-01-15', '13:15'),
(113, 2, 2, '2024-02-01', '08:35'),
(114, 4, 3, '2024-02-02', '18:10'),
(115, 8, 1, '2024-02-03', '07:55');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 101, 2, 1),
(2, 101, 6, 1),
(3, 102, 1, 2),
(4, 103, 8, 1),
(5, 103, 4, 1),
(6, 104, 5, 1),
(7, 104, 7, 1),
(8, 105, 2, 2),
(9, 105, 6, 2),
(10, 106, 3, 1),
(11, 106, 8, 1),
(12, 107, 4, 1),
(13, 107, 7, 1),
(14, 108, 1, 1),
(15, 108, 6, 1),
(16, 109, 2, 1),
(17, 109, 8, 1),
(18, 110, 3, 2),
(19, 111, 5, 2),
(20, 111, 7, 1),
(21, 112, 2, 1),
(22, 112, 6, 1),
(23, 113, 1, 1),
(24, 113, 8, 1),
(25, 114, 4, 2),
(26, 115, 2, 1),
(27, 115, 6, 1),
(28, 115, 7, 1);

