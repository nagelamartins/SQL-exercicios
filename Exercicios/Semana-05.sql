/*
Objetivo da Semana 5:
- Praticar funções de String;
- Revisar fundamentos. 

Data: 22/07/2025
*/

-- 1. Liste os nomes das bandas em ordem alfabética decrescente.
SELECT nome FROM bandas
ORDER BY nome desc;

-- 2. Liste todos os álbuns com o ano de lançamento e o nome da banda correspondente. Ordene do álbum mais recente para o mais antigo.
SELECT a.titulo AS album, a.ano AS lancamento, b.nome AS banda FROM albuns AS a
JOIN bandas AS b
ON b.id = a.banda_id
ORDER BY a.ano desc;

-- 3. Mostre apenas os álbuns lançados após 2010 e que pertencem a bandas cadastradas.
SELECT a.titulo, b.nome FROM albuns AS a
JOIN bandas AS b
ON b.id = a.banda_id
WHERE a.ano > 2010;

-- 4. Liste quantos álbuns cada banda possui, mostrando o nome da banda e a quantidade de álbuns.
SELECT b.nome AS banda, count(a.titulo) AS qttd_albuns FROM bandas AS b
LEFT JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.nome;

-- 5. Mostre o título dos álbuns e a quantidade de caracteres que cada título possui.
SELECT titulo, length(titulo) AS qtdd_caracteres FROM albuns;

-- 6. Liste os títulos dos álbuns que têm mais de 2 palavras no título.
SELECT titulo FROM albuns
WHERE (length(titulo) - length(replace(titulo, ' ', ''))) >= 2;

-- 7. Mostre o título dos álbuns e a mesma string, mas toda em letras maiúsculas.
SELECT titulo, upper(titulo) AS maiusculo FROM albuns;

-- 8. Crie uma coluna calculada chamada titulo_editado que substitui a palavra "The" por "A" em todos os títulos de álbuns.
SELECT titulo, replace(titulo, 'The', 'A') AS titulo_editado FROM albuns;

-- 9. Liste os títulos dos álbuns e apenas as 5 primeiras letras de cada um.
SELECT titulo, substr(titulo, 1, 5) AS primeiras_letras FROM albuns; 

-- 10. Mostre os títulos dos álbuns que contêm a palavra “love”.
SELECT titulo FROM albuns
WHERE titulo LIKE '%love%';

-- BÔNUS: Liste os títulos dos álbuns que têm mais de 15 caracteres E pertencem a bandas cadastradas.
SELECT a.titulo FROM albuns AS a
JOIN bandas AS b
ON b.id = a.banda_id
WHERE length(titulo) > 15;
