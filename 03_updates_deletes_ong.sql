-- 03_updates_deletes_ong.sql
-- Atualizações e exclusões controladas no banco

USE ong_solidaria;

-- =========================
-- UPDATES
-- =========================

-- 1) Atualizar telefone de um doador
UPDATE doador
SET telefone = '11977770001'
WHERE id_doador = 1;

-- 2) Prolongar a data de fim da campanha "Inverno Solidário"
UPDATE campanha
SET data_fim = '2025-08-31'
WHERE titulo = 'Inverno Solidário';

-- 3) Corrigir nome de beneficiário
UPDATE beneficiario
SET nome = 'Família Santos Silva'
WHERE nome = 'Família Santos';

-- =========================
-- DELETES
-- =========================

-- 1) Apagar uma doação específica (por ID)
DELETE FROM doacao
WHERE id_doacao = 4;

-- 2) Remover a participação de um voluntário em um projeto (tabela de ligação)
DELETE FROM voluntario_projeto
WHERE id_voluntario = 3
  AND id_projeto    = 1;

-- 3) Remover um beneficiário específico
DELETE FROM beneficiario
WHERE id_beneficiario = 4;
