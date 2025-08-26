/*
Objetivo da Semana 9:
- Praticar o uso de GROUP BY com HAVING e INNER JOIN em múltiplas tabelas.

Data: 26/08/2025
*/

-- 1. Conte quantos integrantes nasceram em cada década (1960, 1970, 1980, etc.).
SELECT
     CASE
		WHEN YEAR(data_nascimento) BETWEEN 1930 AND 1939 THEN 'Decada_1930'
        WHEN YEAR(data_nascimento) BETWEEN 1940 AND 1949 THEN 'Decada_1940'
        WHEN YEAR(data_nascimento) BETWEEN 1950 AND 1959 THEN 'Decada_1950'
        WHEN YEAR(data_nascimento) BETWEEN 1960 AND 1969 THEN 'Decada_1960'
        WHEN YEAR(data_nascimento) BETWEEN 1970 AND 1979 THEN 'Decada_1970'
        WHEN YEAR(data_nascimento) BETWEEN 1980 AND 1989 THEN 'Decada_1980'
        WHEN YEAR(data_nascimento) BETWEEN 1990 AND 1999 THEN 'Decada_1990'
        ELSE 'Outras décadas'
    END AS decada_nascimento,
COUNT(nome) AS total_integrantes FROM integrantes
GROUP BY decada_nascimento
ORDER BY decada_nascimento;

-- 2. Liste os nomes das bandas com mais de 3 álbuns e que pertencem ao gênero "Heavy Metal".
SELECT b.nome, b.genero, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE b.genero = 'Heavy Metal'
GROUP BY b.nome
HAVING qtdd_albuns > 3;

-- 3. Encontre os álbuns lançados no mesmo ano em que a banda foi formada. Liste o nome da banda e o título do álbum.
SELECT b.nome AS banda, a.titulo AS album FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE b.ano = a.ano;

-- 4. Mostre o nome de todas as bandas, o gênero musical e uma nova coluna chamada status que diga 'Clássica' se a banda foi fundada antes de 1980 e 'Moderna' se foi fundada em 1980 ou depois.
SELECT nome, genero, 
	CASE
	WHEN ano < 1980 THEN 'Clássica'
    WHEN ano >= 1980 THEN 'Moderna'
	END AS 'status'
FROM bandas;

-- 5. Liste os nomes dos integrantes que não são membros atuais (membro_atual = 'N').
SELECT nome FROM integrantes
WHERE UPPER(membro_atual) = 'n';

-- 6. Calcule a média de idade dos integrantes que são membros atuais (membro_atual = 'S').
SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS media_idade FROM integrantes
WHERE UPPER(membro_atual) = 's';

-- 7. Encontre as bandas que têm pelo menos um integrante com o mesmo ano de nascimento que o ano de lançamento de um de seus álbuns.
-- Tive dificuldades em resolver. Ver as anotações da semana. 

-- 8. Liste a quantidade de álbuns por gênero. Inclua apenas os gêneros que têm mais de 5 álbuns.
SELECT count(a.titulo) AS qtdd_albuns, b.genero FROM albuns AS a
JOIN bandas AS b
ON a.banda_id = b.id
GROUP BY genero
HAVING qtdd_albuns > 5
ORDER BY qtdd_albuns;

-- 9. Mostre o nome das bandas, o título de seus álbuns e o ano de formação da banda, para todas as bandas do Brasil.
SELECT b.nome AS banda, b.ano AS ano_formacao, a.titulo AS titulo_album FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE b.nacionalidade = 'Brasil';

-- 10. Exclua a banda U2 e seus álbuns e integrantes associados.
-- Obs: A banda não possui nenhum integrante cadastrado. 
DELETE FROM albuns
WHERE banda_id = (SELECT id FROM bandas WHERE nome = 'U2');
DELETE FROM bandas
WHERE nome = 'U2';
