/*
====================================================================
Project     : LojaSQL
Description : Consultas utilizando HAVING em conjunto com JOIN
Database    : SQL Server
Author      : Débora
Created At  : 2026-03-03
File        : 05_HAVING_com_JOIN.sql
Schema      : dbo
====================================================================

Purpose:
Este arquivo contém consultas que combinam JOIN, GROUP BY e HAVING
para filtrar resultados agregados com base em faturamento,
quantidade de vendas e critérios condicionais aplicados após
as agregações.

Dependencies:
- Tabelas: clientes, pedidos, itens_pedido, produtos

*/


-- ==========================================
-- Clientes com total gasto > 3000
-- ========================================== 
SELECT c.nome FROM clientes c
JOIN pedidos p ON p.id_cliente = c.id_cliente
JOIN itens_pedido i ON i.id_pedido = p.id_pedido
JOIN produtos pr ON pr.id_produto = i.id_produto
GROUP BY c.nome 
HAVING SUM(i.quantidade * pr.preco) > 3000


-- ==========================================
-- Categorias com faturamento > 10000
-- ========================================== 
SELECT pr.categoria FROM produtos pr
JOIN itens_pedido i ON i.id_produto = pr.id_produto
GROUP BY pr.categoria
HAVING SUM(i.quantidade * pr.preco) > 10000


-- ==========================================
-- Produtos vendidos em mais de 2 pedidos diferentes
-- ========================================== 
SELECT pr.nome FROM produtos pr
JOIN itens_pedido i ON i.id_produto = pr.id_produto
GROUP BY pr.nome
HAVING COUNT(DISTINCT i.id_pedido) > 1 


-- ==========================================
-- Estados com faturamento > 5000
-- ========================================== 
SELECT estado FROM clientes c
JOIN pedidos p ON p.id_cliente = c.id_cliente
JOIN itens_pedido i ON i.id_pedido = p.id_pedido
JOIN produtos pr ON pr.id_produto = i.id_produto
GROUP BY estado
HAVING SUM(i.quantidade * pr.preco) > 5000