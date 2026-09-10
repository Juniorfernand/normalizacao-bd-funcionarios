# Análise da Normalização — Sistema de Gestão de Funcionários

## 1. Introdução

A base de dados inicial apresenta os dados dos funcionários numa única tabela.

A tabela contém dados pessoais, endereço, informações profissionais, filhos e contactos telefónicos.

Essa organização provoca repetição de dados e pode causar anomalias de inserção, atualização e remoção.

O processo de normalização será realizado até à Quarta Forma Normal (4FN).

---

## 2. Estrutura da tabela não normalizada — 0FN

A tabela original contém os seguintes grupos de informação.

### Dados pessoais

- Nome
- Data de nascimento
- NUIT
- BI
- Email

### Endereço

- Logradouro
- Bairro
- Cidade
- Província
- País

### Dados profissionais

- Cargo
- Código do Cargo
- Função
- Código da Função
- Posto de Trabalho
- Data de Admissão

### Filhos

- Filho 1
- Filho 2
- Filho 3

### Telefones

- Telefone 1
- Telefone 2
- Telefone 3

---

## 3. Problemas identificados

### 3.1 Grupos repetitivos

Existem grupos repetitivos para:

- Filhos;
- Telefones.

Por exemplo, um funcionário pode possuir Filho 1, Filho 2 e Filho 3.

O mesmo acontece com os telefones.

---

### 3.2 Redundância

Informações como cargo, função, cidade, província e país podem aparecer várias vezes para diferentes funcionários.

Essa repetição aumenta o espaço utilizado e pode provocar inconsistências.

---

### 3.3 Anomalia de atualização

Se o nome de uma função for alterado, seria necessário alterar vários registos.

Caso algum registo não fosse atualizado, a base ficaria inconsistente.

---

### 3.4 Anomalia de inserção

Pode ser necessário inserir informações profissionais ou de localização sem ainda existir um funcionário associado.

Na tabela original isso é difícil de representar corretamente.

---

### 3.5 Anomalia de remoção

Ao eliminar um funcionário, informações relacionadas exclusivamente a esse funcionário poderiam também ser perdidas.

---

# 4. Dependências funcionais

As principais dependências funcionais identificadas são:

```text
codigo_funcao → nome_funcao

codigo_cargo → nome_cargo, codigo_funcao

id_funcionario → nome, data_nascimento, nuit, bi, email,
                  endereco_id, codigo_cargo, id_posto,
                  data_admissao
