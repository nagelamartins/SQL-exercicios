![Banco de musicas](https://github.com/user-attachments/assets/838f507b-d5b8-4b50-9d65-f0d8880cc6ac)

# 🎵 Praticando SQL com Banco Musical

Este repositório foi criado com o objetivo de aprimorar minhas habilidades em Structured Query Language (SQL), utilizando um banco de dados de bandas e álbuns que eu curto. A ideia é simular cenários do mundo real para construir e otimizar minhas queries.

Acho importante ressaltar que a base de dados, incluindo seu schema e os dados inseridos, foi gerada com o auxílio de uma Inteligência Artificial. Por isso, pode haver pequenas inconsistências ou imprecisões nos registros (como datas, gêneros ou nacionalidades). O objetivo principal deste repositório é a prática de SQL, então não considere essas informações como uma fonte enciclopédica de dados musicais. 

Sinta-se à vontade para corrigir ou reportar qualquer erro que encontrar!

---

## 🎯 Objetivos

Os principais objetivos deste projeto é:

* **Praticar SQL semanalmente**: Com a ajuda de Inteligencia Artificial novos desafios me serão propostos a cada semana. Eles exigirão a escrita de queries para extrair informações específicas do banco de dados;
* **Compreender diferentes conceitos de SQL**: Desde selects básicos até joins complexos, subqueries, funções de agregação e muito mais;
* **Desenvolver raciocínio lógico**: Desafiar-me a pensar em como resolver problemas utilizando a linguagem SQL de forma eficiente;
* **Documentar o aprendizado**: Registrar anotações e insights importantes que surgirem durante meus estudos.

---

## 🗄️ Estrutura do Repositório

O repositório está organizado da seguinte forma:

* **`README.md`**: Este arquivo que você está lendo agora! Contém informações gerais sobre o projeto, objetivos e estrutura;
* **`schema.sql`**: Define a **estrutura do banco de dados**, incluindo as tabelas `bandas` e `albuns`, seus campos e relacionamentos;
* **`data.sql`**: Contém os **dados de exemplo** que preenchem as tabelas, com informações sobre diversas bandas e alguns de seus álbuns lançados;
* **`exercicios/`**: Pasta onde os **exercícios semanais de SQL** serão armazenados. Cada semana terá seu próprio arquivo (`semana-01.sql`, `semana-02.sql`, etc.), contendo os desafios que foram propostos pela IA escolhida, e minhas soluções em forma de queries;
* **`anotacoes.md`**: Um espaço para **anotações gerais**, dúvidas, descobertas e qualquer informação relevante que surgir durante a prática.

---

## 🗃️ Estrutura do Banco de Dados

Para facilitar a compreensão, aqui está a estrutura das tabelas:

### 🎶 Tabela `bandas`

| Coluna         | Tipo        | Descrição                                 |
| :------------- | :---------- | :---------------------------------------- |
| `id`           | `INT`       | Chave primária, auto-incrementável.       |
| `nome`         | `VARCHAR(100)` | Nome da banda (único).                    |
| `genero`       | `VARCHAR(100)` | Gênero musical da banda.                  |
| `ano`          | `YEAR`      | Ano de formação da banda.                 |
| `nacionalidade` | `VARCHAR(100)` | País de origem da banda.                  |

### 💿 Tabela `albuns`

| Coluna    | Tipo        | Descrição                                |
| :-------- | :---------- | :--------------------------------------- |
| `id`      | `INT`       | Chave primária, auto-incrementável.      |
| `titulo`  | `VARCHAR(100)` | Título do álbum.                         |
| `ano`     | `YEAR`      | Ano de lançamento do álbum.              |
| `banda_id` | `INT`       | Chave estrangeira que referencia `bandas.id`. |

---

## 🎲 Exemplo de Dados (para referência rápida)

Alguns exemplos de dados:

**🎶 Bandas:**

| id | nome             | genero        | ano  | nacionalidade |
| -- | :--------------- | :------------ | :--- | :------------ |
| 2  | Black Sabbath    | Heavy Metal   | 1968 | Inglaterra    |
| 4  | Depeche Mode	    | New Wave	    | 1980 | Inglaterra    |
| 6  | Angra            | Heavy Metal   | 1991 | Brasil        |

**💿 Álbuns:**

| id  | titulo           | ano  | banda_id |
| --- | :--------------- | :--- | :------- |
| 2   | Paranoid         | 1970 | 2        |
| 4	  | Violator	       | 1990	| 4        |
| 6   | Rebirth          | 2001 | 6        |

---

## 🎧 Banco de Músicas: A Trilha Sonora deste Repositório

Preparei uma playlist no Spotify com uma música de cada banda que faz parte deste banco de dados. Dê o play e aproveite!

[Link para a Playlist no Spotify](https://open.spotify.com/playlist/0RQxfR5w4pFWLKAiJ5Ytyq?si=9BExgnpEQQGVlLJ0jcapcQ&pi=BA4d1dDbRb-Y5)
