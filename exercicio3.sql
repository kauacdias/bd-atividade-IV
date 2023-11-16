create database exercicio3;

use exercicio3;

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    data_admissao DATE
);

DELIMITER //

CREATE TRIGGER tg_verificar_admissao
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
    IF NEW.data_admissao <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Data de admissão deve ser maior que a data atual';
    END IF;
END //

DELIMITER ;

insert into funcionarios(nome, data_admissao)
values ('Lucas', '2023/11/10');

insert into funcionarios(nome, data_admissao)
values ('Lucas', '2024/01/20');

select * from funcionarios;