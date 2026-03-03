/*
====================================================================
Project     : LojaSQL
Description : Consultas de ranking utilizando ORDER BY, TOP e OFFSET
Database    : SQL Server
Author      : Débora
Created At  : 2026-03-03
File        : 08_WINDOW_Functions.sql
Schema      : dbo
====================================================================

Purpose:


Dependencies:
- Tabelas: clientes, pedidos, itens_pedido, produtos

*/


-- ==========================================
-- ROW_NUMBER() por categoria
-- ========================================== 
SELECT 
    p.categoria, 
    SUM(i.quantidade * p.preco) AS faturamento,
    ROW_NUMBER() OVER(ORDER BY SUM(i.quantidade * p.preco) DESC) AS 'Rank'
FROM produtos p
JOIN itens_pedido i ON i.id_produto = p.id_produto
GROUP BY p.categoria;


-- ==========================================
-- RANK() de clientes por gasto
-- ========================================== 
SELECT 
    c.nome, 
    SUM(i.quantidade * p.preco) AS total_compas,
    RANK() OVER(
	ORDER BY SUM(i.quantidade * p.preco) DESC
	) AS 'Ranking'
FROM clientes c
JOIN pedidos pd ON pd.id_cliente = c.id_cliente
JOIN itens_pedido i ON pd.id_pedido = i.id_pedido
JOIN produtos p ON p.id_produto = i.id_produto
GROUP BY c.nome;


-- ==========================================
-- DENSE_RANK() por produto vendido
-- ========================================== 
SELECT 
    p.nome, 
    COUNT(i.quantidade) AS qtd_vendas,
	SUM(i.quantidade * p.preco) AS faturamento_total,
    DENSE_RANK() OVER(
	ORDER BY SUM(i.quantidade * p.preco) DESC
	) AS 'Ranking'
FROM produtos p
JOIN itens_pedido i ON p.id_produto = i.id_produto
GROUP BY p.nome;


-- ==========================================
-- Running total de vendas por data
-- ========================================== 



-- ==========================================
-- LAG para comparar pedido atual com anterior do mesmo cliente
-- ========================================== 



-- ==========================================
-- Percentual que cada produto representa dentro da categoria
-- ========================================== 