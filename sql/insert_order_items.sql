-- insert_order_items.sql
-- Inserir itens das encomendas

USE global_jerseys;

-- ============================================
-- INSERIR INSERIR ITENS DAS ENCOMENDAS
-- ============================================
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
