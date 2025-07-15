# Semana 1: 
**_Exercícios 8 e 9_**:  
Como o ID das bandas é auto incrementável, em bancos de dados maiores não é seguro assumir seu valor manualmente.  
A fim de evitar erros ao referenciar o valor na chave estrangeira, a melhor opção é inserir uma subquery que consulte qual é esse valor através de uma informação única, como o nome da banda.

**Exemplo:**

```sql
INSERT INTO albuns (id, titulo, ano, banda_id) VALUES 
(default, 'Cosmic Whiskers', 2025, 
  (SELECT id FROM bandas WHERE nome = 'The Galactic Cats'));
```
Da mesma forma, é interessante repensar a inserção dos álbuns na tabela `albuns`: eles são referenciados manualmente na chave estrangeira `banda_id`, o que pode gerar erros.
 
# Semana 2: 
Importante praticar o uso de `JOINs`, me atentando ao seu uso em conjunto com a cláusula `ON`.  
Recomendado também utilizar `AS` para renomear colunas ou resultados, a fim de melhorar a legibilidade e a interpretação dos dados. 

# Semana 3: 
### Ajustes no Banco de Dados:
Foram inseridas novas bandas na tabela `bandas` sem álbuns associados para possibilitar uma melhor prática dos diferentes tipos de `JOIN`.
```sql
INSERT INTO bandas (id, nome, genero, ano, nacionalidade) VALUES
(default, 'Raul Seixas', 'Rock', 1973, 'Brasil'),
(default, 'Ozzy Osbourne', 'Heavy Metal', 1980, 'Inglaterra'),
(default, 'Demons & Wizards', 'Power Metal', 1999, 'EUA / Alemanha');
```
Com base nos estudos desta semana, acredito que será necessário continuar praticando o uso de `JOIN`, principalmente em consultas mais complexas. Além disso, para garantir que os agrupamentos e filtros sejam feitos de modo eficiente, preciso aprimorar o uso do `GROUP BY` e do `HAVING`.  
Foi também meu primeiro contato com a função `length()`. Para expandir meu repertório, farei uma prática futura com o uso de outras funções nativas da linguagem.

# Semana 4:
### Ajustes no Banco de Dados:
Para possibilitar o uso de `RIGHT JOIN` de modo mais efetivo, foram acrescentados álbuns sem bandas associadas a eles (banda_id nulo).
```sql
INSERT INTO albuns (id, titulo, ano) VALUES 
(default, 'Yes', 1969), 
(default, 'Emerson, Lake & Palmer', 1970), 
(default, 'Ben', 1972), 
(default, 'Dawn of victory', 2000)
```
Além disso, para deixar os exercícios da semana mais interessantes, foram acrescentados álbuns para algumas das bandas já cadastradas:
```sql
INSERT INTO albuns (id, titulo, ano, banda_id) VALUES
(default, 'Black Sabbath', 1970, (SELECT id FROM bandas WHERE nome = 'Black Sabbath')),
(default, 'Sabbath Bloody Sabbath', 1973, (SELECT id FROM bandas WHERE nome = 'Black Sabbath')),
(default, 'Fireball', 1971, (SELECT id FROM bandas WHERE nome = 'Deep Purple')),
(default, 'Burn', 1974, (SELECT id FROM bandas WHERE nome = 'Deep Purple')),
(default, 'Withering to Death', 2005, (SELECT id FROM bandas WHERE nome = 'Dir en grey')),
(default, 'Mudança de Comportamento', 1985, (SELECT id FROM bandas WHERE nome = 'Ira!')),
(default, 'Clandestino', 1990, (SELECT id FROM bandas WHERE nome = 'Ira!')),
(default, 'I Got Dem Ol Kozmic Blues Again Mama!', 1969, (SELECT id FROM bandas WHERE nome = 'Janis Joplin')),
(default, 'Electric Ladyland', 1968, (SELECT id FROM bandas WHERE nome = 'Jimi Hendrix')),
(default, 'From Zero', 2024, (SELECT id FROM bandas WHERE nome = 'Linkin Park')),
(default, 'Help!', 1965, (SELECT id FROM bandas WHERE nome = 'The Beatles')),
(default, 'Let It Be', 1970, (SELECT id FROM bandas WHERE nome = 'The Beatles')),
(default, 'The Doors', 1967, (SELECT id FROM bandas WHERE nome = 'The Doors')),
(default, 'Waiting for the Sun', 1968, (SELECT id FROM bandas WHERE nome = 'The Doors')),
(default, 'Morrison Hotel', 1970, (SELECT id FROM bandas WHERE nome = 'The Doors'));
```
