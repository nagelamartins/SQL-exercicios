/*
Objetivo da Semana 4:
- Continuar a prática dos diferentes tipos de JOIN.

Observação: foram adicionados novos álbuns sem bandas associadas a eles, bem como novos álbus para bandas já cadastradas, para facilitar a prática com JOINs.

Data: 15/07/2025
*/

-- 1. Simule um FULL OUTER JOIN entre as tabelas bandas e albuns, listando o nome da banda e o título do álbum.
SELECT * FROM bandas AS b
LEFT JOIN albuns AS a
ON b.id = a.banda_id
UNION
SELECT * FROM bandas AS b
RIGHT JOIN albuns AS a
ON b.id = a.banda_id;

-- 2. Liste todas as bandas que têm exatamente 2 álbuns cadastrados.
SELECT b.nome, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.nome
HAVING qtdd_albuns = 2; 

-- 3. Liste os títulos dos álbuns sem banda associada.
SELECT titulo FROM albuns
WHERE banda_id IS NULL;

-- 4. Mostre as bandas cujo nome tem mais de 15 caracteres e possuem pelo menos 1 álbum.
SELECT b.nome, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE length(nome) > 15
GROUP BY b.nome
HAVING qtdd_albuns >= 1;

-- 5. Liste o nome das bandas e seus álbuns cujo título tem entre 10 e 20 caracteres.
SELECT b.nome, a.titulo FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE length(a.titulo) between 10 and 20;

-- 6. Mostre os gêneros que aparecem em bandas com pelo menos 3 álbuns cadastrados.
SELECT b.genero, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.nome
HAVING qtdd_albuns >= 3;

-- 7. Encontre o nome e o ano do álbum mais recente entre os que não têm banda associada.
SELECT titulo, ano FROM albuns
WHERE banda_id IS NULL
ORDER BY ano desc
LIMIT 1;

-- 8. Liste o nome das bandas e a quantidade de álbuns, apenas para bandas brasileiras.
SELECT b.nome, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a 
ON b.id = a.banda_id
WHERE b.nacionalidade = 'Brasil'
GROUP BY b.nome;

-- 9. Liste as bandas que não têm nenhum álbum com título de mais de duas palavras.
-- Tive dificuldades em resolver. Ver as anotações da semana. 

-- 10. Liste a média de ano de lançamento dos álbuns de cada banda que tem mais de 1 álbum.
SELECT b.nome, avg(a.ano) AS media_lançamento, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.nome
HAVING qtdd_albuns > 1;
