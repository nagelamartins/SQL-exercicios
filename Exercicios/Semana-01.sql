/* 
Objetivos da Semana 1:
- Realizar consultas básicas com `SELECT`, `WHERE`, `DISTINCT` e `ORDER BY`
- Inserir e atualizar dados com `INSERT` e `UPDATE`

Data: 24/06/2025
*/

-- 1. Liste o nome de todas as bandas cadastradas.
SELECT nome FROM bandas;

-- 2. Liste os títulos e anos de todos os álbuns.
SELECT titulo, ano FROM albuns;

-- 3. Mostre o nome das bandas brasileiras.
SELECT nome FROM bandas
WHERE nacionalidade = 'Brasil';

-- 4. Mostre o nome das bandas fundadas após 1990.
SELECT nome, ano FROM bandas
WHERE ano > 1990
ORDER BY ano;

-- 5. Liste os álbuns lançados antes de 1980.
SELECT titulo, ano FROM albuns
WHERE ano < 1980
ORDER BY ano;

-- 6. Quais são os gêneros musicais únicos cadastrados na tabela bandas?
SELECT distinct genero FROM bandas
ORDER BY genero;

-- 7. Liste o nome das bandas e o ano de fundação, ordenados do mais antigo para o mais recente.
SELECT nome, ano FROM bandas
ORDER BY ano;

-- 8. Insira uma nova banda fictícia: "The Galactic Cats", do gênero "Space Rock", fundada em 2025, nacionalidade "Marte".
INSERT INTO bandas (id, nome, genero, ano, nacionalidade) VALUES
(default, 'The Galactic Cats', 'Space Rock', 2025, 'Marte');

-- 9. Insira um álbum dessa banda chamado "Cosmic Whiskers", lançado em 2025.
INSERT INTO albuns (id, titulo, ano, banda_id) VALUES 
(default, 'Cosmic Whiskers', 2025, 101);

-- 10. Atualize a nacionalidade da banda “The Galactic Cats” para "Fronteira Interestelar".
UPDATE bandas
SET nacionalidade = 'Fronteira Interestelar'
WHERE id = 101;

