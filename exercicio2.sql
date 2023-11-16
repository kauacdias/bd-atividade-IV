create database exercicio2;

use exercicio2;

create table contas (
	id_conta int primary key auto_increment,
    nome varchar(255),
    saldo decimal
);

create table transacoes (
	id_transacao int primary key auto_increment,
    id_conta int,
    foreign key (id_conta) references contas(id_conta),
    tipo varchar(255),
    valor decimal
);

DELIMITER //

CREATE TRIGGER tg_atualizar_saldo1
AFTER INSERT ON transacoes
FOR EACH ROW
BEGIN
    IF NEW.tipo = "entrada" THEN
        UPDATE contas SET saldo = saldo + NEW.valor 
        WHERE contas.id_conta = NEW.id_conta;
    ELSE
        UPDATE contas SET saldo = saldo - NEW.valor 
        WHERE contas.id_conta = NEW.id_conta;
    END IF;
END //

DELIMITER ;


insert into contas (nome, saldo) 
values ('barbara', '1000');

select * from contas;

insert into transacoes (id_conta, tipo, valor)
values ('2', 'entrada', '1000');

insert into transacoes (id_conta, tipo, valor)
values ('2', 'saida', '1200');

select * from transacoes