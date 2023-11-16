create database exercicio1;

use exercicio1;

create table livros (
	id_livro int primary key auto_increment,
    titulo varchar(255),
    autor varchar(255),
    quantidade_estoque int
);

create table emprestimos (
	id_emprestimo int primary key auto_increment,
    id_livro int,
    foreign key (id_livro) references livros(id_livro),
    data_emprestimo datetime,
    data_devolucao datetime
);

DELIMITER //

CREATE TRIGGER tg_atualizar_estoque4
AFTER INSERT ON emprestimos
FOR EACH ROW
BEGIN
    UPDATE livros
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE livros.id_livro = NEW.id_livro;
END //

DELIMITER ;


insert into livros (titulo, autor, quantidade_estoque) 
values ('bora bahea', 'kaua dias', '20');

select * from livros;

insert into emprestimos (id_livro, data_emprestimo, data_devolucao)
values ('1', '2023-11-09', '2023-11-10');

select * from emprestimos;