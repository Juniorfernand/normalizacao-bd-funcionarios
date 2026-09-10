-- ============================================================
-- NORMALIZAÇÃO DE BASE DE DADOS
-- SISTEMA DE GESTÃO DE FUNCIONÁRIOS
-- Universidade Licungo
-- Estudante: Alberto Massada Fernando Júnior
-- ============================================================

-- Criar a base de dados
CREATE DATABASE IF NOT EXISTS gestao_funcionarios;

USE gestao_funcionarios;


-- ============================================================
-- 1. TABELA PAIS
-- ============================================================

CREATE TABLE pais (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);


-- ============================================================
-- 2. TABELA PROVINCIA
-- ============================================================

CREATE TABLE provincia (
    id_provincia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    pais_id INT NOT NULL,

    CONSTRAINT fk_provincia_pais
        FOREIGN KEY (pais_id)
        REFERENCES pais(id_pais)
);


-- ============================================================
-- 3. TABELA CIDADE
-- ============================================================

CREATE TABLE cidade (
    id_cidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    provincia_id INT NOT NULL,

    CONSTRAINT fk_cidade_provincia
        FOREIGN KEY (provincia_id)
        REFERENCES provincia(id_provincia)
);


-- ============================================================
-- 4. TABELA ENDERECO
-- ============================================================

CREATE TABLE endereco (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(150) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade_id INT NOT NULL,

    CONSTRAINT fk_endereco_cidade
        FOREIGN KEY (cidade_id)
        REFERENCES cidade(id_cidade)
);


-- ============================================================
-- 5. TABELA FUNCAO
-- ============================================================

CREATE TABLE funcao (
    codigo_funcao VARCHAR(10) PRIMARY KEY,
    nome_funcao VARCHAR(100) NOT NULL UNIQUE
);


-- ============================================================
-- 6. TABELA CARGO
-- ============================================================

CREATE TABLE cargo (
    codigo_cargo VARCHAR(10) PRIMARY KEY,
    nome_cargo VARCHAR(100) NOT NULL,
    codigo_funcao VARCHAR(10) NOT NULL,

    CONSTRAINT fk_cargo_funcao
        FOREIGN KEY (codigo_funcao)
        REFERENCES funcao(codigo_funcao)
);


-- ============================================================
-- 7. TABELA POSTO_TRABALHO
-- ============================================================

CREATE TABLE posto_trabalho (
    id_posto INT PRIMARY KEY AUTO_INCREMENT,
    nome_posto VARCHAR(100) NOT NULL,
    cidade_id INT NOT NULL,

    CONSTRAINT fk_posto_cidade
        FOREIGN KEY (cidade_id)
        REFERENCES cidade(id_cidade)
);


-- ============================================================
-- 8. TABELA FUNCIONARIO
-- ============================================================

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    nuit VARCHAR(20) NOT NULL UNIQUE,
    bi VARCHAR(30) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    endereco_id INT NOT NULL,
    codigo_cargo VARCHAR(10) NOT NULL,
    id_posto INT NOT NULL,
    data_admissao DATE NOT NULL,

    CONSTRAINT fk_funcionario_endereco
        FOREIGN KEY (endereco_id)
        REFERENCES endereco(id_endereco),

    CONSTRAINT fk_funcionario_cargo
        FOREIGN KEY (codigo_cargo)
        REFERENCES cargo(codigo_cargo),

    CONSTRAINT fk_funcionario_posto
        FOREIGN KEY (id_posto)
        REFERENCES posto_trabalho(id_posto)
);


-- ============================================================
-- 9. TABELA TELEFONE
-- ============================================================

CREATE TABLE telefone (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    tipo VARCHAR(30),

    CONSTRAINT fk_telefone_funcionario
        FOREIGN KEY (funcionario_id)
        REFERENCES funcionario(id_funcionario)
        ON DELETE CASCADE
);


-- ============================================================
-- 10. TABELA FILHO
-- ============================================================

CREATE TABLE filho (
    id_filho INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT NOT NULL,
    nome VARCHAR(150) NOT NULL,

    CONSTRAINT fk_filho_funcionario
        FOREIGN KEY (funcionario_id)
        REFERENCES funcionario(id_funcionario)
        ON DELETE CASCADE
);


-- ============================================================
-- DADOS DE REFERÊNCIA
-- ============================================================

-- PAIS
INSERT INTO pais (nome)
VALUES ('Moçambique');


-- PROVINCIAS
INSERT INTO provincia (nome, pais_id)
VALUES
('Maputo Cidade', 1),
('Maputo Província', 1),
('Gaza', 1),
('Inhambane', 1),
('Sofala', 1),
('Nampula', 1),
('Manica', 1),
('Tete', 1),
('Zambézia', 1),
('Cabo Delgado', 1);


-- CIDADES
INSERT INTO cidade (nome, provincia_id)
VALUES
('Maputo', 1),
('Matola', 2),
('Chókwè', 3),
('Maxixe', 4),
('Beira', 5),
('Nampula', 6),
('Chimoio', 7),
('Tete', 8),
('Quelimane', 9),
('Pemba', 10);


-- ENDERECOS
INSERT INTO endereco (logradouro, bairro, cidade_id)
VALUES
('Av. Julius Nyerere, n.º 245', 'Sommerschield', 1),
('Rua da Resistência, n.º 8', 'Polana Caniço', 1),
('Av. Samora Machel, n.º 12', 'Fomento', 2),
('Rua 3, n.º 56', 'Chókwè-Sede', 3),
('Av. Eduardo Mondlane, n.º 301', 'Maxixe-Sede', 4),
('Av. Poder Popular, n.º 77', 'Macuti', 5),
('Rua da Frescura, n.º 19', 'Ponta Gêa', 5),
('Av. 25 de Setembro, n.º 150', 'Alto Maé', 1),
('Rua do Bagamoyo, n.º 5', 'Muhipiti', 6),
('Av. Josina Machel, n.º 200', 'Namahera', 6),
('Rua da Base, n.º 33', 'Chaimite', 5),
('Av. Kwame Nkrumah, n.º 410', 'Coop', 1),
('Rua de Chimoio, n.º 67', 'Chingussura', 7),
('Av. 7 de Setembro, n.º 90', 'Matundo', 8),
('Rua da Missão, n.º 24', 'Chalaua', 9),
('Av. Franqueza, n.º 18', 'Chuwaula', 10);


-- ============================================================
-- FUNCOES
-- ============================================================

INSERT INTO funcao (codigo_funcao, nome_funcao)
VALUES
('F01', 'Tecnologias de Informação'),
('F02', 'Finanças'),
('F03', 'Engenharia'),
('F04', 'Saúde'),
('F05', 'Educação'),
('F06', 'Logística'),
('F07', 'Recursos Humanos'),
('F08', 'Administração');


-- ============================================================
-- CARGOS
-- ============================================================

INSERT INTO cargo (codigo_cargo, nome_cargo, codigo_funcao)
VALUES
('C01', 'Técnico de Informática', 'F01'),
('C02', 'Contabilista', 'F02'),
('C03', 'Engenheiro Civil', 'F03'),
('C04', 'Enfermeiro', 'F04'),
('C05', 'Professor', 'F05'),
('C06', 'Motorista', 'F06'),
('C07', 'Gestor de Recursos Humanos', 'F07'),
('C08', 'Assistente Administrativo', 'F08');


-- ============================================================
-- POSTOS DE TRABALHO
-- ============================================================

INSERT INTO posto_trabalho (nome_posto, cidade_id)
VALUES
('Sede Maputo', 1),
('Delegação Matola', 2),
('Delegação Gaza', 3),
('Delegação Inhambane', 4),
('Delegação Beira', 5),
('Delegação Nampula', 6),
('Delegação Manica', 7),
('Delegação Tete', 8),
('Delegação Zambézia', 9),
('Delegação Cabo Delgado', 10);


-- ============================================================
-- FUNCIONARIOS
-- ============================================================

INSERT INTO funcionario
(nome, data_nascimento, nuit, bi, email, endereco_id, codigo_cargo, id_posto, data_admissao)
VALUES
('Amélia Fernanda Cossa', '1985-03-12', '100234567', '110100123456A', 'amelia.cossa@empresa.co.mz', 1, 'C01', 1, '2015-02-05'),

('Bernardo Alfredo Machava', '1979-07-22', '100345678', '110100234567B', 'bernardo.machava@empresa.co.mz', 2, 'C02', 1, '2010-09-14'),

('Celina Armando Sitoe', '1990-11-03', '100456789', '110200345678C', 'celina.sitoe@empresa.co.mz', 3, 'C08', 2, '2018-06-01'),

('Domingos Paulo Nhantumbo', '1982-01-30', '100567890', '110300456789D', 'domingos.nhantumbo@empresa.co.mz', 4, 'C06', 3, '2012-03-10'),

('Eugénia Marta Muchanga', '1988-05-18', '100678901', '110400567890E', 'eugenia.muchanga@empresa.co.mz', 5, 'C04', 4, '2016-08-20'),

('Fernando José Macuácua', '1975-09-25', '100789012', '110500678901F', 'fernando.macuacua@empresa.co.mz', 6, 'C03', 5, '2008-01-15'),

('Graça Isabel Zunguze', '1992-12-07', '100890123', '110600789012G', 'graca.zunguze@empresa.co.mz', 7, 'C05', 5, '2019-02-02'),

('Hélder António Cuamba', '1980-04-14', '100901234', '110700890123H', 'helder.cuamba@empresa.co.mz', 8, 'C07', 1, '2011-11-11'),

('Ivete Sara Chirindza', '1995-06-29', '101012345', '110800901234I', 'ivete.chirindza@empresa.co.mz', 9, 'C01', 6, '2020-07-03'),

('João Baptista Nhaca', '1978-08-09', '101123456', '110900012345J', 'joao.nhaca@empresa.co.mz', 10, 'C02', 6, '2009-05-25'),

('Lúcia Ermelinda Bila', '1991-02-16', '101234567', '111000123456K', 'lucia.bila@empresa.co.mz', 11, 'C08', 5, '2017-09-19'),

('Marcelino Inácio Tembe', '1983-10-21', '101345678', '111100234567L', 'marcelino.tembe@empresa.co.mz', 12, 'C03', 1, '2013-04-08'),

('Noémia Alzira Massingue', '1987-03-04', '101456789', '111200345678M', 'noemia.massingue@empresa.co.mz', 13, 'C04', 7, '2014-12-12'),

('Osvaldo Simião Ubisse', '1976-07-27', '101567890', '111300456789N', 'osvaldo.ubisse@empresa.co.mz', 14, 'C06', 8, '2006-10-30'),

('Paulina Fátima Uache', '1993-01-15', '101678901', '111400567890O', 'paulina.uache@empresa.co.mz', 15, 'C05', 9, '2021-09-09'),

('Ricardo Manuel Come', '1981-06-02', '101789012', '111500678901P', 'ricardo.come@empresa.co.mz', 16, 'C07', 10, '2010-07-17');


-- ============================================================
-- TELEFONES
-- ============================================================

INSERT INTO telefone (funcionario_id, numero, tipo)
VALUES
(1, '841234567', 'Principal'),
(1, '821234567', 'Alternativo'),

(2, '845678901', 'Principal'),
(2, '861122334', 'Alternativo'),

(3, '847890123', 'Principal'),
(3, '878901234', 'Alternativo'),

(4, '849012345', 'Principal'),

(5, '823456789', 'Principal'),
(5, '843456789', 'Alternativo'),
(5, '863456789', 'Trabalho'),

(6, '844567890', 'Principal'),
(6, '824567890', 'Alternativo'),

(7, '825678901', 'Principal'),
(7, '846789012', 'Alternativo'),

(8, '827890123', 'Principal'),
(8, '847890124', 'Alternativo'),

(9, '848901234', 'Principal'),

(10, '829012345', 'Principal'),
(10, '849012346', 'Alternativo'),
(10, '869012347', 'Trabalho'),

(11, '841122334', 'Principal');


-- ============================================================
-- FILHOS
-- ============================================================

INSERT INTO filho (funcionario_id, nome)
VALUES
(1, 'Cátia Cossa'),

(2, 'Nelson Machava'),
(2, 'Ivete Machava'),
(2, 'Suzana Machava'),

(3, 'Paulo Nhantumbo Jr'),
(3, 'Alzira Nhantumbo'),

(4, 'Marta Muchanga'),

(5, 'José Macuácua'),
(5, 'Beatriz Macuácua'),
(5, 'Adriano Macuácua'),

(6, 'António Cuamba Jr'),
(6, 'Filomena Cuamba'),

(7, 'Baptista Nhaca Jr'),

(8, 'Ermelinda Bila'),

(9, 'Inácio Tembe Jr'),
(9, 'Rosa Tembe'),

(10, 'Simião Ubisse Jr'),
(10, 'Alcinda Ubisse'),
(10, 'Custódio Ubisse'),

(11, 'Manuel Come Jr');


-- ============================================================
-- FIM DO SCHEMA
-- ============================================================
