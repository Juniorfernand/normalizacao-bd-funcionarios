# Normalização de Base de Dados — Sistema de Gestão de Funcionários

## Universidade Licungo

**Faculdade:** Faculdade de Ciências e Tecnologias  
**Curso:** Licenciatura em Informática  
**Trabalho:** Trabalho II  
**Tema:** Normalização de Base de Dados — Sistema de Gestão de Funcionários  
**Estudante:** Alberto Massada Fernando Júnior

---

## 1. Introdução

Este projeto apresenta a análise e normalização de uma base de dados destinada à gestão de funcionários de uma empresa moçambicana.

Inicialmente, os dados encontram-se armazenados numa única tabela não normalizada, contendo informações pessoais, profissionais, endereço, filhos e contactos telefónicos.

O objetivo é aplicar as formas normais 1FN, 2FN, 3FN e 4FN, obtendo uma estrutura organizada e com menor redundância.

---

## 2. Objetivos

### Objetivo geral

Normalizar a base de dados de funcionários até à Quarta Forma Normal (4FN).

### Objetivos específicos

- Identificar dados não atómicos;
- Identificar grupos repetitivos;
- Identificar dependências funcionais;
- Identificar dependências transitivas;
- Identificar dependências multivaloradas;
- Aplicar a 1FN;
- Aplicar a 2FN;
- Aplicar a 3FN;
- Aplicar a 4FN;
- Identificar cardinalidades;
- Construir o Modelo Entidade-Relacionamento;
- Criar as tabelas em SQL;
- Criar consultas utilizando JOIN.

---

## 3. Problemas da tabela original

A tabela original apresenta:

- Repetição de telefones;
- Repetição de filhos;
- Repetição de códigos de cargo;
- Repetição de códigos de função;
- Redundância de informações;
- Dependências transitivas;
- Dependências multivaloradas;
- Possíveis anomalias de inserção;
- Possíveis anomalias de atualização;
- Possíveis anomalias de remoção.

---

## 4. Formas normais

### 1FN — Primeira Forma Normal

Eliminação dos grupos repetitivos de filhos e telefones.

### 2FN — Segunda Forma Normal

Como FUNCIONARIO possui uma chave primária simples, não existem dependências parciais nessa relação.

### 3FN — Terceira Forma Normal

Separação das informações que possuem dependências transitivas, como:

- PAIS;
- PROVINCIA;
- CIDADE;
- ENDERECO;
- FUNCAO;
- CARGO;
- POSTO_TRABALHO.

### 4FN — Quarta Forma Normal

Separação das dependências multivaloradas independentes:

- TELEFONE;
- FILHO.

---

## 5. Entidades finais

O modelo final possui as seguintes entidades:

1. PAIS
2. PROVINCIA
3. CIDADE
4. ENDERECO
5. FUNCAO
6. CARGO
7. POSTO_TRABALHO
8. FUNCIONARIO
9. TELEFONE
10. FILHO

---

## 6. Cardinalidades

| Relacionamento | Cardinalidade |
|---|---|
| PAIS → PROVINCIA | 1:N |
| PROVINCIA → CIDADE | 1:N |
| CIDADE → ENDERECO | 1:N |
| CIDADE → POSTO_TRABALHO | 1:N |
| ENDERECO → FUNCIONARIO | 1:N |
| FUNCAO → CARGO | 1:N |
| CARGO → FUNCIONARIO | 1:N |
| POSTO_TRABALHO → FUNCIONARIO | 1:N |
| FUNCIONARIO → TELEFONE | 1:N |
| FUNCIONARIO → FILHO | 1:N |

---

## 7. Estrutura do projeto

```text
normalizacao-bd-funcionarios/
│
├── README.md
│
├── documentos/
│   └── analise-normalizacao.md
│
├── diagramas/
│   └── modelo-er.md
│
└── sql/
    ├── schema.sql
    └── queries.sql

8. Ferramentas utilizadas

* GitHub
* MySQL
* MySQL Workbench
* diagrams.net (draw.io)
* SQL
* Markdown

⸻

9. Conclusão

A normalização permitiu transformar a tabela inicial numa estrutura relacional mais organizada, reduzindo redundâncias e eliminando grupos repetitivos, dependências transitivas e dependências multivaloradas.

O modelo final permite gerir funcionários, endereços, cargos, funções, postos de trabalho, filhos e contactos telefónicos de forma organizada.

⸻

Autor

Alberto Massada Fernando Júnior

Licenciatura em Informática
Universidade Licungo
