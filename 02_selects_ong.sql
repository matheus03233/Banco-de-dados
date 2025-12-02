-- 02_selects_ong.sql
-- Consultas de exemplo para o projeto ONG Solidária

USE ong_solidaria;

-- 1) Lista todos os doadores em ordem alfabética
SELECT
  id_doador,
  nome,
  email,
  telefone
FROM doador
ORDER BY nome ASC;

-- 2) Total de doações por campanha (incluindo campanhas sem doação)
SELECT
  c.id_campanha,
  c.titulo,
  IFNULL(SUM(d.valor), 0) AS total_arrecadado
FROM campanha c
LEFT JOIN doacao d ON d.id_campanha = c.id_campanha
GROUP BY c.id_campanha, c.titulo
ORDER BY total_arrecadado DESC;

-- 3) Beneficiários com o nome do projeto em que estão vinculados
SELECT
  b.id_beneficiario,
  b.nome        AS beneficiario,
  p.nome        AS projeto
FROM beneficiario b
JOIN projeto_social p ON p.id_projeto = b.id_projeto
ORDER BY p.nome, b.nome;

-- 4) Voluntários que participam do projeto "Educação Digital"
SELECT
  v.id_voluntario,
  v.nome,
  v.email,
  vp.data_inicio,
  p.nome AS projeto
FROM voluntario v
JOIN voluntario_projeto vp ON vp.id_voluntario = v.id_voluntario
JOIN projeto_social p      ON p.id_projeto     = vp.id_projeto
WHERE p.nome = 'Educação Digital'
ORDER BY v.nome;

-- 5) As 3 maiores doações realizadas (JOIN com doador e campanha)
SELECT
  d.id_doacao,
  d.valor,
  d.data_doacao,
  doador.nome    AS nome_doador,
  c.titulo       AS campanha
FROM doacao d
JOIN doador   ON doador.id_doador   = d.id_doador
JOIN campanha c ON c.id_campanha    = d.id_campanha
ORDER BY d.valor DESC
LIMIT 3;
