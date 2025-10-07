/*
Objetivo da Semana 12:
- Praticar funções de manipulação de dados e agregações. 

Datas: 07/10/2025 - em andamento
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

-- 4. Encontre as bandas que têm pelo menos um integrante cujo instrumento contém a palavra "vocal".
SELECT DISTINCT b.nome FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
WHERE i.instrumento LIKE '%vocal%';

-- 5. Para cada banda, mostre o nome do álbum mais recente e o nome do seu álbum mais antigo, sem usar funções de janela ou subqueries correlacionadas.

-- 6. Liste os álbuns que foram lançados em anos pares.
SELECT titulo FROM albuns
WHERE ano % 2 = 0;

-- 7. Mostre o nome de cada banda e o número de integrantes que ela possui, mas apenas para as bandas com 4 ou mais integrantes.
SELECT b.nome AS banda, count(i.nome) AS qtdd_integrantes FROM bandas AS b
JOIN integrantes AS i
ON b.id = i.banda_id
GROUP BY banda
HAVING qtdd_integrantes >= 4;

-- 8. Encontre a quantidade de álbuns por gênero, mas exiba somente os gêneros com mais de 2 bandas.

-- 9. Liste os nomes dos integrantes, o nome da banda e uma coluna chamada status_membro que mostre 'Membro Ativo' se membro_atual for 'S' e 'Ex-Membro' se for 'N'.

-- 10. Exclua todos os integrantes da banda The Beatles.
DELETE FROM integrantes
WHERE banda_id = (SELECT id FROM bandas WHERE nome = 'The Beatles');
