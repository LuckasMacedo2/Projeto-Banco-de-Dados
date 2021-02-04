CREATE TABLE Professor (
	atuante varchar(5),
    matricula int,
    nome text,
    escola varchar(30),
    titulacao varchar(30),
    tipoContrato varchar(30)

);

SELECT * FROM Professor;

SELECT nome,matricula FROM Professor;

SELECT nome FROM Professor WHERE matricula > 1000;

INSERT INTO Professor VALUES ('SIM',18030,'PLINIO PIERRY BORGES MOTA','CBM','Especialista','Horista');

SELECT nome,matricula FROM Professor ORDER BY nome DESC;

INSERT INTO Professor VALUES ('SIM',17374,'MIRELLA ESTHER DA SILVA','CBM','Mestre(a)','Horista');

SELECT nome, count(*) FROM Professor GROUP BY nome HAVING count(*)>1; /*Seleciona todos os dados repetidos.*/

/*9) Para evitar dados repetidos dentro de uma tabela basta colocar uma restrição no proprio gerenciador de dados
ou no codigo que o utiliza, para tal no gerenciador basta colocar o comando unique no atributo que não deve ser repetido
onde se houver repetição será lançada uma exceção.*/





