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

---

# Semana 2: 
Importante praticar o uso de `JOINs`, me atentando ao seu uso em conjunto com a cláusula `ON`.  
Recomendado também utilizar `AS` para renomear colunas ou resultados, a fim de melhorar a legibilidade e a interpretação dos dados. 

---

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

---

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
**_Exercício 9_**:  
Tive dificuldades em resolver esse exercício. Apesar de, mentalmente, conseguir quebrar o problema em etapas menores, encontrei uma barreira no domínio técnico para traduzir essa lógica em SQL.  
Para resolvê-lo, é preciso dominar melhor as **funções de manipulação de strings**, além do uso combinado de `GROUP BY` e `HAVING`. Ainda tenho certa dificuldade nesses pontos, especialmente ao lidar com condições mais complexas dentro de agrupamentos.  
A próxima semana, portato, terá foco nessas dificuldades.  

---

# Semana 5:
Nesta semana comecei a utilizar mais as **funções de manipulação de strings** e, para ajudar na prática, segue um resumo com as principais delas:
### 📝 **Resumo: Funções de Manipulação de Strings em SQL**

| Função                  | O que faz                                            | Exemplo                                | Resultado       |
|-------------------------|------------------------------------------------------|----------------------------------------|-----------------|
| `LENGTH()` / `CHAR_LENGTH()` | Conta o número de caracteres da string           | `LENGTH('The Doors')`                  | `9`             |
| `LOWER()` / `UPPER()`   | Transforma todos os caracteres para minúsculo/maiúsculo | `LOWER('HELLO')`                     | `hello`         |
| `TRIM()`                | Remove espaços em branco do início e fim da string  | `TRIM(' Hello ')`                      | `'Hello'`       |
| `REPLACE()`             | Substitui parte da string por outra                 | `REPLACE('The Beatles', 'e', '3')`     | `'Th3 B3atl3s'` |
| `SUBSTRING()` / `SUBSTR()` | Extrai parte da string                          | `SUBSTRING('Black Sabbath', 1, 5)`     | `'Black'`       |
| `INSTR()` / `POSITION()` | Retorna a posição de um caractere na string        | `INSTR('Deep Purple', 'P')`            | `6`             |
| `CONCAT()`              | Junta duas ou mais strings                          | `CONCAT('The ', 'Doors')`              | `'The Doors'`   |

**_Exercício 4_**:  
Foi utilizado o `LEFT JOIN` para que as bandas sem nenhum álbum cadastrado também pudessem ser contabilizadas.

**_Exercício 6_**:   
A função `length(titulo)` retorna a quantidade de caracteres do título do álbum.  
A função `replace(titulo, ' ', '')` remove todos os espaços que o título do álbum possui. (Por exemplo, o álbum "Sabbath Blood Sabbath" passará a se chamar "SabbathBloodSabbath").  
Se a diferença entre a quantidade de caracteres original e a quantidade de caracteres sem os espaços for maior ou igual à 2, significa que, pelo menos, dois espaços foram removidos.  
E se pelo menos dois espaços foram removidos, então, o título do álbum possui, no mínimo, três palavras.  

---
  
# Semana 6:
**_Exercício 3_**: O `ORDER BY` no final da _query_ foi utilizado para facilitar a visualização do ano com maior quantidade de álbuns lançados.
**_Exercício 10_**: A função `lower` utilizada junto ao título foi utilizada para respeitar linguagens que são _case sensitive_.

---

# Semana 7:
Como o objetivo da semana foi praticar os comandos DDL e DML, segue um breve descritivo das diferentes categorias de comando no SQL:

### 📝 **Resumo: Categorias de comandos no SQL**
|Linguagem | O que é | Exemplo de comandos |
|----------|---------|---------------------|
|**DDL** - Data Definition Language (Linguagem de Definição de Dados)| Comandos usados para definir ou alterar a estrutura do banco de dados e dos seus objetos, como tabelas e índices.| `CREATE`, `ALTER`, `DROP` |
|**DML** - Data Manipulation Language (Linguagem de Manipulação de Dados)| Utilizada para manipular os dados que estão dentro da estrutura criada com o DDL. | `INSERT`, `UPDATE` |
|**DQL** - Data Query Language (Linguagem de Consulta de Dados)| Focada consultar e recuperar dados do banco de dados. | `SELECT`|
|**DCL** - Data Control Language (Linguagem de Controle de Dados)| Lida com a segurança e as permissões de acesso do banco de dados. | `GRANT`, `REVOKE` |
|**DTL ou TCL** - Data Transaction Language (Linguagem de Transação de Dados)| Gerencia as transações em um banco de dados. Uma transação é um conjunto de operações que devem ser tratadas como uma única unidade.| `BEGIN TRANSACTION`, `ROLLBACK`|

**_Sobre a expressão `CASE` utilizada nos exercícios:_**  
Ideal para `UPDATES` onde várias linhas precisam ser atualizadas, mas cada uma receberá um valor diferente.  
Também pode funcionar como uma estrutura condicional do tipo `IF-THEN-ELSE`.  
_Sintaxe básica:_
```sql
CASE
    WHEN condição_1 THEN resultado_1
    WHEN condição_2 THEN resultado_2
    ...
    [ELSE resultado_alternativo]
END
```
Onde:  
* `CASE`: Inicia a cláusula.
* `WHEN condição_ THEN _resultado`: Para cada condição que você quer verificar, use um `WHEN`. Se a condição for verdadeira, o `CASE` retorna o resultado correspondente. Você pode ter múltiplos `WHENs`. A primeira condição que for verdadeira é a que será usada, e o resto será ignorado.
* `ELSE resultado_alternativo`: É opcional. Se nenhuma das condições `WHEN` for verdadeira, o valor do `ELSE` será retornado. Se você omitir o `ELSE` e nenhuma condição for verdadeira, o resultado será `NULL`.
* `END`: Finaliza a cláusula.

Nos exercícios, foi adicionada a cláusula `WHERE` no final para garantir que apenas as linhas desejadas serão atualizadas. Este `WHERE` pertence ao comando `UPDATE` e, se não for utilizada, o comando tentará atualizar todas as linhas da tabela, podendo causar erros.

---

# Semana 8:

**_Ordem de execução do `GROUP BY` e `HAVING`:_**  
`WHERE` filtra antes de agrupar, `HAVING` filtra depois de agrupar.  
No exercício 6, apesar de funcional, o ideal seria alterar o filtro `HAVING b.genero = 'Rock'` para o `WHERE` a fim de otimizar a consulta. Como a cláusula `WHERE` filtra as linhas antes de serem agrupadas, a operação se torna mais rápida do que filtrar os grupos com `HAVING`.  
Uma querie alternativa e mais otimizada para o exercício é:  
```sql
SELECT b.nome AS banda, COUNT(a.titulo) AS qtd_albuns
FROM bandas AS b
JOIN albuns AS a ON b.id = a.banda_id
WHERE b.genero = 'Rock'
GROUP BY b.nome;
```
**_Uso de múltiplos JOINs:_**  
Conforme as queries dos exercícios 8 e 9, que uniram três tabelas (bandas, albuns e integrantes), a lógica do uso de `JOIN` se mantém para múltiplas tabelas: É necessário conectar cada tabela à próxima usando a chave estrangeira (banda_id) que se refere à chave primária (id) da tabela anterior.  
Funciona em cadeia: tabela A -> tabela B -> tabela C, com `JOINs` separados.




