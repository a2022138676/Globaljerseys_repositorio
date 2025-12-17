-- insert_addresses.sql
-- Inserir endereços reais sem valores NULL para todos os utilizadores

USE global_jerseys;

-- ============================================
-- INSERIR ENDEREÇOS REAIS PARA TODOS OS UTILIZADORES
-- ============================================
INSERT INTO addresses (user_id, full_name, phone, company, address1, address2, city, postal_code, country, district, is_default, created_at) VALUES
-- Utilizadores 1-10
(1, 'Carlos Gomes', '910123456', 'IST - Instituto Superior Técnico', 'Rua da Inovação 15', 'Apt 101', 'Lisboa', '1000-100', 'Portugal', 'Lisboa', 1, NOW()),
(2, 'João Paulo Santos', '911234567', 'FEUP - Faculdade de Engenharia', 'Avenida da República 234', 'Bloco A', 'Porto', '4000-200', 'Portugal', 'Porto', 1, NOW()),
(3, 'Ana Cristina Lopes', '912345678', 'Universidade da Beira Interior', 'Rua das Artes 567', 'Loja 3', 'Covilhã', '6200-300', 'Portugal', 'Castelo Branco', 1, NOW()),
(4, 'João Manuel Silva', '913456789', 'Universidade do Minho', 'Rua da Publicidade 89', 'Piso 2', 'Braga', '4700-400', 'Portugal', 'Braga', 1, NOW()),
(5, 'Maria da Conceição Santos', '914567890', 'Universidade do Porto', 'Avenida da Economia 123', 'Apt 45', 'Porto', '4100-500', 'Portugal', 'Porto', 1, NOW()),
(6, 'Pedro Neves Oliveira', '915678901', 'Universidade de Coimbra', 'Rua do Desporto 456', 'Bloco B', 'Coimbra', '3000-600', 'Portugal', 'Covilhã', 1, NOW()),
(7, 'Roberto Gonçalves Silva', '916789012', 'Universidade de Aveiro', 'Rua Nova 789', 'Apt 12', 'Viseu', '3500-700', 'Portugal', 'Viseu', 1, NOW()),
(8, 'Mariana Filipa Costa', '917890123', 'Universidade da Beira Interior', 'Rua do Teste 321', 'Loja 1', 'Guarda', '6300-800', 'Portugal', 'Guarda', 1, NOW()),
(9, 'Filipa Martins Ferreira', '918901234', 'UTAD - Universidade de Trás-os-Montes', 'Rua Final 654', 'Apt 99', 'Aveiro', '3800-900', 'Portugal', 'Aveiro', 1, NOW()),
(10, 'Gonçalo Fernando Pires', '919012345', 'Universidade Católica Portuguesa', 'Rua Última 987', 'Bloco C', 'Barcelos', '4750-100', 'Portugal', 'Braga', 1, NOW()),
-- Utilizadores 11-18 (existentes)
(11, 'Susana Helena Gomes', '920123456', 'Hospital de Setúbal', 'Rua Teste 111', 'Apt 201', 'Setubal', '2900-200', 'Portugal', 'Setubal', 1, NOW()),
(12, 'Carla Joana Mendes', '921234567', 'Centro de Saúde de Évora', 'Rua Sucesso 222', 'Loja 2', 'Evora', '7000-300', 'Portugal', 'Evora', 1, NOW()),
(13, 'Tiago Ricardo Fernandes', '922345678', 'Camara Municipal de Almada', 'Rua João 333', 'Apt 30', 'Almada', '2800-400', 'Portugal', 'Setubal', 1, NOW()),
(14, 'Vera Lúcia Rodrigues', '923456789', 'Junta de Freguesia da Caparica', 'Rua Maria 444', 'Bloco D', 'Caparica', '2825-500', 'Portugal', 'Setubal', 1, NOW()),
(15, 'Bruno Neves Martins', '924567890', 'Camara Municipal do Barreiro', 'Rua Pedro 555', 'Apt 15', 'Barreiro', '2700-600', 'Portugal', 'Setubal', 1, NOW()),
(16, 'Catarina Paula Coelho', '925678901', 'Centro de Saúde de Leiria', 'Rua Ana 666', 'Loja 4', 'Leiria', '2400-700', 'Portugal', 'Leiria', 1, NOW()),
(17, 'Duarte Vieira Alves', '926789012', 'Camara Municipal de Pombal', 'Rua Novo 777', 'Apt 50', 'Pombal', '3400-800', 'Portugal', 'Leiria', 1, NOW()),
(18, 'Matilde Assunção Sousa', '927890123', 'Centro de Saúde Caldas da Rainha', 'Rua Teste Joao 888', 'Bloco E', 'Caldas da Rainha', '2500-900', 'Portugal', 'Leiria', 1, NOW()),
-- Utilizadores 27-36 (dos ficheiros anteriores)

(27, 'Gonçalo Pereira Silva', '936789012', 'Universidade de Aveiro', 'Rua Ultimo 999', 'Apt 12', 'Guarda', '6300-001', 'Portugal', 'Guarda', 1, NOW()),
(28, 'Joana Filipa Correia', '937890123', 'Instituto Politécnico da Covilhã', 'Rua Final 101', 'Loja 1', 'Covilha', '6200-002', 'Portugal', 'Castelo Branco', 1, NOW()),
(29, 'Ricardo Afonso Pinto', '938901234', 'Camara Municipal de Viseu', 'Rua Completo 202', 'Apt 5', 'Viseu', '3500-003', 'Portugal', 'Viseu', 1, NOW()),
(30, 'Mafalda Cristina Nunes', '939012345', 'Centro de Saúde Aveiro', 'Rua Novo Final 303', 'Bloco F', 'Aveiro', '3800-004', 'Portugal', 'Aveiro', 1, NOW()),
(31, 'Alejandro Miguel Dias', '940123456', 'Junta de Freguesia de Ovar', 'Rua Sucesso Final 404', 'Apt 25', 'Ovar', '3880-005', 'Portugal', 'Aveiro', 1, NOW()),
(32, 'Fernanda Cristina Oliveira', '941234567', 'Camara Municipal de Ilhavo', 'Rua Ultimo Sucesso 505', 'Loja 3', 'Ilhavo', '3830-006', 'Portugal', 'Aveiro', 1, NOW()),
(33, 'Lourenço Miguel Tavares', '942345678', 'Camara Municipal Figueira Foz', 'Rua Final Teste 606', 'Apt 40', 'Figueira da Foz', '3080-007', 'Portugal', 'Covilha', 1, NOW()),
(34, 'Filipa Joana Gomes', '943456789', 'Instituto Politécnico Leiria', 'Rua Novo Sucesso 707', 'Bloco G', 'Batalha', '2440-008', 'Portugal', 'Leiria', 1, NOW()),
(35, 'Marcelo Jorge Santos', '944567890', 'Centro de Saúde Batalha', 'Rua Teste Ultimo 808', 'Apt 60', 'Nazaré', '2450-009', 'Portugal', 'Leiria', 1, NOW()),
(36, 'Rosário Elisa Costa', '945678901', 'Camara Municipal de Peniche', 'Rua Sucesso Novo 909', 'Loja 5', 'Peniche', '2520-010', 'Portugal', 'Leiria', 1, NOW());