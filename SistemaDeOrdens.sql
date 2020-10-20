DROP SCHEMA IF EXISTS sistema_de_ordens_de_servico;

CREATE SCHEMA sistema_de_ordens_de_servico;
USE sistema_de_ordens_de_servico;

CREATE TABLE usuario(
pk_idUsuario SMALLINT(3) UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
telefone INT(9) UNSIGNED NOT NULL,
ddd TINYINT(2) UNSIGNED,
senha VARCHAR(7) NOT NULL,
PRIMARY KEY(pk_idUsuario)
);

CREATE TABLE cliente(
pk_idCliente MEDIUMINT(7) UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
cpf_cnpj BIGINT(14) UNSIGNED,
nome VARCHAR(50) NOT NULL,
endereco VARCHAR(50),
email VARCHAR(100),
statusInativo BOOLEAN,
telefone INT(9) UNSIGNED NOT NULL,
ddd TINYINT(2) UNSIGNED,
PRIMARY KEY(pk_idCliente)
);

CREATE TABLE ordem(
pk_idOrdem MEDIUMINT(7) UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
descricaoProduto VARCHAR(255) NOT NULL,
problemasRelatados VARCHAR(255) NOT NULL,
servicosRealizados VARCHAR(255) NOT NULL,
observacoes VARCHAR(255),
dataInicio DATE NOT NULL,
dataConclusao DATE,
horaInicio TIME NOT NULL,
horaConclusao TIME,
statusOrdem TINYINT(1) UNSIGNED NOT NULL,
fk_idCliente MEDIUMINT(7) UNSIGNED NOT NULL,
PRIMARY KEY(pk_idOrdem),
FOREIGN KEY (fk_idCliente) REFERENCES cliente(pk_idCliente)
);

CREATE TABLE statusOrdens (
pk_idStatus MEDIUMINT(7) UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
dataAlteracao DATETIME NOT NULL,
fk_idOrdem MEDIUMINT(7) UNSIGNED NOT NULL,
PRIMARY KEY(pk_idStatus),
FOREIGN KEY (fk_idOrdem) REFERENCES ordem(pk_idOrdem)
);

INSERT INTO usuario (nome, email, telefone, ddd, senha)
VALUES ('admin', 'marinakraehh@gmail.com', 11111111, 1, '5'); /*o login é 11111111 e a senha é 1 */

INSERT INTO cliente (cpf_cnpj, nome, endereco, email, statusInativo, telefone, ddd)
VALUES (03076534512, 'Nadia Luio', 'Rua tal','nadia@gmail.com', 0, 999876543, 51);

INSERT INTO cliente (cpf_cnpj, nome, endereco, email, statusInativo, telefone, ddd)
VALUES (03543678902, 'Joãozinho Freitas', '','joao@gmail.com', 0, 999877654, 51);

INSERT INTO cliente (cpf_cnpj, nome, endereco, email, statusInativo, telefone, ddd)
VALUES (89093678902, 'Kleiton Vick', 'Bairro Cidade Nova','', 0, 999854543, 51);

INSERT INTO ordem (descricaoProduto, problemasRelatados, servicosRealizados, observacoes,
dataInicio, dataConclusao, horaInicio, horaConclusao, statusOrdem, fk_idCliente)
VALUES ('Notebook Dell Vostro 1415', 'Não inicia o windows', 'Formatação', 'Precisa trocar o teclado', '2019-09-12', null, '09:00', null, 0, 1);

INSERT INTO ordem (descricaoProduto, problemasRelatados, servicosRealizados, observacoes,
dataInicio, dataConclusao, horaInicio, horaConclusao, statusOrdem, fk_idCliente)
VALUES ('Impressora epson, fonte', 'Mastiga a folha', 'Abertura, limpeza interna', '', '2019-11-12', null, '17:00', null, 1, 2);

INSERT INTO ordem (descricaoProduto, problemasRelatados, servicosRealizados, observacoes,
dataInicio, dataConclusao, horaInicio, horaConclusao, statusOrdem, fk_idCliente)
VALUES ('Teclado microsoft', 'Tecla enter não funciona', '', '', '2019-11-02', '2019-11-10', '08:00', '11:00', 4, 3);
