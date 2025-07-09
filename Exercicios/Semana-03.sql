/*
Objetivo da Semana 3:
- Praticar os diferentes tipos de JOIN.

Observação: foram adicionadas novas bandas sem álbuns associados a elas, para fins de prática com JOINs.

Data: 08/07/2025
*/

-- 1. Liste todas as bandas e seus respectivos álbuns.
SELECT b.nome, a.titulo FROM bandas AS b
INNER JOIN albuns AS a
ON b.id = a.banda_id;

-- 2. Liste todas as bandas, mesmo as que não têm nenhum álbum cadastrado.
SELECT b.nome, a.titulo FROM bandas AS b
LEFT JOIN albuns AS a
ON b.id = a.banda_id;

-- 3. Liste os nomes das bandas e o número total de álbuns que contêm mais de 20 caracteres no título.
SELECT b.nome, a.titulo, count(*) AS qtdd_albuns FROM bandas AS b
INNER JOIN albuns AS a
ON b.id = a.banda_id
WHERE length(a.titulo) > 20
GROUP BY b.nome;

-- 4. Simule um FULL OUTER JOIN entre bandas e álbuns.
SELECT b.nome, a.titulo FROM bandas AS b
LEFT JOIN albuns AS a 
ON b.id = a.banda_id
UNION
SELECT b.nome, a.titulo FROM bandas AS b
RIGHT JOIN albuns AS a 
ON b.id = a.banda_id;

-- 5. Liste os álbuns lançados após 2000, junto com o nome da banda correspondente.
SELECT a.titulo AS album, a.ano AS lançamento, b.nome AS banda FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE a.ano > 2000
ORDER BY a.ano;

-- 6. Liste os gêneros musicais únicos de bandas que possuem pelo menos 2 álbuns.
SELECT DISTINCT b.genero FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.id, b.genero
HAVING count(a.banda_id) >= 2;

-- 7. Mostre as bandas que têm álbuns com mais de uma palavra no título.
SELECT b.nome, a.titulo FROM bandas AS B
JOIN albuns AS a
ON b.id = a.banda_id
WHERE a.titulo LIKE '% %';

-- 8. Liste os nomes das bandas e seus álbuns que contêm a palavra "side" no título.
SELECT b.nome, a.titulo FROM bandas AS B
JOIN albuns AS a
ON b.id = a.banda_id
WHERE a.titulo LIKE '%side%';

-- 9. Mostre os nomes das bandas fundadas antes de 1980 que ainda têm álbuns cadastrados no banco.
SELECT DISTINCT b.nome FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE b.ano < 1980;

-- 10. Liste a quantidade total de álbuns por nacionalidade das bandas, incluindo aquelas sem nenhum álbum.
SELECT b.nacionalidade, count(a.titulo) AS qtdd_albuns FROM bandas AS B
LEFT JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.nacionalidade
ORDER BY qtdd_albuns;
