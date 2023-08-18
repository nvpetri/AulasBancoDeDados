create schema senai_03;

use senai_03;

create table produtos 
(
	id_produtos integer primary key,
	nome varchar(100),
	preco numeric
) ;

insert into produtos (id_produtos, nome, preco) values 
(1, "Iphone 14", 5000),
(2, "Iphone 13", 4500),
(3, "Iphone 12", 3000),
(4, "Iphone 11", 2500),
(5, "Galaxy S20", 2000),
(6, "Galaxy S23", 4200),
(7, "LG K10", 800),
(8, "Xiaomi Redmi Note10", 1800),
(9, "Xiaomi Poco", 2300),
(10, "Nokia tijolao", 30);

select * from produtos;

create table pedido(
id_pedido integer primary key,
id_produto integer,
quantidade integer,

	foreign key(id_produto) references produtos (id_produtos)
);

insert into pedido (id_pedido, id_produto, quantidade) values
(1,1,300),
(2,2,70),
(3,3,150),
(4,4,30),
(5,5,15),
(6,6,48),
(7,7,208),
(8,8,38),
(9,9,62),
(10,10,75);

select * from pedido;

select nome,preco from produtos inner join pedido on 
pedido.id_produto=produtos.id_produtos where id_pedido=1;