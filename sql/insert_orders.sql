-- insert_orders.sql
-- Inserir encomendas para os utilizadores

USE global_jerseys;

-- ============================================
-- INSERIR ENCOMENDAS
-- ============================================
INSERT INTO orders (user_id, payment_method, payment_ref, subtotal, shipping, total, created_at) VALUES
(1, 'MBWAY', 'R111222', 99.98, 4.99, 104.97, DATE_SUB(NOW(), INTERVAL 10 DAY)),
(2, 'MASTERCARD', 'CARD333444', 54.99, 4.99, 104,97, DATE_SUB(NOW(), INTERVAL 8 DAY)),
(3, 'VISA', 'VISA555666', 99.98, 4.99, 99.99, DATE_SUB(NOW(), INTERVAL 6 DAY)),
(4, 'MBWAY', 'REF777888', 55.00, 4.99, 59.99, DATE_SUB(NOW(), INTERVAL 5 DAY)),
(5, 'VISA', 'CARD999000', 75.50, 4.99, 80.49, DATE_SUB(NOW(), INTERVAL 4 DAY)),
(6, 'MBWAY', 'REF111333', 45.00, 4.99, 49.99, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(7, 'MASTERCARD', 'CARD444555', 120.00, 4.99, 124.99, DATE_SUB(NOW(), INTERVAL 2 DAY)),
(8 'MBWAY', 'REF222444', 65.00, 4.99, 69.99, NOW()),
(9, 'VISA', 'REF300001', 85.00, 4.99, 89.99, NOW()),
(10, 'MBWAY', 'REF300002', 70.00, 4.99, 74.99, DATE_SUB(NOW(), INTERVAL 1 DAY)),
