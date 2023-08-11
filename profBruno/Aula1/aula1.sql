create schema escola;

use escola;

create table cursos
(

	id integer primary key not null auto_increment,
    nome varchar(50) not null,
    matricula integer not null,
    descricao varchar(200) not null,
    data_inicio varchar(10) not null

);

insert into cursos (nome, matricula, descricao, data_inicio) values
("Desenvolvimento De Sistemas", 12345, "É um otimo curso", "20/10/2023"),
("Logistica", 12254, "É um curso chato", "18/10/2023"),
("Banco de Dados", 23111, "É um otimo curso, melhor ainda com o Sesi", "05/11/2023"),
("Power BI", 22111, "É um otimo curso mas pode melhorar", "10/10/2023"),
("Excel", 22244, "Já foi um otimo curso", "09/12/2023");

select * from cursos;

select nome, matricula from cursos where id= 4;

select nome, descricao from cursos where data_inicio = "05/11/2023";

update cursos set nome = "Informática Basica" where id = 3;

select * from cursos;

update cursos set matricula = 33333 where id = 4;

update cursos set matricula = 12121 where id = 5;

alter table cursos drop column data_inicio