/*
====================================================================
Project     : LojaSQL
Description : Consultas utilizando JOIN combinado com GROUP BY
Database    : SQL Server
Author      : Débora
Created At  : 2026-03-03
File        : 04_JOIN_com_GROUP_BY.sql
Schema      : dbo
====================================================================

Purpose:
Este arquivo contém consultas demonstrando o uso de JOIN em conjunto
com GROUP BY para cálculo de totais, faturamento, agregações por
cliente, categoria e produto, além de consultas com LEFT JOIN
para identificação de registros sem correspondência.

Dependencies:
- Tabelas: clientes, pedidos, itens_pedido, produtos

*/


-- ==========================================
-- Total gasto por cliente
-- ========================================== 
SELECT c.nome, SUM(i.quantidade * pp.preco) AS total_gasto_por_cliente FROM itens_pedido i
JOIN produtos pp ON pp.id_produto = i.id_produto
JOIN pedidos p   ON p.id_pedido = i.id_pedido
JOIN clientes c  ON c.id_cliente = p.id_cliente
GROUP BY c.nome

-- ==========================================
-- Total faturado por categoria
-- ========================================== 
SELECT pp.categoria, SUM(pp.preco*i.quantidade) AS total_faturado FROM produtos pp
JOIN itens_pedido i ON i.id_produto = pp.id_produto
GROUP BY pp.categoria


-- ==========================================
-- Quantidade total vendida por produto
-- ========================================== 
SELECT pp.nome, SUM(i.quantidade) AS qtd_vendida FROM produtos pp
JOIN itens_pedido i ON i.id_produto = pp.id_produto
GROUP BY pp.nome


-- ==========================================
-- Clientes que nunca fizeram pedido
-- ========================================== 
SELECT nome FROM clientes c
LEFT JOIN pedidos p ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL
GROUP BY nome

-- ==========================================
-- Produtos que nunca foram vendidos
-- ========================================== 
SELECT nome FROM produtos p
LEFT JOIN itens_pedido i ON i.id_produto = p.id_produto
WHERE i.id_produto IS NULL