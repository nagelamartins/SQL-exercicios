/*
Objetivo da Semana 12:
- Praticar funções de manipulação de dados e agregações. 

Datas: 07/10/2025 - 02/11/2025
*/

-- 1. Mostre o nome da banda e o número de álbuns, mas apenas para as 3 bandas com o maior número de álbuns.
SELECT b.nome as banda, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY banda
ORDER BY qtdd_albuns DESC
LIMIT 3;

-- 2. Liste o título dos álbuns lançados por bandas que não são dos Estados Unidos (EUA).
SELECT a.titulo FROM albuns AS a
JOIN bandas AS b
ON a.banda_id = b.id
WHERE b.nacionalidade != 'EUA';

-- 3. Conte quantos álbuns cada nacionalidade possui, mas apenas para as nacionalidades que têm um número de álbuns acima da média geral de álbuns por nacionalidade.
WITH contagem_albuns_nacionalidade AS (
	SELECT b.nacionalidade, COUNT(a.titulo) AS quantidade_albuns FROM albuns AS a
	JOIN bandas AS b 
  ON a.banda_id = b.id
	GROUP BY b.nacionalidade
)
SELECT nacionalidade, quantidade_albuns FROM contagem_albuns_nacionalidade
WHERE quantidade_albuns > (
	SELECT AVG(quantidade_albuns)
	FROM contagem_albuns_nacionalidade
	);

-- 4. Encontre as bandas que têm pelo menos um integrante cujo instrumento contém a palavra "vocal".
SELECT DISTINCT b.nome FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
WHERE i.instrumento LIKE '%vocal%';

-- 5. Liste os álbuns que foram lançados em anos pares.
SELECT titulo FROM albuns
WHERE ano % 2 = 0;

-- 6. Mostre o nome de cada banda e o número de integrantes que ela possui, mas apenas para as bandas com 4 ou mais integrantes.
SELECT b.nome AS banda, count(i.nome) AS qtdd_integrantes FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
GROUP BY banda
HAVING qtdd_integrantes >= 4;

-- 7. Encontre a quantidade de álbuns por gênero, mas exiba somente os gêneros com mais de 2 bandas.
SELECT b.genero, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.genero
HAVING qtdd_albuns > 2
ORDER BY qtdd_albuns DESC;

-- 8. Liste os nomes dos integrantes, o nome da banda e uma coluna chamada status_membro que mostre 'Membro Ativo' se membro_atual for 'S' e 'Ex-Membro' se for 'N'.
SELECT b.nome AS banda, i.nome AS integrante, 
	CASE 
		WHEN membro_atual = 'S' THEN 'Membro Ativo'
		ELSE 'Ex_membro'
	END AS status_membro
FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id;

-- 9. Exclua todos os integrantes da banda The Beatles.
DELETE FROM integrantes
WHERE banda_id = (SELECT id FROM bandas WHERE nome = 'The Beatles');

-- 10. Liste o nome de todas as bandas que têm integrantes cujo data_nascimento é anterior a 1960.
SELECT DISTINCT b.nome AS banda FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
WHERE YEAR(i.data_nascimento) < 1960;
