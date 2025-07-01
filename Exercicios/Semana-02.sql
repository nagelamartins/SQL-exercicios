/* 
Objetivos da Semana 2:
- Praticar `JOIN` entre tabelas relacionadas.
- Utilizar funções agregadas como `COUNT()`, `AVG()`, `MIN()`, `MAX()`.
- Trabalhar com `GROUP BY` e `ORDER BY`.
- Aplicar comandos `DDL` como `ALTER TABLE`.
- Reforçar boas práticas ao manipular dados com segurança.

Data: 01/07/2025
*/

-- 1. Liste o nome da banda e o título de cada álbum.
SELECT b.nome, a.titulo FROM bandas AS b
JOIN albuns AS a
WHERE b.id = a.banda_id;

-- 2. Liste apenas os álbuns da banda "Linkin Park" com título e ano.
SELECT a.titulo, a.ano FROM albuns as a
WHERE banda_id = (SELECT id FROM bandas WHERE nome = 'Linkin Park');

-- 3. Liste todas as bandas e quantos álbuns cada uma possui.
SELECT b.nome, count(a.titulo) AS qtdd_albuns
FROM bandas AS B
JOIN albuns AS a
WHERE b.id = a.banda_id
GROUP BY b.nome; 

-- 4. Quais são os 5 gêneros com mais bandas cadastradas?
SELECT genero, count(nome) FROM bandas
GROUP BY genero
ORDER BY count(nome) desc
LIMIT 5;

-- 5. Mostre a média de ano de fundação das bandas brasileiras.
SELECT avg(ano) FROM bandas
WHERE nacionalidade = 'Brasil';

-- 6. Quais são os álbuns mais antigos e mais recentes do banco de dados?
SELECT ano, titulo FROM albuns
WHERE ano = (SELECT max(ano) FROM albuns) or 
ano = (SELECT min(ano) FROM albuns);

-- 7. Liste as bandas que não possuem nenhum álbum cadastrado.
SELECT b.nome, a.titulo from bandas as b
LEFT JOIN albuns AS a
ON b.id = a.banda_id
WHERE a.id IS NULL;

-- 8. Adicione uma nova coluna chamada site_oficial na tabela bandas, do tipo VARCHAR(150).
alter table bandas
add column site_oficial VARCHAR(150);

-- 9. Atualize o site da banda "Linkin Park" para 'https://www.linkinpark.com'.
UPDATE bandas
SET site_oficial = 'https://www.linkinpark.com'
WHERE nome = 'Linkin Park';

-- 10. Exclua a banda fictícia "The Galactic Cats" e seus álbuns associados.
DELETE FROM albuns
WHERE banda_id = (SELECT id FROM bandas WHERE nome = 'The Galactic Cats');
DELETE FROM bandas
WHERE nome = 'The Galactic Cats';
