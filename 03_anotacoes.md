## Semana 1: 
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
 
  
