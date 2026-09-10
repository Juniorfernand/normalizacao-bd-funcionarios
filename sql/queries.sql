-- ============================================================
-- NORMALIZAÇÃO DE BASE DE DADOS
-- SISTEMA DE GESTÃO DE FUNCIONÁRIOS
-- Universidade Licungo
-- Estudante: Alberto Massada Fernando Júnior
-- ============================================================

USE gestao_funcionarios;


-- ============================================================
-- CONSULTA 1
-- Funcionários + Cargo + Função
-- ============================================================

SELECT
    f.id_funcionario,
    f.nome AS funcionario,
    c.codigo_cargo,
    c.nome_cargo AS cargo,
    fu.codigo_funcao,
    fu.nome_funcao AS funcao
FROM funcionario f
INNER JOIN cargo c
    ON f.codigo_cargo = c.codigo_cargo
INNER JOIN funcao fu
    ON c.codigo_funcao = fu.codigo_funcao
ORDER BY f.id_funcionario;


-- ============================================================
-- CONSULTA 2
-- Funcionários + Endereço + Cidade + Província + País
-- ============================================================

SELECT
    f.id_funcionario,
    f.nome AS funcionario,
    e.logradouro,
    e.bairro,
    ci.nome AS cidade,
    p.nome AS provincia,
    pa.nome AS pais
FROM funcionario f
INNER JOIN endereco e
    ON f.endereco_id = e.id_endereco
INNER JOIN cidade ci
    ON e.cidade_id = ci.id_cidade
INNER JOIN provincia p
    ON ci.provincia_id = p.id_provincia
INNER JOIN pais pa
    ON p.pais_id = pa.id_pais
ORDER BY f.id_funcionario;


-- ============================================================
-- CONSULTA 3
-- Funcionários + Telefones
-- ============================================================

SELECT
    f.id_funcionario,
    f.nome AS funcionario,
    t.numero AS telefone,
    t.tipo
FROM funcionario f
INNER JOIN telefone t
    ON f.id_funcionario = t.funcionario_id
ORDER BY f.id_funcionario, t.id_telefone;


-- ============================================================
-- CONSULTA 4
-- Funcionários + Filhos
-- ============================================================

SELECT
    f.id_funcionario,
    f.nome AS funcionario,
    fi.nome AS filho
FROM funcionario f
INNER JOIN filho fi
    ON f.id_funcionario = fi.funcionario_id
ORDER BY f.id_funcionario, fi.id_filho;


-- ============================================================
-- CONSULTA 5
-- Funcionários + Cargo + Função + Posto de Trabalho
-- ============================================================

SELECT
    f.id_funcionario,
    f.nome AS funcionario,
    c.nome_cargo AS cargo,
    fu.nome_funcao AS funcao,
    pt.nome_posto AS posto_trabalho,
    ci.nome AS cidade
FROM funcionario f
INNER JOIN cargo c
    ON f.codigo_cargo = c.codigo_cargo
INNER JOIN funcao fu
    ON c.codigo_funcao = fu.codigo_funcao
INNER JOIN posto_trabalho pt
    ON f.id_posto = pt.id_posto
INNER JOIN cidade ci
    ON pt.cidade_id = ci.id_cidade
ORDER BY f.id_funcionario;


-- ============================================================
-- CONSULTA 6
-- Reconstrução geral das informações dos funcionários
-- ============================================================

SELECT
    f.id_funcionario,
    f.nome AS funcionario,
    f.data_nascimento,
    f.nuit,
    f.bi,
    f.email,

    e.logradouro,
    e.bairro,
    ci.nome AS cidade,
    p.nome AS provincia,
    pa.nome AS pais,

    c.nome_cargo AS cargo,
    fu.nome_funcao AS funcao,

    pt.nome_posto AS posto_trabalho,
    f.data_admissao

FROM funcionario f

INNER JOIN endereco e
    ON f.endereco_id = e.id_endereco

INNER JOIN cidade ci
    ON e.cidade_id = ci.id_cidade

INNER JOIN provincia p
    ON ci.provincia_id = p.id_provincia

INNER JOIN pais pa
    ON p.pais_id = pa.id_pais

INNER JOIN cargo c
    ON f.codigo_cargo = c.codigo_cargo

INNER JOIN funcao fu
    ON c.codigo_funcao = fu.codigo_funcao

INNER JOIN posto_trabalho pt
    ON f.id_posto = pt.id_posto

ORDER BY f.id_funcionario;


-- ============================================================
-- CONSULTA 7
-- Quantidade de funcionários por cargo
-- ============================================================

SELECT
    c.nome_cargo AS cargo,
    COUNT(f.id_funcionario) AS quantidade_funcionarios
FROM cargo c
LEFT JOIN funcionario f
    ON c.codigo_cargo = f.codigo_cargo
GROUP BY c.codigo_cargo, c.nome_cargo
ORDER BY quantidade_funcionarios DESC;


-- ============================================================
-- CONSULTA 8
-- Quantidade de telefones por funcionário
-- ============================================================

SELECT
    f.id_funcionario,
    f.nome AS funcionario,
    COUNT(t.id_telefone) AS quantidade_telefones
FROM funcionario f
LEFT JOIN telefone t
    ON f.id_funcionario = t.funcionario_id
GROUP BY f.id_funcionario, f.nome
ORDER BY f.id_funcionario;


-- ============================================================
-- CONSULTA 9
-- Quantidade de filhos por funcionário
-- ============================================================

SELECT
    f.id_funcionario,
    f.nome AS funcionario,
    COUNT(fi.id_filho) AS quantidade_filhos
FROM funcionario f
LEFT JOIN filho fi
    ON f.id_funcionario = fi.funcionario_id
GROUP BY f.id_funcionario, f.nome
ORDER BY f.id_funcionario;


-- ============================================================
-- CONSULTA 10
-- Funcionários por cidade de trabalho
-- ============================================================

SELECT
    ci.nome AS cidade,
    COUNT(f.id_funcionario) AS quantidade_funcionarios
FROM funcionario f
INNER JOIN posto_trabalho pt
    ON f.id_posto = pt.id_posto
INNER JOIN cidade ci
    ON pt.cidade_id = ci.id_cidade
GROUP BY ci.id_cidade, ci.nome
ORDER BY quantidade_funcionarios DESC;


-- ============================================================
-- FIM DAS CONSULTAS
-- ============================================================
