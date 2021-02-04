CREATE TABLE Livro (
	titulo text,
    autor varchar(50),
	codigo decimal(10),
	tradutor text,
    editora varchar(15),
    estado boolean
);

/*Diferentes tipos de seleção*/

SELECT * FROM Livro;

SELECT titulo, autor FROM Livro ORDER BY tradutor DESC;

SELECT * FROM Livro ORDER BY titulo DESC;

SELECT * FROM Livro ORDER BY titulo;

SELECT DISTINCT ON (titulo) autor FROM Livro; /*Mostra todos os dados não repetidos na tabela*/

SELECT titulo, autor FROM Livro GROUP BY titulo, autor; /*Seleciona as linhas a partir de grupos */

SELECT * FROM Livro WHERE titulo='C';

/*Inserindo Valores*/
INSERT INTO Livro VALUES('C++','O cara que criou o C++',1234321,'Google Tradutor','Saraiva', TRUE);

INSERT INTO Livro VALUES('C','O cara que criou o C',88,'Seu Zé','Saraiva', FALSE);

INSERT INTO Livro VALUES('Java','Javeiro',12123221,'Seu zé usando o Google tradutor','Basinga', FALSE);

INSERT INTO Livro VALUES('Linguagem AeroEspacial','Isaac Schineider',43,'Isaac Schineider','Cat e Dog', FALSE);

INSERT INTO Livro VALUES('Angiosperma','Higor',999999,'Auto Traduzivel','Não Precisa', TRUE);

INSERT INTO Livro VALUES('Briofita','Sem Autor',789789,'Yo no lo conosco','Blue Rider', FALSE);

INSERT INTO Livro VALUES('Livro deletado','Sem Autor',7889,'Yo no lo conosco','Blue Rider', FALSE);

INSERT INTO Livro VALUES('C','O cara que criou o C',90,'Seu Zé','Saraiva', FALSE);

/*Contando os repetidos*/

SELECT titulo, count(*) FROM Livro GROUP BY titulo HAVING count(*)>1; /*Seleciona todos os dados que são repetidos mais de uma vez*/

/*Deletando os repetidos*/
DELETE FROM Livro WHERE titulo = 'C';

/*Adicionando retrições*/

ALTER TABLE Livro ADD CONSTRAINT codigo UNIQUE(codigo);

/*Removendo restrições*/

ALTER TABLE Livro DROP CONSTRAINT codigo;

/*Adicionado novos atributos*/

ALTER TABLE Livro ADD tipo varchar(30);

ALTER TABLE Livro ADD del text;

/*Mudando dados Adicionados*/

UPDATE Livro SET autor='Tentativa' WHERE titulo='Briofita';

UPDATE Livro SET tipo='Fisiolofia' WHERE titulo='Angiosperma' OR titulo='Briofita';

UPDATE Livro SET tipo='Programação' WHERE titulo='C' OR titulo='C++' OR titulo='Java' OR titulo='Linguagem AeroEspacial'; 

/*Deletando dados*/

DELETE FROM Livro WHERE codigo = 7889;

/*Deletando atributos*/

ALTER TABLE Livro DROP del;

/*Alterando o tipo de colunas*/

ALTER TABLE Livro ALTER COLUMN editora TYPE text;

ALTER TABLE Livro ALTER COLUMN tradutor TYPE varchar(50);

/*Alterando o nome de colunas*/

ALTER TABLE Livro RENAME tipo TO especificacao;


/*Alterando o nome da tabela*/

ALTER TABLE Livro RENAME TO Livros;



