/*
Objetivo da Semana 7:
- Praticar DDL: criar, alterar e adicionar colunas em tabelas;
- Praticar DML: inserir, atualizar e excluir dados. 

Data: 17/08/2025
*/

-- 1. Crie uma nova tabela chamada integrantes com os campos "nome", "instrumento", "membro atual (Sim ou Não)".
CREATE TABLE integrantes
(id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
banda_id INT,
instrumento VARCHAR(30),
membro_atual ENUM ('S', 'N'),
PRIMARY KEY (id),
FOREIGN KEY (banda_id) REFERENCES bandas(id) 
);

-- 2. Atualize a coluna site da tabela bandas inserindo ou corrigindo o endereço dos sites oficiais de pelo menos 3 bandas.
UPDATE bandas SET site_oficial = CASE 
WHEN nome = 'Black Sabbath' THEN 'https://www.blacksabbath.com/'
WHEN nome = 'Depeche Mode' THEN 'https://www.depechemode.com/'
WHEN nome = 'The Beatles' THEN 'https://www.thebeatles.com/'
END
WHERE nome IN ('Black Sabbath', 'Depeche Mode', 'The Beatles');

-- 3. Insira pelo menos 3 registros na tabela integrantes, cada um associado a uma banda diferente.
INSERT INTO integrantes(id, nome, banda_id, instrumento, membro_atual) VALUES 
(default, 'Emily Armstrong', (SELECT id FROM bandas WHERE nome = 'Linkin Park'), 'vocal', 'S'),
(default, 'Mike Shinoda', (SELECT id FROM bandas WHERE nome = 'Linkin Park'), 'vocal', 'S'),
(default, 'Brad Delson', (SELECT id FROM bandas WHERE nome = 'Linkin Park'), 'guitarra', 'S'),
(default, 'David "Phoenix" Farrell', (SELECT id FROM bandas WHERE nome = 'Linkin Park'), 'baixo', 'S'),
(default, 'Joe Hahn', (SELECT id FROM bandas WHERE nome = 'Linkin Park'), 'DJ', 'S'),
(default, 'Colin Brittain', (SELECT id FROM bandas WHERE nome = 'Linkin Park'), 'bateria', 'S'),
(default, 'Chester Bennington', (SELECT id FROM bandas WHERE nome = 'Linkin Park'), 'vocal', 'N'),
(default, 'Rob Bourdon', (SELECT id FROM bandas WHERE nome = 'Linkin Park'), 'bateria', 'N'),
(default, 'Ozzy Osbourne', (SELECT id FROM bandas WHERE nome = 'Black Sabbath'), 'vocal', 'N'),
(default, 'Tony Iommi', (SELECT id FROM bandas WHERE nome = 'Black Sabbath'), 'guitarra', 'N'),
(default, 'Geezer Butler', (SELECT id FROM bandas WHERE nome = 'Black Sabbath'), 'baixo', 'N'),
(default, 'Bill Ward', (SELECT id FROM bandas WHERE nome = 'Black Sabbath'), 'bateria', 'N'),
(default, 'Ronnie James Dio', (SELECT id FROM bandas WHERE nome = 'Black Sabbath'), 'vocal', 'N'),
(default, 'Jim Morrison', (SELECT id FROM bandas WHERE nome = 'The Doors'), 'vocal', 'N'),
(default, 'Robby Krieger', (SELECT id FROM bandas WHERE nome = 'The Doors'), 'guitarra', 'N'),
(default, 'Ray Manzarek', (SELECT id FROM bandas WHERE nome = 'The Doors'), 'teclado', 'N'),
(default, 'John Densmore', (SELECT id FROM bandas WHERE nome = 'The Doors'), 'bateria', 'N'),
(default, 'Dave Gahan', (SELECT id FROM bandas WHERE nome = 'Depeche Mode'), 'vocal', 'S'),
(default, 'Martin Gore', (SELECT id FROM bandas WHERE nome = 'Depeche Mode'), 'teclado', 'S'),
(default, 'Andrew Eldritch', (SELECT id FROM bandas WHERE nome = 'The Sisters of Mercy'), 'vocal', 'S'),
(default, 'Kai', (SELECT id FROM bandas WHERE nome = 'The Sisters of Mercy'), 'guitarra', 'S'), 
(default, 'Patricia Morrison', (SELECT id FROM bandas WHERE nome = 'The Sisters of Mercy'), 'baixo', 'N');

-- 4. Atualize um integrante da tabela integrantes, alterando o instrumento tocado.
UPDATE integrantes
SET instrumento = 'mixer'
WHERE nome = 'Joe Hahn';

-- 5. Exclua 1 integrante da tabela integrantes.
DELETE FROM integrantes
WHERE nome = 'Kai'
LIMIT 1;

-- 6. Liste todos os integrantes e suas respectivas bandas.
SELECT i.nome AS integrante, b.nome AS banda FROM integrantes AS i
JOIN bandas AS b
ON i.banda_id = b.id;

-- 7. Insira uma nova banda completa em bandas.
INSERT INTO bandas(id, nome, genero, ano, nacionalidade, site_oficial) VALUES
(default, 'U2', 'Rock', 1976, 'Irlanda', 'https://www.u2.com/');

-- 8. Altere a tabela integrantes para incluir uma nova coluna chamada data_nascimento, do tipo DATE.
ALTER TABLE integrantes 
ADD COLUMN data_nascimento DATE;

-- 9. Insira a data de nascimento dos integrantes. 
UPDATE integrantes
SET data_nascimento = CASE
WHEN nome = 'Emily Armstrong' THEN '1986-09-09'
WHEN nome = 'Mike Shinoda' THEN '1977-02-11'
WHEN nome = 'Brad Delson' THEN '1977-12-01'
WHEN nome = 'David "Phoenix" Farrell' THEN '1977-02-08'
WHEN nome = 'Joe Hahn' THEN '1977-03-15'
WHEN nome = 'Colin Brittain' THEN '1986-03-19'
WHEN nome = 'Chester Bennington' THEN '1976-03-20'
WHEN nome = 'Rob Bourdon' THEN '1979-01-20'
WHEN nome = 'Ozzy Osbourne' THEN '1948-12-03'
WHEN nome = 'Tony Iommi' THEN '1948-02-19'
WHEN nome = 'Geezer Butler' THEN '1949-07-19'
WHEN nome = 'Bill Ward' THEN '1948-05-05'
WHEN nome = 'Ronnie James Dio' THEN '1942-07-10'
WHEN nome = 'Jim Morrison' THEN '1943-12-08'
WHEN nome = 'Robby Krieger' THEN '1946-01-08'
WHEN nome = 'Ray Manzarek' THEN '1939-02-12'
WHEN nome = 'John Densmore' THEN '1944-12-01'
WHEN nome = 'Dave Gahan' THEN '1962-05-09'
WHEN nome = 'Martin Gore' THEN '1961-07-23'
WHEN nome = 'Andrew Eldritch' THEN '1959-05-15'
WHEN nome = 'Patricia Morrison' THEN '1962-01-14'
END
WHERE nome IN ('Emily Armstrong', 'Mike Shinoda', 'Brad Delson', 'David "Phoenix" Farrell', 'Joe Hahn', 'Colin Brittain', 
  'Chester Bennington', 'Rob Bourdon', 'Ozzy Osbourne', 'Tony Iommi', 'Geezer Butler', 'Bill Ward', 'Ronnie James Dio', 
  'Jim Morrison', 'Robby Krieger', 'Ray Manzarek', 'John Densmore', 'Dave Gahan', 'Martin Gore', 'Andrew Eldritch', 'Patricia Morrison');
