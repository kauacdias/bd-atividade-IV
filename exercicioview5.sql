create database exercicioview5;

use exercicioview5;

create table clientes(
	idcliente int primary key auto_increment,
    nome varchar(255),
    endereco varchar(255),
    cidade varchar(255)
);

create table pagamentos(
	idpagamento int primary key auto_increment,
    datapagamento date,
	valorpagamento double,
    idcliente int,
    foreign key (idcliente) references clientes(idcliente)
);

insert into clientes (nome, cidade) 
values ('Lucas', 'Salvador');

insert into pagamentos (datapagamento, valorpagamento, idcliente)
values ('2023/11/11', '20.00', '1');

insert into pagamentos (datapagamento, valorpagamento, idcliente)
values ('2023/11/11', '30.00', '1');

insert into clientes (nome, cidade) 
values ('Luana', 'São Paulo');

insert into pagamentos (datapagamento, valorpagamento, idcliente)
values ('2023/11/12', '2.00', '2');

insert into pagamentos (datapagamento, valorpagamento, idcliente)
values ('2023/11/12', '10.00', '2');

create view relatorio_pagamentos_cidade as
select clientes.cidade as cidade, sum(pagamentos.valorpagamento) as valor
from clientes
left join pagamentos on clientes.idcliente = pagamentos.idcliente
group by clientes.idcliente;

select * from relatorio_pagamentos_cidade;