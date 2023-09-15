create schema loja_carros;

use loja_carros;

create table carros (
	id_veiculos integer primary key auto_increment,
    nome_veiculos varchar(50),
    descricao_veiculos varchar(100),
    preco numeric,
    categoria varchar(50),
    quantidade_estoque integer
);

create table clientes(
	id_cliente integer primary key auto_increment,
    nome_cliente varchar(50),
    cpf_cliente varchar(20),
    endereco_cliente varchar(100),
    telefone_cliente varchar(50),
    email_cliente varchar(100)
);

create table compras(
	id_compra integer primary key auto_increment,
    id_cliente integer,
    data_compra varchar(50),
    total_compra numeric,
    
    foreign key(id_cliente) references clientes (id_cliente)
);

create table carros_compra (
	id_carro integer primary key auto_increment,
    id_compra integer,
    id_veiculos integer,
    quantidade integer,
    subtotal_compra numeric,
    
    foreign key(id_compra) references compras (id_compra),
    foreign key(id_veiculos) references carros (id_veiculos)
);

create table estoque (
	id_estoque integer primary key auto_increment,
    id_veiculos integer,
    quantidade_estoque integer,
    
    foreign key(id_veiculos) references carros (id_veiculos)
);

insert into carros (nome_veiculos, descricao_veiculos, preco, categoria, quantidade_estoque) values
("Porsche Panamera","Esportivo, bom para faer projetos e aceleros", 178000000, "Esportivo", 780),
("BMW 325i", "Carro bom para o dia a dia e também para uso como esportivo", 1200000, "Esportivo", 320),
("Toyota Corolla", "Carro bom para o dia a dia principalmente na versão hibrida", 1500000, "Hibrido", 500);

select * from carros;

select * from clientes;

insert into clientes (nome_cliente, cpf_cliente, endereco_cliente, telefone_cliente, email_cliente) values
("Gustavo Henrique", "456.712.668-87", "Rua João de Barros - 84, Carapicuíba", "(11)94002-8922", "gureidelas@gmail.com"),
("Nicolas Vasconcelos", "470.461.618-52", "Rua Bósnia - 25, Carapicuíba", "(11)94122-1523", "nicolaspetri18@gmail.com"),
("Raica Martinez", "541.842.777-78", "Rua Dom Juan - 150, Carapicuíba", "(11)99945-1234", "celso@celso.dev.br");

insert into compras (id_cliente, data_compra, total_compra) values
(2, "08/09/2022", 2212000),
(3, "20/12/2022", 178000000),
(1, "12/09/2021", 150000);

select * from compras;

insert into carros_compra (id_compra, id_veiculos, quantidade, subtotal_compra) values
(1, 1, 1, 2212000),
(2, 2, 4, 178000000),
(3, 3, 1, 150000);

select * from carros_compra;

insert into estoque (id_veiculos, quantidade_estoque) values
(1, 780),
(2, 320),
(3, 500);

select * from estoque;

select id_cliente, data_compra, total_compra, nome_cliente from compras, clientes where id_cliente=1;

select c.nome_veiculos, cp.data_compra from carros as c inner join compras as cp on cp.id_veiculos=c.id_veiculos where data_compra = "08/09/2022";

select nome_cliente from clientes ;

select p.nome_cliente, d.data_compra, d.total_compra from clientes as p inner join compras as d on d.id_cliente=p.id_cliente where nome_cliente = "Raica Martinez";

select sum(quantidade_estoque) from carros;

select max(subtotal_compra) from carros_compra;

select nome_veiculos from carros where preco between 1100000 and 1500000;

select * from carros where nome_veiculos like "BMW%"
