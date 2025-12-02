-- 01_inserts_ong.sql
-- Insere dados de exemplo em todas as tabelas principais

USE ong_solidaria;

-- VOLUNTÁRIOS
INSERT INTO voluntario (nome, email, telefone, data_nascimento) VALUES
('Ana Souza',   'ana@exemplo.org',   '11999990001', '2000-03-10'),
('Bruno Lima',  'bruno@exemplo.org', '11999990002', '1998-07-21'),
('Carla Mendes','carla@exemplo.org', '11999990003', '1995-11-05');

-- DOADORES
INSERT INTO doador (nome, email, telefone) VALUES
('João Pedro',      'joao@exemplo.org',    '11988880001'),
('Mariana Alves',   'mariana@exemplo.org', '11988880002'),
('Carlos Ferreira', 'carlos@exemplo.org',  '11988880003');

-- CAMPANHAS
INSERT INTO campanha (titulo, descricao, data_inicio, data_fim) VALUES
('Educação Digital', 'Aulas de tecnologia para jovens da comunidade.', '2025-01-10', '2025-03-30'),
('Horta Comunitária', 'Criação de horta para segurança alimentar.',     '2025-02-01', '2025-06-30'),
('Inverno Solidário', 'Arrecadação de agasalhos para famílias.',       '2025-05-01', '2025-07-31');

-- PROJETOS SOCIAIS
INSERT INTO projeto_social (nome, descricao, publico_alvo) VALUES
('Educação Digital',  'Formação em tecnologia e cidadania digital.',  'Adolescentes'),
('Horta Comunitária', 'Produção de alimentos saudáveis locais.',      'Famílias da comunidade'),
('Inverno Solidário', 'Apoio com roupas e cobertores no inverno.',    'Pessoas em situação de vulnerabilidade');

-- BENEFICIÁRIOS (usam id_projeto 1..3, que acabamos de criar)
INSERT INTO beneficiario (nome, data_nascimento, id_projeto) VALUES
('Lucas Andrade',   '2010-04-15', 1),
('Jéssica Souza',   '2011-09-20', 1),
('Família Santos',  '1985-01-01', 2),
('Carlos Almeida',  '1990-12-05', 3);

-- RELAÇÃO VOLUNTÁRIO x PROJETO
INSERT INTO voluntario_projeto (id_voluntario, id_projeto, data_inicio) VALUES
(1, 1, '2025-01-10'), -- Ana no projeto Educação Digital
(2, 2, '2025-02-15'), -- Bruno na Horta Comunitária
(3, 1, '2025-01-20'); -- Carla também em Educação Digital

-- DOAÇÕES (sempre usando id_doador 1..3 e id_campanha 1..3 já existentes)
INSERT INTO doacao (valor, data_doacao, id_doador, id_campanha) VALUES
(100.00, '2025-01-15', 1, 1), -- João -> Educação Digital
(250.00, '2025-02-10', 2, 2), -- Mariana -> Horta
(150.00, '2025-03-05', 3, 1), -- Carlos -> Educação Digital
(300.00, '2025-06-01', 1, 3); -- João -> Inverno Solidário
