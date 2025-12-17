-- sample_data.sql
-- Dados de exemplo para as tabelas do global_jerseys

USE global_jerseys;

-- NOTE: Users já inseridos via insert_encourage_users.sql (36 users)

-- ============================================
-- INSERIR ENDEREÇOS
-- ============================================
INSERT INTO addresses (user_id, full_name, phone, company, address1, address2, city, postal_code, country, district, is_default, created_at) VALUES
(1, 'Carlos Gomes', '916789012', 'Tech Corp', 'Rua da Tecnologia 200', 'Bloco A', 'Braga', '4700-001', 'Portugal', 'Braga', 1, NOW()),
(2, 'Ana Ferreira', '917890123', 'Design Studio', 'Avenida Principal 300', 'Apt 5', 'Aveiro', '3800-001', 'Portugal', 'Aveiro', 1, NOW()),
(3, 'Bruno Costa', '918901234', 'Sport Company', 'Rua da Criatividade 400', 'Piso 1', 'Viseu', '3500-001', 'Portugal', 'Viseu', 1, NOW()),
(4, 'Rita Mendes', '919012345', 'Retail Store', 'Rua das Oportunidades 500', 'Loja 2', 'Funchal', '9000-001', 'Portugal', 'Madeira', 1, NOW()),
(5, 'Luis Martins', '921234567', 'Marketing Ltd', 'Avenida Comércio 600', 'Bloco B', 'Covilhã', '6200-001', 'Portugal', 'Castelo Branco', 1, NOW()),
(6, 'Sofia Rocha', '922345678', 'Fashion Boutique', 'Rua do Desporto 700', 'Piso 3', 'Guarda', '6300-001', 'Portugal', 'Guarda', 1, NOW()),
(7, 'Nuno Dias', '923456789', 'Fashion Retail', 'Rua da Moda 800', 'Apt 15', 'Guimarães', '4800-001', 'Portugal', 'Braga', 1, NOW()),
(8, 'Cristina Almeida', '924567890', 'Business Solutions', 'Avenida Liberdade 900', 'Apt 10', 'Barcelos', '4750-001', 'Portugal', 'Braga', 1, NOW()),
(9, 'Miguel Sousa Oliveira', '946789012', 'Tech Solutions', 'Rua dos Viajantes 1500', 'Loja 2', 'Torres Vedras', '2560-001', 'Portugal', 'Leiria', 1, NOW()),
(10, 'Patricia Gomes Ferreira', '947890123', 'Design Co', 'Rua Aventura 1600', 'Apt 20', 'Nazaré', '2450-001', 'Portugal', 'Leiria', 1, NOW());

-- ============================================
-- INSERIR ENCOMENDAS
-- ============================================
INSERT INTO orders (user_id, guest_email, guest_name, guest_phone, guest_address1, guest_address2, guest_city, guest_postal_code, guest_country, guest_district, payment_method, payment_ref, subtotal, shipping, total, created_at) VALUES
(1, 'carlos.gomes@email.com', 'Carlos Gomes', '916789012', 'Rua da Tecnologia 200', 'Bloco A', 'Braga', '4700-001', 'Portugal', 'Braga', 'MBWAY', 'REF111222', 75.50, 4.99, 80.49, DATE_SUB(NOW(), INTERVAL 5 DAY)),
(2, 'ana.ferreira@email.com', 'Ana Ferreira', '917890123', 'Avenida Principal 300', 'Apt 5', 'Aveiro', '3800-001', 'Portugal', 'Aveiro', 'MASTERCARD', 'CARD333444', 45.00, 4.99, 49.99, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(3, 'bruno.costa@email.com', 'Bruno Costa', '918901234', 'Rua da Criatividade 400', 'Piso 1', 'Viseu', '3500-001', 'Portugal', 'Viseu', 'VISA', 'VISA555666', 60.00, 4.99, 64.99, DATE_SUB(NOW(), INTERVAL 1 DAY)),
(4, 'rita.mendes@email.com', 'Rita Mendes', '919012345', 'Rua das Oportunidades 500', 'Loja 2', 'Funchal', '9000-001', 'Portugal', 'Madeira', 'MBWAY', 'REF777888', 100.00, 4.99, 104.99, NOW()),
(5, 'luis.martins@email.com', 'Luis Martins', '921234567', 'Avenida Comércio 600', 'Bloco B', 'Covilhã', '6200-001', 'Portugal', 'Castelo Branco', 'VISA', 'CARD999000', 55.00, 4.99, 59.99, NOW()),
(6, 'sofia.rocha@email.com', 'Sofia Rocha', '922345678', 'Rua do Desporto 700', 'Piso 3', 'Guarda', '6300-001', 'Portugal', 'Guarda', 'MBWAY', 'REF111333', 50.00, 4.99, 54.99, DATE_SUB(NOW(), INTERVAL 7 DAY)),
(7, 'nuno.dias@email.com', 'Nuno Dias', '923456789', 'Rua da Moda 800', 'Apt 15', 'Guimarães', '4800-001', 'Portugal', 'Braga', 'MASTERCARD', 'CARD444555', 70.00, 4.99, 74.99, NOW()),
(8, 'cristina.almeida@email.com', 'Cristina Almeida', '924567890', 'Avenida Liberdade 900', 'Apt 10', 'Barcelos', '4750-001', 'Portugal', 'Braga', 'MBWAY', 'REF222444', 65.00, 4.99, 69.99, DATE_SUB(NOW(), INTERVAL 6 DAY)),
(9, 'miguel.sousa@email.com', 'Miguel Sousa', '946789012', 'Rua dos Viajantes 1500', 'Loja 2', 'Torres Vedras', '2560-001', 'Portugal', 'Leiria', 'VISA', 'REF300001', 45.00, 4.99, 49.99, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(10, 'patricia.gomes@email.com', 'Patricia Gomes', '947890123', 'Rua Aventura 1600', 'Apt 20', 'Nazaré', '2450-001', 'Portugal', 'Leiria', 'MBWAY', 'REF300002', 70.00, 4.99, 74.99, DATE_SUB(NOW(), INTERVAL 1 DAY));

-- ============================================
-- INSERIR ITENS DAS ENCOMENDAS 37-46
-- ============================================
INSERT INTO order_items (order_id, product_id, name, league, size, price, qty, image) VALUES
-- Encomenda 37
(37, 'prod1', 'Camisola Benfica 25/26', 'Primeira Liga', 'M', 49.99, 2, 'benfica.jpg'),
(37, 'prod2', 'Camisola Porto 25/26', 'Primeira Liga', 'L', 49.99, 1, 'porto.jpg'),
-- Encomenda 38
(38, 'prod3', 'Camisola Sporting 25/26', 'Primeira Liga', 'S', 49.99, 1, 'sporting.jpg'),
(38, 'prod4', 'Camisola Braga 25/26', 'Primeira Liga', 'M', 49.99, 1, 'braga.jpg'),
-- Encomenda 39
(39, 'prod5', 'Camisola Barcelona 25/26', 'La Liga', 'L', 49.99, 2, 'barcelona.jpg'),
-- Encomenda 40
(40, 'prod6', 'Camisola Real Madrid 25/26', 'La Liga', 'XL', 49.99, 2, 'real_madrid.jpg'),
(40, 'prod7', 'Camisola Atletico Madrid 25/26', 'La Liga', 'M', 49.99, 1, 'atletico.jpg'),
-- Encomenda 41
(41, 'prod8', 'Camisola Manchester United 25/26', 'Premier League', 'L', 54.99, 1, 'manchester.jpg'),
-- Encomenda 42
(42, 'prod9', 'Camisola Liverpool 25/26', 'Premier League', 'M', 49.99, 1, 'liverpool.jpg'),
(42, 'prod10', 'Camisola Chelsea 25/26', 'Premier League', 'S', 49.99, 1, 'chelsea.jpg'),
-- Encomenda 43
(43, 'prod11', 'Camisola Bayern Munich 25/26', 'Bundesliga', 'M', 49.99, 2, 'bayern.jpg'),
-- Encomenda 44
(44, 'prod12', 'Camisola PSG 25/26', 'Ligue 1', 'L', 49.99, 1, 'psg.jpg'),
(44, 'prod13', 'Camisola Marseille 25/26', 'Ligue 1', 'M', 49.99, 1, 'marseille.jpg'),
-- Encomenda 45
(45, 'prod14', 'Camisola Roma 25/26', 'Serie A', 'M', 49.99, 1, 'roma.jpg'),
(45, 'prod15', 'Camisola Juventus 25/26', 'Serie A', 'L', 49.00, 1, 'juventus.jpg'),
-- Encomenda 46
(46, 'prod16', 'Camisola AC Milan 25/26', 'Serie A', 'L', 49.99, 1, 'ac_milan.jpg'),
(46 'prod17', 'Camisola Inter de Milao 25/26', 'Serie A', 'M', 49.99, 1, 'inter.jpg'),
(46, 'prod18', 'Camisola Napoli 25/26', 'Serie A', 'S', 49.99, 1, 'napoli.jpg');