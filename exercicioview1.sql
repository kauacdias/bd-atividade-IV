create database exercicioview1;

use exercicioview1;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    email varchar(255),
    telefone int
);

CREATE TABLE pedidos (
	id_pedido int primary key auto_increment,
    id_cliente int,
    data_pedido date,
    valor_total varchar(255),
    foreign key (id_cliente) references clientes(id_cliente)
);

INSERT INTO clientes (nome, email, telefone) VALUES
('João', 'joao@email.com', 123456789),
('Maria', 'maria@email.com', 987654321),
('Santos', 'santos@email.com', 555111222),
('Souza', 'souza@email.com', 333444555);

INSERT INTO pedidos (id_cliente, data_pedido, valor_total) VALUES
(1, '2023-01-15', '150.00'),
(2, '2023-02-20', '200.50'),
(3, '2023-03-10', '75.80'),
(4, '2023-04-05', '120.25'),
(4, '2023-04-06', '100.00');

CREATE VIEW vw_relatorio_pedidos_cliente AS
SELECT
    c.nome AS nome_cliente,
    COUNT(p.id_pedido) AS numero_pedidos,
    SUM(p.valor_total) AS valor_total_gasto
FROM
    clientes c
    LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente;

SELECT * FROM vw_relatorio_pedidos_cliente;