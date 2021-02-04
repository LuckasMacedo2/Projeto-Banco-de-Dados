CREATE DATABASE Agenda;

CREATE TABLE CodigoPostal ( 
	codigoPostal integer PRIMARY KEY,
	logradouro varchar(50) NOT NULL,
	cidade varchar(30) NOT NULL,
	estado char(2) NOT NULL CHECK( estado in ('GO', 'SP', 'PA', 'RO', 'MG'))
);

insert into CodigoPostal values (11111,'Rua 1 Casa 1', '1', 'GO');

insert into CodigoPostal values (22222,'Rua 2 Casa 2', '2', 'SP');

insert into CodigoPostal values (33333,'Rua 3 Casa 3', '3', 'PA');

insert into CodigoPostal values (44444,'Rua 4 Casa 4', '4', 'RO');

insert into CodigoPostal values (55555,'Rua 5 Casa 5', '5', 'MG');

select * from CodigoPostal;

insert into CodigoPostal values (55555,'Rua 5 Casa 5', '5', 'MG'); /*Erro de restrição de unicidade da chave primaria*/

insert into CodigoPostal values (66666,NULL, '5', 'MG'); /*Erro de invalidação de nulo*/

insert into CodigoPostal values (77777,'Rua 6 Casa 6', '5', 'RJ'); /*Erro pois o estado não existe na lista de check*/

CREATE TABLE Categoria (
	codigoCategoria integer PRIMARY KEY,
	descrCategoria varchar(30) NOT NULL UNIQUE
);

insert into Categoria values (11,'Trabalho');

insert into Categoria values (22,'Amigos');

insert into Categoria values (33,'Familia');

select * from Categoria;

insert into Categoria values (11,'Casa'); /*Erro de unicidade de chave primaria, a mesma tem de ser unica*/

insert into Categoria values (21,'Trabalho'); /*Erro a descrição tem de ser unica*/

insert into Categoria values (12,NULL); /*Erro a descrição não pode ser nula*/

CREATE TABLE Contato (
	codigoContato integer PRIMARY KEY,
	nome varchar(50) NOT NULL,
	telefone integer NOT NULL,
	email varchar(50) NOT NULL,
	sexo char(1) NOT NULL CHECK(sexo in ('F', 'M', 'f', 'm')),
	idade integer NOT NULL CHECK(idade between 0 and 150),
	codPostal integer NOT NULL,
        foreign KEY (codPostal) REFERENCES CodigoPostal (codigoPostal),
	codCategoria integer NOT NULL,
        foreign KEY (codCategoria) REFERENCES Categoria (codigoCategoria)
);



insert into Contato values (1,'Lucas',123456789, 'luckas@gmail.com', 'M',19,11111,11);

insert into Contato values (2,'Danilo',987654321, 'danilo@gmail.com', 'M',19,22222,22);

insert into Contato values (3,'Vitor',321321321, 'Vitor@gmail.com', 'M',19,22222,22);

insert into Contato values (4,'Higor',147147147, 'luckas@gmail.com', 'M',19,11111,11);

insert into Contato values (5,'Lusca',1111111, 'lsucas@gmail.com', 'M',21,33333,33);

insert into Contato values (6,'Senhor das estrelas',2222222, 'senhorDasEstrelas@gmail.com', 'M',18,33333,33);

select * from Contato;

/*Aula 2*/

/*
->Requisito não funcional == Requisito de Qualidade.
->De informãção: Descrição dos dados, determina a criação da tabela.
->Integridade relacional: Está relacionada a integridade dads relações entre as tabelas.
->Integridade de dados: Os dados armazenados devem ser integros, ou seja, os dados não apresentam falhas.
Ķ0.
*/
/*CodigoPostal*/
insert into CodigoPostal values (74123,'Rua Teste','Goiania', 'GO');

delete from CodigoPostal where codigoPostal = 74123;	/*Erro de integridade de chave estrangueira. Pois existe no Contato alguém com esse codigo postal*/

select * from CodigoPostal;

/*Contato*/
insert into Contato values (9,'Arroz',7894561, 'banana@gmail.com', 'm', 15, 74123, 11);

select * from Contato;

insert into Contato values (10,'Batata',7894561, 'batata@gmail.com', 'm', 15, 11111, 100);

/*Categoria*/
insert into Categoria values (13,'Sem categoria');

update Categoria set codigoCategoria = 100 where codigoCategoria = 13;

select * from Categoria;

update Categoria set codigoCategoria = 99 where codigoCategoria = 100; /*Erro de chave estrangueira, pois o dado também tem de ser alterado na outra tabela, pois trata-se de uma chave na outra tabela*/

update Categoria set descrCategoria = 'Categoria indefinida'  where codigoCategoria = 100;

/*Contato*/

/*O nome deve ser informado, pois não é um campo opcional*/
insert into Contato values (6,NULL,2222222, 'email@gmail.com', 'M',18,33333,33);

/*O e-mail deve ser informado*/
insert into Contato values (6,'teste' ,3212545, NULL, 'M',18,33333,33);

/*O sexo informado, não consta na lista de check*/
insert into Contato values (6,'teste' ,3212545, 'emailemail@gmail.com', 'B',18,33333,33);

/*A idade informada não faz parte do intervalo definido*/
insert into Contato values (6,'teste' ,3212545, 'emailemail@gmail.com', 'F',180,33333,33);

/*A chave estrangueira não existe na tabela originaria*/
insert into Contato values (7,'teste' ,3212545, 'emailemail@gmail.com', 'F',100,33333,99);

/*Incluir 4 códigos postais, 3 categorias e 10 contatos*/
