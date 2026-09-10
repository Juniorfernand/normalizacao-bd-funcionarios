Modelo Entidade-Relacionamento

Sistema de Gestão de Funcionários

Este documento apresenta o Modelo Entidade-Relacionamento da base de dados normalizada até à Quarta Forma Normal (4FN).

⸻

1. Entidades

PAIS

* id_pais — Chave Primária (PK)
* nome

PROVINCIA

* id_provincia — Chave Primária (PK)
* nome
* pais_id — Chave Estrangeira (FK)

CIDADE

* id_cidade — Chave Primária (PK)
* nome
* provincia_id — Chave Estrangeira (FK)

ENDERECO

* id_endereco — Chave Primária (PK)
* logradouro
* bairro
* cidade_id — Chave Estrangeira (FK)

FUNCAO

* codigo_funcao — Chave Primária (PK)
* nome_funcao

CARGO

* codigo_cargo — Chave Primária (PK)
* nome_cargo
* codigo_funcao — Chave Estrangeira (FK)

POSTO_TRABALHO

* id_posto — Chave Primária (PK)
* nome_posto
* cidade_id — Chave Estrangeira (FK)

FUNCIONARIO

* id_funcionario — Chave Primária (PK)
* nome
* data_nascimento
* nuit
* bi
* email
* endereco_id — Chave Estrangeira (FK)
* codigo_cargo — Chave Estrangeira (FK)
* id_posto — Chave Estrangeira (FK)
* data_admissao

TELEFONE

* id_telefone — Chave Primária (PK)
* funcionario_id — Chave Estrangeira (FK)
* numero
* tipo

FILHO

* id_filho — Chave Primária (PK)
* funcionario_id — Chave Estrangeira (FK)
* nome

⸻

2. Diagrama ER

O diagrama abaixo representa as entidades e os relacionamentos da base de dados normalizada:

erDiagram
    PAIS ||--o{ PROVINCIA : possui
    PROVINCIA ||--o{ CIDADE : possui
    CIDADE ||--o{ ENDERECO : possui
    CIDADE ||--o{ POSTO_TRABALHO : localiza
    ENDERECO ||--o{ FUNCIONARIO : associado
    FUNCAO ||--o{ CARGO : possui
    CARGO ||--o{ FUNCIONARIO : atribuido
    POSTO_TRABALHO ||--o{ FUNCIONARIO : aloca
    FUNCIONARIO ||--o{ TELEFONE : possui
    FUNCIONARIO ||--o{ FILHO : possui
    PAIS {
        INT id_pais PK
        VARCHAR nome
    }
    PROVINCIA {
        INT id_provincia PK
        VARCHAR nome
        INT pais_id FK
    }
    CIDADE {
        INT id_cidade PK
        VARCHAR nome
        INT provincia_id FK
    }
    ENDERECO {
        INT id_endereco PK
        VARCHAR logradouro
        VARCHAR bairro
        INT cidade_id FK
    }
    FUNCAO {
        VARCHAR codigo_funcao PK
        VARCHAR nome_funcao
    }
    CARGO {
        VARCHAR codigo_cargo PK
        VARCHAR nome_cargo
        VARCHAR codigo_funcao FK
    }
    POSTO_TRABALHO {
        INT id_posto PK
        VARCHAR nome_posto
        INT cidade_id FK
    }
    FUNCIONARIO {
        INT id_funcionario PK
        VARCHAR nome
        DATE data_nascimento
        VARCHAR nuit
        VARCHAR bi
        VARCHAR email
        INT endereco_id FK
        VARCHAR codigo_cargo FK
        INT id_posto FK
        DATE data_admissao
    }
    TELEFONE {
        INT id_telefone PK
        INT funcionario_id FK
        VARCHAR numero
        VARCHAR tipo
    }
    FILHO {
        INT id_filho PK
        INT funcionario_id FK
        VARCHAR nome
    }

⸻

3. Cardinalidades

Relacionamento	Cardinalidade
PAIS — PROVINCIA	1:N
PROVINCIA — CIDADE	1:N
CIDADE — ENDERECO	1:N
CIDADE — POSTO_TRABALHO	1:N
ENDERECO — FUNCIONARIO	1:N
FUNCAO — CARGO	1:N
CARGO — FUNCIONARIO	1:N
POSTO_TRABALHO — FUNCIONARIO	1:N
FUNCIONARIO — TELEFONE	1:N
FUNCIONARIO — FILHO	1:N

⸻

4. Explicação dos relacionamentos

* Um PAIS pode possuir várias PROVINCIAS.
* Uma PROVINCIA pode possuir várias CIDADES.
* Uma CIDADE pode possuir vários ENDERECOS.
* Uma CIDADE pode possuir vários POSTOS DE TRABALHO.
* Um ENDERECO pode estar associado a vários FUNCIONARIOS.
* Uma FUNCAO pode estar associada a vários CARGOS.
* Um CARGO pode ser atribuído a vários FUNCIONARIOS.
* Um POSTO DE TRABALHO pode ter vários FUNCIONARIOS.
* Um FUNCIONARIO pode possuir vários TELEFONES.
* Um FUNCIONARIO pode possuir vários FILHOS.

⸻

5. Chaves primárias e estrangeiras

As chaves primárias identificam de forma única cada registo de uma entidade.

As chaves estrangeiras permitem estabelecer os relacionamentos entre as diferentes entidades.

A utilização de PK e FK ajuda a garantir a integridade referencial da base de dados.

⸻

6. Estrutura geral do modelo

PAIS
  |
  +--- PROVINCIA
          |
          +--- CIDADE
                  |
                  +--- ENDERECO
                  |       |
                  |       +--- FUNCIONARIO
                  |              |
                  |              +--- TELEFONE
                  |              |
                  |              +--- FILHO
                  |
                  +--- POSTO_TRABALHO
                          |
                          +--- FUNCIONARIO
FUNCAO
  |
  +--- CARGO
          |
          +--- FUNCIONARIO

⸻

7. Conclusão

O Modelo Entidade-Relacionamento representa a estrutura final da base de dados normalizada.

As entidades foram separadas de acordo com as suas responsabilidades, permitindo organizar os dados dos funcionários, endereços, localização, cargos, funções, postos de trabalho, telefones e filhos.

O modelo serve como base para a implementação das tabelas em SQL e para a realização das consultas com JOIN.
