/*
  Project  : Projeto SQL - LojaSQL
  Database : SQL Server
  Author   : Débora
  File     : 02_insert_data.sql
*/

USE LojaSQL;
GO

-- ========================================
-- CLIENTES
-- ========================================
INSERT INTO clientes VALUES
(1, 'Ana Souza', 'João Pessoa', 'PB'),
(2, 'Carlos Lima', 'Recife', 'PE'),
(3, 'Mariana Alves', 'Natal', 'RN'),
(4, 'João Pedro', 'Fortaleza', 'CE'),
(5, 'Fernanda Costa', 'Campina Grande', 'PB'),
(6, 'Lucas Martins', 'Salvador', 'BA'),
(7, 'Patrícia Gomes', 'Maceió', 'AL'),
(8, 'Rafael Santos', 'Aracaju', 'SE');

-- ========================================
-- PRODUTOS
-- ========================================
INSERT INTO produtos VALUES
(1, 'Notebook Dell', 'Eletrônicos', 4500.00),
(2, 'Mouse Logitech', 'Eletrônicos', 120.00),
(3, 'Teclado Mecânico', 'Eletrônicos', 350.00),
(4, 'Cadeira Gamer', 'Móveis', 980.00),
(5, 'Mesa Escritório', 'Móveis', 750.00),
(6, 'Monitor 24"', 'Eletrônicos', 1100.00),
(7, 'Fone Bluetooth', 'Eletrônicos', 280.00),
(8, 'HD Externo 1TB', 'Eletrônicos', 420.00);

-- ========================================
-- PEDIDOS
-- ========================================
INSERT INTO pedidos VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-15'),
(3, 3, '2024-02-02'),
(4, 1, '2024-02-10'),
(5, 4, '2024-03-01'),
(6, 5, '2024-03-12'),
(7, 6, '2024-04-05'),
(8, 2, '2024-04-18'),
(9, 7, '2024-05-03'),
(10, 8, '2024-05-20'),
(11, 3, '2024-06-02'),
(12, 1, '2024-06-15');

-- ========================================
-- ITENS DO PEDIDO
-- ========================================
INSERT INTO itens_pedido VALUES
(1, 1, 1, 1),  
(2, 1, 2, 2),  

(3, 2, 4, 1),  
(4, 2, 2, 1),

(5, 3, 3, 1),
(6, 3, 7, 2),

(7, 4, 6, 1),

(8, 5, 5, 1),
(9, 5, 2, 1),

(10, 6, 8, 2),

(11, 7, 1, 1),
(12, 7, 6, 1),

(13, 8, 7, 3),

(14, 9, 2, 2),
(15, 9, 3, 1),

(16, 10, 4, 1),

(17, 11, 6, 2),

(18, 12, 1, 1),
(19, 12, 8, 1);