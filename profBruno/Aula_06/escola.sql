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

