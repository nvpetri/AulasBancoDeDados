create schema escola_sql_nicolas;

use escola_sql_nicolas;

create table alunos (
	id_aluno integer primary key not null,
    nome varchar(255),
    data_de_nascimento date,
    endereco_aluno varchar(255),
    tel_aluno varchar(20)
);
create table professores (
	id_professor integer primary key not null,
    nome varchar(255),
    data_de_contratacao date
);

create table disciplinas (
	id_disciplinas integer primary key not null,
    nome_disciplina varchar(100),
    codigo_disciplina varchar(20),
    carga_horaria int
);

create table turmas(
	turma_id integer primary key not null,
    ano_escolar int,
    id_disciplinas int,
    professores_id int,
    
    foreign key (id_disciplinas) references disciplinas (id_disciplinas),
    foreign key (professores_id) references professores (id_professor)
);

create table notas (
	id_nota int primary key,
    id_aluno int,
    id_disciplinas int,
    data_avaliacao date,
    nota float,
    
    foreign key (id_aluno) references alunos (id_aluno),
    foreign key (id_disciplinas) references disciplinas (id_disciplinas)
);

create table presenca(
	id_presenca int primary key not null,
    id_aluno int,
    id_turma int,
    data_aula date,
    presenca varchar(5),
    
    foreign key (id_aluno) references alunos (id_aluno),
    foreign key (id_turma) references turmas (turma_id)
);

INSERT INTO alunos (id_aluno, nome, data_de_nascimento, endereco_aluno, tel_aluno)
VALUES
 (1, 'João Silva', '1995-03-15', 'Rua A, 123', '(11) 1234-5678'),
 (2, 'Maria Santos', '1998-06-22', 'Av. B, 456', '(11) 9876-5432'),
 (3, 'Carlos Oliveira', '1997-01-10', 'Rua C, 789', '(11) 5678-1234'),
 (4, 'Ana Pereira', '1999-09-05', 'Av. D, 987', '(11) 4321-8765'),
 (5, 'Pedro Rodrigues', '1996-07-18', 'Rua E, 654', '(11) 3456-7890'),
 (6, 'Sara Costa', '2000-04-30', 'Av. F, 321', '(11) 8765-4321');
 
 INSERT INTO professores (id_professor, nome, data_de_contratacao)
VALUES
 (1, 'Ana Lima', '2010-08-15'),
 (2, 'José Santos', '2005-04-20'),
 (3, 'Márcio Oliveira', '2012-11-10'),
 (4, 'Cláudia Pereira', '2014-03-25'),
 (5, 'Fernanda Rodrigues', '2018-09-08'),
 (6, 'Ricardo Costa', '2019-12-01');
 
 INSERT INTO disciplinas (id_disciplinas, nome_disciplina, codigo_disciplina, carga_horaria)
VALUES
 (1, 'Programação em C', 'PC101', 60),
 (2, 'Banco de Dados', 'BD201', 45),
 (3, 'Desenvolvimento Web', 'DW301', 75),
 (4, 'Algoritmos Avançados', 'AA401', 60),
 (5, 'Inteligência Artificial', 'IA501', 90),
 (6, 'Segurança da Informação', 'SI601', 45);
 
 INSERT INTO turmas (turma_id, ano_escolar, id_disciplinas, professores_id)
VALUES
 (101, 2023, 1, 1),
 (102, 2023, 2, 2),
 (103, 2023, 3, 3),
 (104, 2023, 4, 4),
 (105, 2023, 5, 5),
 (106, 2023, 6, 6);
 
 INSERT INTO notas (id_nota, id_aluno, id_disciplinas, data_avaliacao, nota)
VALUES
 (1, 1, 1, '2023-03-10', 85),
 (2, 2, 1, '2023-03-10', 78),
 (3, 3, 1, '2023-03-10', 92),
 (4, 4, 2, '2023-03-15', 88),
 (5, 5, 2, '2023-03-15', 95),
 (6, 6, 2, '2023-03-15', 75);


