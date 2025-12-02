DROP DATABASE IF EXISTS ong_solidaria;

CREATE DATABASE ong_solidaria
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE ong_solidaria;

DROP TABLE IF EXISTS voluntario;

CREATE TABLE voluntario (
  id_voluntario   INT AUTO_INCREMENT PRIMARY KEY,
  nome            VARCHAR(100) NOT NULL,
  email           VARCHAR(120) NOT NULL,
  telefone        VARCHAR(20),
  data_nascimento DATE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS doador;

CREATE TABLE doador (
  id_doador       INT AUTO_INCREMENT PRIMARY KEY,
  nome            VARCHAR(100) NOT NULL,
  email           VARCHAR(120) NOT NULL,
  telefone        VARCHAR(20)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS campanha;

CREATE TABLE campanha (
  id_campanha INT AUTO_INCREMENT PRIMARY KEY,
  titulo      VARCHAR(120) NOT NULL,
  descricao   TEXT,
  data_inicio DATE,
  data_fim    DATE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS projeto_social;

CREATE TABLE projeto_social (
  id_projeto   INT AUTO_INCREMENT PRIMARY KEY,
  nome         VARCHAR(120) NOT NULL,
  descricao    TEXT,
  publico_alvo VARCHAR(120)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS beneficiario;

CREATE TABLE beneficiario (
  id_beneficiario INT AUTO_INCREMENT PRIMARY KEY,
  nome            VARCHAR(120) NOT NULL,
  data_nascimento DATE,
  id_projeto      INT NOT NULL,
  CONSTRAINT fk_beneficiario_projeto
    FOREIGN KEY (id_projeto)
    REFERENCES projeto_social(id_projeto)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

DROP TABLE IF EXISTS voluntario_projeto;

CREATE TABLE voluntario_projeto (
  id_voluntario INT NOT NULL,
  id_projeto    INT NOT NULL,
  data_inicio   DATE,
  PRIMARY KEY (id_voluntario, id_projeto),
  CONSTRAINT fk_vp_voluntario
    FOREIGN KEY (id_voluntario)
    REFERENCES voluntario(id_voluntario)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_vp_projeto
    FOREIGN KEY (id_projeto)
    REFERENCES projeto_social(id_projeto)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS doacao;

CREATE TABLE doacao (
  id_doacao   INT AUTO_INCREMENT PRIMARY KEY,
  valor       DECIMAL(10,2) NOT NULL,
  data_doacao DATE NOT NULL,
  id_doador   INT NOT NULL,
  id_campanha INT NOT NULL,
  CONSTRAINT fk_doacao_doador
    FOREIGN KEY (id_doador)
    REFERENCES doador(id_doador)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_doacao_campanha
    FOREIGN KEY (id_campanha)
    REFERENCES campanha(id_campanha)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;
