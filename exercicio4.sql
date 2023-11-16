create database exercicio4;

use exercicio4;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    quantidade_estoque int
);

CREATE TABLE vendas (
	id_venda int primary key auto_increment,
    data_venda datetime
);

CREATE TABLE itens_venda(
	id_item_venda int primary key auto_increment,
    id_venda int,
    foreign key (id_venda) references vendas(id_venda),
    id_produto int,
    foreign key (id_produto) references produtos(id_produto),
    quantidade int
);

DELIMITER //

CREATE TRIGGER tg_verificar_estoque
BEFORE INSERT ON itens_venda
FOR EACH ROW
BEGIN
    DECLARE estoque_disponivel INT;

    SELECT quantidade_estoque INTO estoque_disponivel
    FROM produtos
    WHERE id_produto = NEW.id_produto;

    IF NEW.quantidade > estoque_disponivel THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Produto fora de estoque';
    END IF;
END //

DELIMITER ;


insert into produtos(nome, quantidade_estoque)
values ('Sabão', '100');

insert into vendas(data_venda)
values ('2024/01/20');

insert into itens_venda(id_venda, id_produto, quantidade)
values ('1', '1', '200');