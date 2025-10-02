/*
Objetivo da Semana 12:
- Revisar conceitos. 

Data: 02/10/2025
*/

-- 1. Encontre as bandas que têm mais álbuns do que a banda The Doors.
SELECT b.nome, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.nome
HAVING qtdd_albuns > (SELECT count(titulo) FROM albuns WHERE banda_id = (SELECT id FROM bandas WHERE nome = 'The Doors'));

-- 2. Conte quantos álbuns cada gênero musical possui, e liste apenas os gêneros com mais de 5 álbuns.
SELECT b.genero, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY b.genero
HAVING count(a.titulo) > 5
ORDER BY qtdd_albuns DESC;

-- 3. Mostre o título e o ano dos 3 álbuns mais recentes lançados por bandas brasileiras.
WITH ordem_lancamento AS (
  SELECT b.nome AS banda, 
  a.titulo AS album, 
  a.ano AS lancamento, 
  ROW_NUMBER () OVER (PARTITION BY b.nome ORDER BY a.ano DESC) AS ordem 
  FROM bandas AS b
  JOIN albuns AS a
  ON b.id = a.banda_id
  WHERE b.nacionalidade = 'Brasil'
)
SELECT banda, album, lancamento, ordem FROM ordem_lancamento
WHERE ordem <= 3;

-- 4. Liste os nomes dos integrantes que tocam o mesmo instrumento que o integrante Mike Shinoda.
SELECT nome FROM integrantes
WHERE instrumento = (SELECT instrumento FROM integrantes WHERE nome = 'Mike Shinoda');

-- 5. Encontre as bandas que foram fundadas antes de 1980 e que lançaram pelo menos um álbum no mesmo ano de sua fundação.
SELECT b.nome, a.titulo, b.ano, a.ano FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE b.ano = a.ano AND b.ano < 1980;
/* não retorna nenhum resultado. A única banda do banco que possui ano de lançamento de álbum igual ao ano de fundação é The Mission com 
Gods Own Medicine, em 1986 */

-- 6. Mostre o nome de cada banda e o número total de integrantes que ela possui. Inclua também as bandas que não têm nenhum integrante.
SELECT b.nome AS banda, count(i.nome) AS qtdd_integrantes FROM bandas AS b
LEFT JOIN integrantes AS i
ON b.id = i.banda_id
GROUP BY banda
ORDER BY qtdd_integrantes DESC;

-- 7. Liste todos os álbuns da banda Linkin Park e adicione uma coluna mostrando a média de ano de lançamento de todos os álbuns da banda.
SELECT a.titulo, AVG(a.ano) OVER (PARTITION BY b.nome) AS media_lancamento FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
WHERE b.nome = 'Linkin Park';

-- 8. Mostre o nome de todas as bandas e quantos álbuns cada uma lançou, incluindo as que não têm álbuns.
SELECT b.nome AS banda, count(a.titulo) AS qtdd_albuns FROM bandas AS b
LEFT JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY banda;

-- 9. Liste o nome das bandas fundadas antes de 1980 que pertencem ao gênero "Hard Rock".
SELECT nome FROM bandas
WHERE ano < 1980 AND genero = 'Hard Rock';

-- 10. Encontre o nome da banda que tem o maior número de álbuns no banco de dados.
SELECT b.nome AS banda, count(a.titulo) AS qtdd_albuns FROM bandas AS b
JOIN albuns AS a
ON b.id = a.banda_id
GROUP BY banda 
ORDER BY qtdd_albuns DESC
LIMIT 1;
