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

SELECT id,nome,sigla,ativo,data_cadastro FROM estado;
