create database exercicioview4;

use exercicioview4;

create table categorias(
	idcategoria int primary key auto_increment,
    nome varchar(255),
    descricao varchar(255)
);

create table produtos(
	idproduto int primary key auto_increment,
    nome varchar(255),
	precounitario double,
    idcategoria int,
    foreign key (idcategoria) references categorias(idcategoria)
);

insert into categorias (nome, descricao) 
values ('Limpeza', 'Materias de limpeza');

insert into produtos (nome, precounitario, idcategoria)
values ('Desinfetante', '20.00', '1');

insert into produtos (nome, precounitario, idcategoria)
values ('Detergente', '20.00', '1');

insert into categorias (nome, descricao) 
values ('Papelaria', 'Materiais de papelaria');

insert into produtos (nome, precounitario, idcategoria)
values ('Papel', '2.00', '2');

insert into produtos (nome, precounitario, idcategoria)
values ('Grampeador', '10.00', '2');

create view relatorio_produtos_categoria as
select categorias.nome as categoria, count(produtos.idproduto) as quantidade
from categorias
left join produtos on categorias.idcategoria = produtos.idcategoria
group by categorias.idcategoria;

select * from relatorio_produtos_categoria;