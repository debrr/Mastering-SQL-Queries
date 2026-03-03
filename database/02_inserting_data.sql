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
(9,  'Bruna Ferreira', 'São Paulo', 'SP'),
(10, 'Thiago Mendes', 'Rio de Janeiro', 'RJ'),
(11, 'Camila Rocha', 'Belo Horizonte', 'MG'),
(12, 'Eduardo Nunes', 'Curitiba', 'PR'),
(13, 'Juliana Barros', 'Porto Alegre', 'RS'),
(14, 'André Carvalho', 'Florianópolis', 'SC'),
(15, 'Larissa Pinto', 'Brasília', 'DF'),
(16, 'Gustavo Ribeiro', 'Goiânia', 'GO'),
(17, 'Renata Duarte', 'Campo Grande', 'MS'),
(18, 'Marcelo Teixeira', 'Cuiabá', 'MT'),
(19, 'Vanessa Araujo', 'Vitória', 'ES'),
(20, 'Felipe Cardoso', 'Belém', 'PA'),
(21, 'Isabela Moura', 'Manaus', 'AM'),
(22, 'Daniel Lopes', 'Porto Velho', 'RO'),
(23, 'Aline Castro', 'Palmas', 'TO'),
(24, 'Ricardo Almeida', 'Macapá', 'AP'),
(25, 'Paula Santos', 'Boa Vista', 'RR'),
(26, 'Caio Oliveira', 'Rio Branco', 'AC'),
(27, 'Sabrina Lima', 'São Luís', 'MA'),
(28, 'Pedro Henrique', 'Teresina', 'PI');


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
(9,  'Geladeira Frost Free', 'Eletrodomésticos', 3200.00),
(10, 'Micro-ondas 30L', 'Eletrodomésticos', 650.00),
(11, 'Air Fryer 5L', 'Eletrodomésticos', 550.00),
(12, 'Livro SQL Avançado', 'Livros', 120.00),
(13, 'Livro Power BI na Prática', 'Livros', 150.00),
(14, 'Curso Online Python', 'Cursos', 900.00),
(15, 'Webcam HD', 'Informática', 300.00),
(16, 'Headset Gamer', 'Acessórios', 450.00),
(17, 'Impressora Multifuncional', 'Informática', 1200.00),
(18, 'Tablet 10"', 'Eletrônicos', 1800.00),
(19, 'Smartphone 128GB', 'Eletrônicos', 2800.00),
(20, 'Smart TV 50"', 'Eletrônicos', 3500.00);


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
(13, 9,  '2024-06-20'),
(14, 10, '2024-06-25'),
(15, 11, '2024-07-01'),
(16, 12, '2024-07-05'),
(17, 13, '2024-07-08'),
(18, 14, '2024-07-12'),
(19, 15, '2024-07-15'),
(20, 16, '2024-07-18'),
(21, 17, '2024-07-20'),
(22, 18, '2024-07-22'),
(23, 19, '2024-07-25'),
(24, 20, '2024-07-28'),
(25, 21, '2024-08-01'),
(26, 22, '2024-08-03'),
(27, 23, '2024-08-05'),
(28, 24, '2024-08-07'),
(29, 25, '2024-08-10'),
(30, 26, '2024-08-12');


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
(20, 13, 19, 1),
(21, 13, 12, 1),

(22, 14, 20, 1),

(23, 15, 9, 1),

(24, 16, 14, 1),
(25, 16, 15, 2),

(26, 17, 10, 1),

(27, 18, 16, 1),
(28, 18, 2, 2),

(29, 19, 11, 1),

(30, 20, 18, 1),

(31, 21, 17, 1),

(32, 22, 13, 1),
(33, 22, 3, 1),

(34, 23, 19, 2),

(35, 24, 4, 1),

(36, 25, 6, 1),

(37, 26, 7, 2),

(38, 27, 5, 1),

(39, 28, 12, 3),

(40, 29, 1, 1),

(41, 30, 8, 2);