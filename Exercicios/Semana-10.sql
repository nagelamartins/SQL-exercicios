/*
Objetivos da Semana 10:
- Praticar o uso de subqueries aninhadas;
- Inserir o uso de funções de janela

Data: 06/06/2025
*/

-- 1. Mostre o nome da banda, o título do álbum e o ano de formação, para todas as bandas que lançaram álbuns após o ano 2000.
SELECT b.nome AS banda, b.ano AS ano_formacao, a.titulo AS titulo_album, a.ano AS ano_lancamento 
FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE a.ano > 2000;

-- 2. Encontre as bandas que têm mais álbuns do que a média de álbuns por banda.
WITH albuns_por_banda AS (
  SELECT b.nome AS nome_banda, COUNT(a.titulo) AS quantidade_albuns
  FROM bandas AS b
  JOIN albuns AS a 
  ON b.id = a.banda_id
  GROUP BY b.nome
)

SELECT nome_banda, quantidade_albuns FROM albuns_por_banda
WHERE quantidade_albuns > (SELECT AVG(quantidade_albuns) FROM albuns_por_banda);

-- 3. Liste o nome dos integrantes que nasceram antes do ano de fundação de sua respectiva banda.
SELECT b.ano AS fundacao_banda, i.nome AS integrante, YEAR(i.data_nascimento) AS ano_nascimento 
FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
WHERE YEAR(i.data_nascimento) < b.ano;

-- 4. Exiba o nome da banda, o título do álbum e a posição do álbum em relação à data de lançamento (1 para o mais antigo, 2 para o segundo mais antigo, etc.), agrupado por banda.
SELECT b.nome AS banda, a.titulo AS album, ROW_NUMBER() OVER (PARTITION BY b.nome ORDER BY a.ano) AS posicao_lancamento
FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id;

-- 5. Conte quantos integrantes cada instrumento possui e liste apenas os instrumentos que têm mais de 2 integrantes.
SELECT instrumento, count(instrumento) AS qtdd_integrantes FROM integrantes
GROUP BY instrumento
HAVING qtdd_integrantes > 2;

-- 6. Liste os álbuns que têm o mesmo ano de lançamento de pelo menos um álbum da banda "Black Sabbath".
SELECT titulo, ano FROM albuns
WHERE ano IN (
  SELECT ano
  FROM albuns
  WHERE banda_id = (SELECT id FROM bandas WHERE nome = 'Black Sabbath')
);

-- 7. Encontre os nomes das bandas que têm pelo menos um integrante cujo nome contém a letra 'o' e um álbum com o ano de lançamento entre 1990 e 2000.
SELECT DISTINCT b.nome FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
JOIN albuns AS a
ON i.banda_id = a.banda_id
WHERE i.nome LIKE '%o%' AND a.ano BETWEEN 1990 AND 2000;

-- 8. Exclua todos os álbuns da banda The Beatles.
DELETE FROM albuns
WHERE banda_id = (SELECT id FROM bandas WHERE nome = 'The Beatles');

-- 9. Atualize o gênero da banda Ramones para 'Punk'.
UPDATE bandas
SET genero = 'Punk'
WHERE nome = 'Ramones';

-- 10. Liste a quantidade de álbuns de cada nacionalidade, incluindo aquelas que não têm nenhum álbum associado.
SELECT b.nacionalidade, count(a.titulo) AS qtdd_albuns FROM bandas AS b
LEFT JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.nacionalidade;
