/*
Objetivo da Semana 7:
- Praticar conhecimentos em JOIN;
- Aprimorar o uso de subqueries e funções de agregação;
- Trabalhar com a nova tabela integrantes para extrair informações.

Data: 23/08/2025
*/

-- 1. Liste o nome das bandas e o nome de todos os seus integrantes. Inclua as bandas que não têm nenhum integrante cadastrado.
SELECT b.nome AS banda, i.nome AS integrante FROM bandas AS b
LEFT JOIN integrantes AS i
ON b.id = i.banda_id;

-- 2. Mostre o nome dos integrantes que nasceram antes de 1970.
SELECT nome, data_nascimento FROM integrantes
WHERE data_nascimento < '1970-01-01';

-- 3. Conte quantos integrantes cada banda possui. Inclua apenas as bandas que têm pelo menos 2 integrantes.
SELECT b.nome AS banda, count(i.nome) AS qtd_integrantes FROM bandas AS B
JOIN integrantes AS i
ON b.id = i.banda_id
GROUP BY b.nome 
HAVING qtd_integrantes >= 2;

-- 4. Liste o nome dos integrantes que são membros S (atuais) e o nome da banda a que pertencem.
SELECT i.nome AS integrante, b.nome AS banda FROM integrantes AS i
JOIN bandas AS b
ON i.banda_id = b.id
WHERE upper(membro_atual) = 's';

-- 5. Encontre as bandas que têm integrantes cujos nomes começam com a letra 'J'.
SELECT DISTINCT b.nome FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
WHERE i.nome LIKE 'J%';

-- 6. Mostre o nome da banda e o número total de álbuns, apenas para as bandas de rock (Rock).
SELECT b.nome AS banda, count(a.titulo) AS qtd_albuns, b.genero FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.nome
HAVING b.genero = 'Rock';

-- 7. Liste o nome dos integrantes e o ano de formação de sua respectiva banda.
SELECT i.nome, b.ano AS ano_formacao FROM integrantes AS i
JOIN bandas AS b
ON i.banda_id = b.id;

-- 8. Encontre as bandas que têm álbuns e que têm integrantes cadastrados, usando um INNER JOIN entre as três tabelas (bandas, albuns e integrantes).
SELECT b.nome AS banda, a.titulo AS titulo_album, i.nome AS integrante FROM bandas AS b
INNER JOIN albuns AS a
ON b.id = a.banda_id
INNER JOIN integrantes AS i
ON i.banda_id = a.banda_id;

-- 9. Liste os integrantes que pertencem a bandas que lançaram álbuns antes de 1980.
SELECT DISTINCT i.nome AS integrante FROM integrantes AS i
INNER JOIN albuns AS a
ON i.banda_id = a.banda_id
INNER JOIN bandas AS b
ON a.banda_id = b.id
WHERE a.ano < 1980;

-- 10. Insira 3 novos álbuns para a banda U2 na tabela albuns.
INSERT INTO albuns(id, titulo, ano, banda_id) VALUES
(default, 'Boy', 1980, (SELECT id FROM bandas WHERE nome = 'U2')), 
(default, 'October', 1981, (SELECT id FROM bandas WHERE nome = 'U2')), 
(default, 'War', 1983, (SELECT id FROM bandas WHERE nome = 'U2'));
