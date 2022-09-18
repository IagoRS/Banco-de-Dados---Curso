/**
eliminando base de dados
só executa se existir
*/
DROP DATABASE if exists aula_banco;

CREATE DATABASE aula_banco;

use aula_banco;

CREATE TABLE estado(
id INT NOT NULL auto_increment
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
-- ,CHECK (ativo IN ('S', 'N') )
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N') ) -- CONSTRAINT OUT OF LINE -- regra com nome
);

INSERT INTO estado (nome,sigla) VALUES ('SAO PAULO', 'SP');
INSERT INTO estado (nome,sigla) VALUES ('Paraná', 'PR');

SELECT * FROM estado;


CREATE TABLE cidade (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastrao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
,CONSTRAINT cidade_unica UNIQUE (nome, estado_id)
);

INSERT INTO cidade (nome, estado_id) VALUES ('CURITIBA', 1);

SELECT * FROM CIDADE;

