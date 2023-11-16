create database exercicioview3;

use exercicioview3;

create table funcionario(
	idfuncionario int primary key auto_increment,
    nome varchar(255),
    cargo varchar(255),
    salario double
);

create table vendas(
	idvenda int primary key auto_increment,
    idfuncionario int,
    foreign key (idfuncionario) references funcionario(idfuncionario),
    datavenda date,
    valorvenda double
);

insert into funcionario (nome, cargo, salario) 
values ('Lucas', 'Atendente', '1400');

insert into vendas (idfuncionario, datavenda, valorvenda)
values ('1', '2023/11/10', '120');

insert into vendas (idfuncionario, datavenda, valorvenda)
values ('1', '2023/11/10', '120');

insert into vendas (idfuncionario, datavenda, valorvenda)
values ('1', '2023/11/10', '120');

create view relatorio_vendas_funcionario as
select funcionario.nome, count(vendas.idvenda), sum(valorvenda)
from funcionario 
inner join vendas;

select * from relatorio_vendas_funcionario;