CREATE DATABASE musica; 

USE musica;

CREATE TABLE bandas (
  id INT AUTO_INCREMENT NOT NULL,
  nome VARCHAR(100) UNIQUE,
  genero VARCHAR(100),
  ano YEAR,
  nacionalidade VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE albuns (
  id INT AUTO_INCREMENT NOT NULL,
  titulo VARCHAR(100),
  ano YEAR,
  banda_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (banda_id) REFERENCES bandas(id)
);
