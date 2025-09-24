/*
Objetivos da Semana 11:
- Praticar o uso de subqueries;
- Reforçar o uso de window functions;
- Revisar conceitos. 

Data: 23/09/2025
*/

-- 1. Encontre as bandas que têm pelo menos um integrante com um id menor que 10.
SELECT DISTINCT b.nome FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
WHERE i.id < 10;

-- 2. Liste todos os álbuns da banda The Doors e adicione uma coluna mostrando a média do ano de lançamento de todos os álbuns da banda.
SELECT a.titulo AS album, AVG(a.ano) OVER (PARTITION BY b.nome) AS media_lancamento
FROM albuns AS a 
JOIN bandas AS b 
ON a.banda_id = b.id 
WHERE b.nome = 'The Doors';

-- 3. Conte quantos álbuns existem para cada ano, mas apenas para os anos que têm mais de um álbum lançado.
SELECT ano, count(titulo) AS qttd_albuns FROM albuns
GROUP BY ano
HAVING count(titulo) > 1
ORDER BY ano;

-- 4. Exiba o nome da banda, o nome do integrante e o ano de nascimento de todos os integrantes de bandas fundadas entre 1960 e 1980.
SELECT b.nome AS banda, i.nome AS integrante, i.data_nascimento FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
WHERE b.ano BETWEEN 1960 AND 1980;

-- 5. Liste os nomes das bandas com mais de 3 álbuns, sem usar uma subquery na cláusula HAVING.
SELECT b.nome, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.nome
HAVING qtdd_albuns > 3;

-- 6. Para cada banda, mostre o nome do seu álbum mais antigo e do mais recente. Use ROW_NUMBER() para isso.
WITH rank_albuns AS (
	SELECT b.nome AS banda, a.titulo AS album, ROW_NUMBER () OVER (PARTITION BY b.nome ORDER BY a.ano) AS ordem_albuns FROM bandas AS b
	JOIN albuns AS a
	ON b.id = a.banda_id
)

SELECT banda, album, ordem_albuns FROM rank_albuns
WHERE ordem_albuns = 1
OR ordem_albuns = (
        SELECT MAX(ordem_albuns)
        FROM rank_albuns AS r
        WHERE r.banda = rank_albuns.banda
    );

-- 7. Encontre todos os álbuns que foram lançados no mesmo ano de nascimento de qualquer integrante da banda Black Sabbath.

-- 8. Liste as bandas de Rock que têm pelo menos um álbum cadastrado.

-- 9. Exclua todos os álbuns que têm a palavra "Live" no título.

-- 10. Atualize a nacionalidade da banda Audioslave para EUA/Inglaterra.
