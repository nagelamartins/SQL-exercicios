/*
Objetivo da Semana 6:
- Revisar fundamentos. 

Data: 29/07/2025
*/

-- 1. Conte quantos álbuns existem no total.
SELECT count(titulo) AS total_albuns FROM albuns;

-- 2. Liste o ano mais antigo e o mais recente dos álbuns.
SELECT max(ano) AS mais_recente, min(ano) AS mais_antigo FROM albuns;

-- 3. Liste os anos e a quantidade de álbuns lançados em cada ano.
SELECT ano AS lançamento, count(ano) AS qtdd_albuns FROM albuns
GROUP BY ano
ORDER BY qtdd_albuns desc;

-- 4. Liste os anos que tiveram mais de 1 álbum lançado.
SELECT ano AS lançamento, count(ano) AS qtdd_albuns FROM albuns
GROUP BY ano
HAVING qtdd_albuns > 1;

-- 5. Liste os anos com mais de 2 álbuns lançados e cujo ano seja posterior a 1990.
SELECT ano AS lançamento, count(ano) AS qtdd_albuns FROM albuns
GROUP BY ano
HAVING qtdd_albuns > 2 AND ano > 1990;

-- 6. Liste os títulos dos álbuns que tenham exatamente 3 palavras.
SELECT titulo FROM albuns
WHERE (length(titulo) - length(replace(titulo, ' ', ''))) = 2;

-- 7. Liste o nome de todas as bandas ordenadas por ordem crescente do ano de formação.
SELECT nome, ano FROM bandas
ORDER BY ano; 

-- 8. Mostre o título e o ano dos álbuns lançados antes de 2000.
SELECT titulo, ano FROM albuns
WHERE ano < 2000;

-- 9. Liste o nome das bandas brasileiras que fazem parte do banco de dados.
SELECT nome FROM bandas
WHERE nacionalidade = 'Brasil';

-- 10. Mostre o título dos álbuns cujo nome começa com a letra "S".
SELECT titulo FROM albuns
WHERE lower(titulo) LIKE 's%';
