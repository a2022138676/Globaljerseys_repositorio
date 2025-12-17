-- insert_encourage_users.sql
-- Inserir utilizadores na tabela encourage_users

USE global_jerseys;

-- ============================================
-- INSERIR UTILIZADORES
-- ============================================
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
