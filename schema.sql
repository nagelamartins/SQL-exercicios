-- Cria e usa o Banco de Dados "musica"
CREATE DATABASE musica; 
USE musica;

-- Cria a tabela "bandas"
CREATE TABLE bandas (
  id INT AUTO_INCREMENT NOT NULL,
  nome VARCHAR(100) UNIQUE,
  genero VARCHAR(100),
  ano YEAR,
  nacionalidade VARCHAR(100),
  PRIMARY KEY (id)
);

-- Cria a tabela "albuns"
CREATE TABLE albuns (
  id INT AUTO_INCREMENT NOT NULL,
  titulo VARCHAR(100),
  ano YEAR,
  banda_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (banda_id) REFERENCES bandas(id)
);
