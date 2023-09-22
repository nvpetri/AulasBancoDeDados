create schema escola_sql_nicolas;

use escola_sql_nicolas;

create table alunos (
	aluno_id integer primary key not null,
    nome varchar(255),
    data_nascimento date,
    endereco varchar(255),
    telefone varchar(20)
);
create table professores (
	professor_id integer primary key not null,
    nome varchar(255),
    data_contratacao date
);

create table disciplinas (
	disciplina_id integer primary key not null,
    nome_disciplina varchar(100),
    codigo_disciplina varchar(20),
    carga_horaria int
);

create table turmas(
	turma_id integer primary key not null,
    ano_escolar int,
    disciplina_id int,
    professor_id int,
    
    foreign key (disciplina_id) references disciplinas (disciplina_id),
    foreign key (professor_id) references professores (professor_id)
);

create table notas (
	nota_id int primary key,
    aluno_id int,
    disciplina_id int,
    data_avaliacao date,
    nota float,
    
    foreign key (aluno_id) references alunos (aluno_id),
    foreign key (disciplina_id) references disciplinas (disciplina_id)
);

create table presenca(
	presenca_id int primary key not null,
    aluno_id int,
    turma_id int,
    data_aula date,
    presenca varchar(15),
    
    foreign key (aluno_id) references alunos (aluno_id),
    foreign key (turma_id) references turmas (turma_id)
);

INSERT INTO alunos (aluno_id, nome, data_nascimento, endereco, telefone)
VALUES
 (1, 'João Silva', '1995-03-15', 'Rua A, 123', '(11) 1234-5678'),
 (2, 'Maria Santos', '1998-06-22', 'Av. B, 456', '(11) 9876-5432'),
 (3, 'Carlos Oliveira', '1997-01-10', 'Rua C, 789', '(11) 5678-1234'),
 (4, 'Ana Pereira', '1999-09-05', 'Av. D, 987', '(11) 4321-8765'),
 (5, 'Pedro Rodrigues', '1996-07-18', 'Rua E, 654', '(11) 3456-7890'),
 (6, 'Sara Costa', '2000-04-30', 'Av. F, 321', '(11) 8765-4321');
 
INSERT INTO professores (professor_id, nome, data_contratacao)
VALUES
 (1, 'Ana Lima', '2010-08-15'),
 (2, 'José Santos', '2005-04-20'),
 (3, 'Márcio Oliveira', '2012-11-10'),
 (4, 'Cláudia Pereira', '2014-03-25'),
 (5, 'Fernanda Rodrigues', '2018-09-08'),
 (6, 'Ricardo Costa', '2019-12-01');

INSERT INTO disciplinas (disciplina_id, nome_disciplina, codigo_disciplina, carga_horaria)
VALUES
 (1, 'Programação em C', 'PC101', 60),
 (2, 'Banco de Dados', 'BD201', 45),
 (3, 'Desenvolvimento Web', 'DW301', 75),
 (4, 'Algoritmos Avançados', 'AA401', 60),
 (5, 'Inteligência Artificial', 'IA501', 90),
 (6, 'Segurança da Informação', 'SI601', 45);

INSERT INTO turmas (turma_id, ano_escolar, disciplina_id, professor_id)
VALUES
 (101, 2023, 1, 1),
 (102, 2023, 2, 2),
 (103, 2023, 3, 3),
 (104, 2023, 4, 4),
 (105, 2023, 5, 5),
 (106, 2023, 6, 6);
 
 INSERT INTO notas (nota_id, aluno_id, disciplina_id, data_avaliacao, nota)
VALUES
 (1, 1, 1, '2023-03-10', 85),
 (2, 2, 1, '2023-03-10', 78),
 (3, 3, 1, '2023-03-10', 92),
 (4, 4, 2, '2023-03-15', 88),
 (5, 5, 2, '2023-03-15', 95),
 (6, 6, 2, '2023-03-15', 75);
 
 INSERT INTO presenca (presenca_id, aluno_id, turma_id, data_aula, presenca)
VALUES
 (1, 1, 101, '2023-03-10', 'presente'),
 (2, 2, 101, '2023-03-10', 'presente'),
 (3, 3, 101, '2023-03-10', 'presente'),
 (4, 4, 102, '2023-03-15', 'ausente'),
 (5, 5, 102, '2023-03-15', 'presente'),
 (6, 6, 102, '2023-03-15', 'presente');

show tables;

select professores.nome from turmas
inner join disciplinas on turmas.disciplina_id=disciplinas.disciplina_id 
inner join professores on turmas.professor_id=professores.professor_id
where disciplinas.codigo_disciplina= "BD201";

select alunos.nome from alunos
inner join notas on alunos.aluno_id=notas.aluno_id
inner join disciplinas on notas.disciplina_id=disciplinas.disciplina_id
where codigo_disciplina="PC101" and notas.nota > 80;

select avg(notas.nota) from notas
inner join disciplinas on notas.disciplina_id=disciplina_id
where disciplinas.codigo_disciplina="IA501"

select alunos.nome from alunos
inner join presenca on alunos.aluno_id=presenca.aluno_id
inner join turmas on presenca.turma_id=turmas.turma_id
where turmas.turma_id=101 and presenca.data_aula="2023-03-10";

select alunos.nome, disciplinas.nome_disciplina from alunos
left join notas on alunos.aluno_id=notas.aluno_id
left join disciplinas on notas.disciplina_id=disciplinas.disciplina_id;

select nome_disciplina from disciplinas
where carga_horaria < 40 or carga_horaria > 100;

select alunos.nome from alunos
inner join notas on alunos.aluno_id=notas.aluno_id
where notas.nota is null;

select turmas.ano_escolar from turmas
inner join professores on turmas.professor_id=professores.professor_id
where professores.professor_id is null;

select avg(notas.nota) as media from notas 
inner join disciplinas on notas.disciplina_id=disciplinas.disciplina_id
where disciplinas.codigo_disciplina="DW301" and data_avaliacao between "2023-03-01" and '2023-03-31';

select disciplinas.nome_disciplina, disciplinas.codigo_disciplina from disciplinas
left join notas on disciplinas.disciplina_id=notas.disciplina_id
left join alunos on notas.aluno_id=alunos.aluno_id
where notas.nota < 60;

select professores.nome from professores
inner join turmas on professores.professor_id=turmas.professor_id
inner join disciplinas on turmas.disciplina_id=disciplinas.disciplina_id
where not disciplinas.codigo_disciplina = "IA501";

select COUNT(alunos.aluno_id) as contagem, alunos.nome from alunos
inner join notas on alunos.aluno_id=notas.aluno_id
inner join disciplinas on notas.disciplina_id=disciplinas.disciplina_id
group by alunos.nome having contagem > 1;

select ano_escolar from turmas
inner join presenca on turmas.turma_id=presenca.turma_id
where presenca.presenca = "ausente";

select professores.nome from professores
inner join turmas on professores.professor_id=turmas.professor_id
inner join disciplinas on turmas.disciplina_id=disciplinas.disciplina_id
where codigo_disciplina="PC101" OR codigo_disciplina="BD201";

select alunos.nome from alunos
inner join presenca on alunos.aluno_id=presenca.aluno_id
where not presenca.presenca = "presente";

select d.nome_disciplina, d.codigo_disciplina, min(nota) as min_nota from disciplinas as d
inner join notas as n on d.disciplina_id=n.disciplina_id
group by d.nome_disciplina, d.codigo_disciplina having min_nota >=70;

select a.nome from alunos as a
inner join notas as n on a.aluno_id=n.aluno_id
inner join disciplinas as d on n.disciplina_id=d.disciplina_id
where codigo_disciplina="IA501" and n.nota between 80 and 90
or  codigo_disciplina="DW301" and n.nota between 80 and 90;

select p.nome from professores as p
inner join turmas as t on p.professor_id=t.professor_id
inner join disciplinas as d on t.disciplina_id=d.disciplina_id
where d.carga_horaria > 60;

select pre.data_aula from presenca as pre
inner join turmas as t on pre.presenca_id=t.turma_id
inner join disciplinas as d on t.disciplina_id=d.disciplina_id
where d.codigo_disciplina="AA401" 
and data_aula between '2023-04-01' and '2023-04-30'
and pre.presenca = "ausente";

select a.nome from alunos as a
inner join presenca as p on a.aluno_id=p.aluno_id
where not p.presenca="ausente";
