create database exercicioview2;

use exercicioview2;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    preco_unitario double,
    categoria varchar(255)
);

CREATE TABLE estoque (
    id_produto int,
    quantidade int,
    foreign key (id_produto) references produtos(id_produto)
);

INSERT INTO produtos (nome, preco_unitario, categoria) VALUES
('Sabão', '4.80', 'limpeza'),
('Detergente', '10.70', 'limpeza'),
('Desinfetante', '12.90', 'limpeza'),
('Água sanitária', '8.80', 'limpeza');

INSERT INTO estoque (id_produto, quantidade) VALUES
(1, '10'),
(2, '10'),
(3, '20'),
(4, '4');

CREATE VIEW estoque_critico AS
SELECT
    p.nome AS nome_produto,
    e.quantidade AS quantidade_em_estoque
FROM
    produtos p
    JOIN estoque e ON p.id_produto = e.id_produto
WHERE
    e.quantidade < 10;

-- Seleção dos dados da view
SELECT * FROM estoque_critico;