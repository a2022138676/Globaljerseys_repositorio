-- seed_FINAL_OK.sql
-- Executar depois do schema_clean.sql
USE global_jerseys;

SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM addresses;
DELETE FROM encourage_users;
SET FOREIGN_KEY_CHECKS = 1;

-- insert_encourage_users.sql
-- Inserir utilizadores na tabela encourage_users

USE global_jerseys;
INSERT INTO encourage_users (first_name, last_name, email, password_hash, created_at) VALUES
('Afonso', 'Carvalho', 'afonso.carvalho@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Joao', 'Santos', 'joao.santos@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Ana', 'Lopes', 'ana.lopes@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Joao', 'Silva', 'joao.silva@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Maria', 'Santos', 'maria.santos@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Pedro', 'Oliveira', 'pedro.oliveira@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Rui', 'Pinto', 'rui.pinto@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Joana', 'Luz', 'joana.luz@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Miguel', 'Santos', 'miguel.santos@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Paulina', 'Carvalho', 'paulina.carvalho@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Vitor', 'Sousa', 'vitor.sousa@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Camila', 'Oliveira', 'camila.oliveira@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Ricardo', 'Barbosa', 'ricardo.barbosa@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Vanessa', 'Teixeira', 'vanessa.teixeira@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Fernando', 'Lopes', 'fernando.lopes@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Daniela', 'Neves', 'daniela.neves@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Goncalo', 'Pereira', 'goncalo.pereira@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Joana', 'Correia', 'joana.correia@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Ricardo', 'Pinto', 'ricardo.pinto@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Mafalda', 'Nunes', 'mafalda.nunes@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Alejandro', 'Dias', 'alejandro.dias@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Fernanda', 'Oliveira', 'fernanda.oliveira@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Lourenco', 'Tavares', 'lourenco.tavares@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Filipa', 'Gomes', 'filipa.gomes@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Marcelo', 'Santos', 'marcelo.santos@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Rosario', 'Costa', 'rosario.costa@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Carlos', 'Gomes', 'carlos.gomes@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Ana', 'Ferreira', 'ana.ferreira@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Bruno', 'Costa', 'bruno.costa@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Rita', 'Mendes', 'rita.mendes@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Luis', 'Martins', 'luis.martins@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Sofia', 'Rocha', 'sofia.rocha@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Nuno', 'Dias', 'nuno.dias@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Cristina', 'Almeida', 'cristina.almeida@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Miguel', 'Sousa', 'miguel.sousa@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW()),
('Patricia', 'Gomes', 'patricia.gomes@email.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86.sNuWQe1u', NOW());

-- insert_addresses.sql
-- Inserir endereços reais sem valores NULL para todos os utilizadores

USE global_jerseys;
INSERT INTO addresses (user_id, full_name, phone, address1, address2, city, postal_code, country, district, is_default, created_at) VALUES
-- Utilizadores 1-10
(1, 'Carlos Gomes', '910123456', 'Rua da Inovação 15', 'Apt 101', 'Lisboa', '1000-100', 'Portugal', 'Lisboa', 1, NOW()),
(2, 'João Paulo Santos', '911234567', 'Avenida da República 234', 'Bloco A', 'Porto', '4000-200', 'Portugal', 'Porto', 1, NOW()),
(3, 'Ana Cristina Lopes', '912345678', 'Rua das Artes 567', 'Loja 3', 'Covilhã', '6200-300', 'Portugal', 'Castelo Branco', 1, NOW()),
(4, 'João Manuel Silva', '913456789', 'Rua da Publicidade 89', 'Piso 2', 'Braga', '4700-400', 'Portugal', 'Braga', 1, NOW()),
(5, 'Maria da Conceição Santos', '914567890', 'Avenida da Economia 123', 'Apt 45', 'Porto', '4100-500', 'Portugal', 'Porto', 1, NOW()),
(6, 'Pedro Neves Oliveira', '915678901', 'Rua do Desporto 456', 'Bloco B', 'Coimbra', '3000-600', 'Portugal', 'Covilhã', 1, NOW()),
(7, 'Roberto Gonçalves Silva', '916789012', 'Rua Nova 789', 'Apt 12', 'Viseu', '3500-700', 'Portugal', 'Viseu', 1, NOW()),
(8, 'Mariana Filipa Costa', '917890123', 'Rua do Teste 321', 'Loja 1', 'Guarda', '6300-800', 'Portugal', 'Guarda', 1, NOW()),
(9, 'Filipa Martins Ferreira', '918901234', 'Rua Final 654', 'Apt 99', 'Aveiro', '3800-900', 'Portugal', 'Aveiro', 1, NOW()),
(10, 'Gonçalo Fernando Pires', '919012345', 'Rua Última 987', 'Bloco C', 'Barcelos', '4750-100', 'Portugal', 'Braga', 1, NOW()),
-- Utilizadores 11-18 (existentes)
(11, 'Susana Helena Gomes', '920123456', 'Rua Teste 111', 'Apt 201', 'Setubal', '2900-200', 'Portugal', 'Setubal', 1, NOW()),
(12, 'Carla Joana Mendes', '921234567', 'Rua Sucesso 222', 'Loja 2', 'Evora', '7000-300', 'Portugal', 'Evora', 1, NOW()),
(13, 'Tiago Ricardo Fernandes', '922345678', 'Rua João 333', 'Apt 30', 'Almada', '2800-400', 'Portugal', 'Setubal', 1, NOW()),
(14, 'Vera Lúcia Rodrigues', '923456789', 'Rua Maria 444', 'Bloco D', 'Caparica', '2825-500', 'Portugal', 'Setubal', 1, NOW()),
(15, 'Bruno Neves Martins', '924567890', 'Rua Pedro 555', 'Apt 15', 'Barreiro', '2700-600', 'Portugal', 'Setubal', 1, NOW()),
(16, 'Catarina Paula Coelho', '925678901', 'Rua Ana 666', 'Loja 4', 'Leiria', '2400-700', 'Portugal', 'Leiria', 1, NOW()),
(17, 'Duarte Vieira Alves', '926789012', 'Rua Novo 777', 'Apt 50', 'Pombal', '3400-800', 'Portugal', 'Leiria', 1, NOW()),
(18, 'Matilde Assunção Sousa', '927890123', 'Rua Teste Joao 888', 'Bloco E', 'Caldas da Rainha', '2500-900', 'Portugal', 'Leiria', 1, NOW()),
-- Utilizadores 27-36
(27, 'Gonçalo Pereira Silva', '936789012', 'Rua Ultimo 999', 'Apt 12', 'Guarda', '6300-001', 'Portugal', 'Guarda', 1, NOW()),
(28, 'Joana Filipa Correia', '937890123', 'Rua Final 101', 'Loja 1', 'Covilha', '6200-002', 'Portugal', 'Castelo Branco', 1, NOW()),
(29, 'Ricardo Afonso Pinto', '938901234', 'Rua Completo 202', 'Apt 5', 'Viseu', '3500-003', 'Portugal', 'Viseu', 1, NOW()),
(30, 'Mafalda Cristina Nunes', '939012345', 'Rua Novo Final 303', 'Bloco F', 'Aveiro', '3800-004', 'Portugal', 'Aveiro', 1, NOW()),
(31, 'Alejandro Miguel Dias', '940123456', 'Rua Sucesso Final 404', 'Apt 25', 'Ovar', '3880-005', 'Portugal', 'Aveiro', 1, NOW()),
(32, 'Fernanda Cristina Oliveira', '941234567', 'Rua Ultimo Sucesso 505', 'Loja 3', 'Ilhavo', '3830-006', 'Portugal', 'Aveiro', 1, NOW()),
(33, 'Lourenço Miguel Tavares', '942345678', 'Rua Final Teste 606', 'Apt 40', 'Figueira da Foz', '3080-007', 'Portugal', 'Covilha', 1, NOW()),
(34, 'Filipa Joana Gomes', '943456789', 'Rua Novo Sucesso 707', 'Bloco G', 'Batalha', '2440-008', 'Portugal', 'Leiria', 1, NOW()),
(35, 'Marcelo Jorge Santos', '944567890', 'Rua Teste Ultimo 808', 'Apt 60', 'Nazaré', '2450-009', 'Portugal', 'Leiria', 1, NOW()),
(36, 'Rosário Elisa Costa', '945678901', 'Rua Sucesso Novo 909', 'Loja 5', 'Peniche', '2520-010', 'Portugal', 'Leiria', 1, NOW());

-- insert_orders.sql
-- Inserir encomendas para os utilizadores

USE global_jerseys;
INSERT INTO orders (user_id, payment_method, payment_ref, subtotal, shipping, total, created_at) VALUES
(1, 'MBWAY', 'R111222', 99.98, 4.99, 104.97, DATE_SUB(NOW(), INTERVAL 10 DAY)),
(2, 'MASTERCARD', 'CARD333444', 54.99, 4.99, 59.98, DATE_SUB(NOW(), INTERVAL 8 DAY)),
(3, 'VISA', 'VISA555666', 99.98, 4.99, 104.97, DATE_SUB(NOW(), INTERVAL 6 DAY)),
(4, 'MBWAY', 'REF777888', 55.00, 4.99, 59.99, DATE_SUB(NOW(), INTERVAL 5 DAY)),
(5, 'VISA', 'CARD999000', 75.50, 4.99, 80.49, DATE_SUB(NOW(), INTERVAL 4 DAY)),
(6, 'MBWAY', 'REF111333', 45.00, 4.99, 49.99, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(7, 'MASTERCARD', 'CARD444555', 120.00, 4.99, 124.99, DATE_SUB(NOW(), INTERVAL 2 DAY)),
(8, 'MBWAY', 'REF222444', 65.00, 4.99, 69.99, NOW()),
(9, 'VISA', 'REF300001', 85.00, 4.99, 89.99, NOW()),
(10, 'MBWAY', 'REF300002', 70.00, 4.99, 74.99, DATE_SUB(NOW(), INTERVAL 1 DAY));

-- insert_order_items.sql
-- Inserir itens das encomendas

USE global_jerseys;
INSERT INTO order_items (order_id, product_id, name, league, size, price, qty, image) VALUES
-- Encomenda 37 - Serie A
(1, 'prod17', 'Camisola Roma 25/26', 'Serie A', 'L', 49.99, 2, 'roma.jpg'),
(1, 'prod18', 'Camisola Juventus 25/26', 'Serie A', 'M', 49.99, 1, 'juventus.jpg'),
-- Encomenda 38 - Premier League
(2, 'prod19', 'Camisola Manchester United 25/26','Premier League', 'M', 54.99, 1, 'manunited.jpg'),
-- Encomenda 39 - LaLiga
(3, 'prod21', 'Camisola Barcelona 25/26', 'La Liga', 'L', 49.99, 2, 'barcelona.jpg'),
(3, 'prod22', 'Camisola Real Madrid 25/26', 'La Liga', 'M', 49.99, 1, 'real_madrid.jpg'),
-- Encomenda 40 - Bundesliga
(4, 'prod23', 'Camisola Bayern Munich 25/26', 'Bundesliga', 'M', 49.99, 1, 'bayern_munique.jpg'),
(4, 'prod24', 'Camisola Borussia Dortmund 25/26', 'Bundesliga', 'S', 49.99, 1, 'borussia_dortmund.jpg'),
-- Encomenda 41 - Ligue 1
(5, 'prod25', 'Camisola PSG 25/26', 'Ligue 1', 'M', 49.99, 2, 'psg.jpg'),
(5, 'prod26', 'Camisola Olympique Marseille 25/26', 'Ligue 1', 'L', 49.99, 1, 'marseille.jpg'),
-- Encomenda 42 - Serie A
(6, 'prod27', 'Camisola Napoli 25/26', 'Serie A', 'S', 49.99, 1, 'napoli.jpg'),
(6, 'prod28', 'Camisola Inter 25/26', 'Serie A', 'M', 49.99, 1, 'inter.jpg'),
-- Encomenda 43 - Premier League
(7, 'prod29', 'Camisola Manchester City 25/26', 'Premier League', 'L', 54.99, 2, 'manchester_city.jpg'),
(7, 'prod30', 'Camisola Arsenal 25/26', 'Premier League', 'M', 44.99, 1, 'arsenal.jpg'),
-- Encomenda 44 - LaLiga
(8, 'prod31', 'Camisola Atletico Madrid 25/26', 'La Liga', 'M', 49.99, 1, 'atletico_madrid.jpg'),
(8, 'prod32', 'Camisola Sevilla 25/26', 'La Liga', 'L', 49.99, 1, 'sevilla.jpg'),
-- Encomenda 45 - Bundesliga
(9, 'prod33', 'Camisola RB Leipzig 25/26', 'Bundesliga', 'M', 49.50, 2, 'rb_leipzig.jpg'),
(9, 'prod34', 'Camisola Bayer Leverkusen 25/26', 'Bundesliga', 'S', 49.99, 1, 'bayer_leverkusen.jpg'),
-- Encomenda 46 - Ligue 1
(10, 'prod35', 'Camisola AS Monaco 25/26', 'Ligue 1', 'M', 49.99, 1, 'monaco.jpg'),
(10, 'prod36', 'Camisola Lyon 25/26', 'Ligue 1', 'L', 49.99, 1, 'lyon.jpg');
