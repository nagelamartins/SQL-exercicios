/*
Objetivo da Semana 14:
- Praticar o uso de CTEs. 

Data: 
*/

-- 1. CTE Simples: Crie uma CTE chamada bandas_recentes que liste todas as bandas fundadas após o ano 1970. Em seguida, use uma SELECT simples para exibir o nome e o ano de fundação dessa CTE.

-- 2. CTE + Agregação Básica: Crie uma CTE chamada dados_albuns que liste o título e o ano de lançamento de todos os álbuns. Em seguida, use uma SELECT na sua CTE para contar quantos álbuns foram lançados após o ano 2000.

-- 3. CTE para Filtragem de Grupos: Crie uma CTE chamada albuns_por_banda que conte o número de álbuns para cada banda. Em seguida, use uma SELECT na sua CTE para listar apenas as bandas que possuem mais de 3 álbuns.

-- 4. CTE para Junção Simples: Crie uma CTE chamada integrantes_antigos que liste os nomes dos integrantes nascidos antes de 1960. Em seguida, junte esta CTE com a tabela bandas para mostrar o nome da banda e o nome de cada integrante antigo.

-- 5. Duas CTEs em Sequência: Crie uma CTE (contagem_integrantes) que conte quantos integrantes cada banda tem. Em seguida, crie uma segunda CTE (bandas_pequenas) que liste as bandas que têm menos de 4 integrantes. Finalmente, exiba o resultado da segunda CTE.

-- 6. CTE para MAX/MIN: Crie uma CTE chamada ano_mais_antigo que encontre o ano do álbum mais antigo para cada banda. Em seguida, use esta CTE para listar o nome da banda e o título do álbum que corresponde a esse ano mais antigo. (Dica: Você precisará juntar a CTE de volta com a tabela albuns para pegar o título.)

-- 7. CTE com Função de Janela: Crie uma CTE chamada ranking_albuns que utilize a função de janela ROW_NUMBER() para ranquear os álbuns de cada banda (1 para o mais antigo, 2 para o segundo mais antigo, etc.). Em seguida, use esta CTE para listar o nome da banda e o título do seu segundo álbum mais antigo (posição 2).

-- 8. Duas CTEs e Junção de Dados: Crie uma CTE (bandas_brasileiras) listando apenas bandas com nacionalidade 'Brasil'. Crie uma segunda CTE (integrantes_vocal) listando integrantes que tocam 'vocal'. Finalmente, junte as duas CTEs para mostrar o nome da banda brasileira que tem um vocalista (use a tabela bandas como ponte para a junção).

-- 9. CTE para Agregação Aninhada (Média de Contagens): Crie uma CTE chamada membros_por_instrumento que conte o número de integrantes para cada instrumento. Em seguida, use esta CTE para calcular a média de integrantes por instrumento e liste apenas os instrumentos que estão acima da média de integrantes. (Modelo do Ex. 12.8 e 13.3).

-- 10. CTE para Filtragem Exclusiva: Crie uma CTE (bandas_com_albuns) listando todas as banda_id que possuem álbuns. Crie uma segunda CTE (bandas_com_membros) listando todas as banda_id que possuem integrantes. Finalmente, use as duas CTEs para listar os nomes das bandas que têm membros, mas não têm álbuns. (Reforçando o Ex. 12.2).
