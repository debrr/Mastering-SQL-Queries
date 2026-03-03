/*
====================================================================
Project     : LojaSQL
Description : Consultas utilizando GROUP BY e funções agregadas
Database    : SQL Server
Author      : Débora
Created At  : 2026-03-03
File        : 01_group_by_basico.sql
Schema      : dbo
====================================================================

Purpose:
Este arquivo contém consultas demonstrando o uso de GROUP BY,
funções agregadas (COUNT, AVG, MAX) e subqueries relacionadas.

Dependencies:
- Tabelas: clientes, pedidos, itens_pedido, produtos

*/


-- ==========================================
-- Clientes existem por estado.
-- ==========================================
SELECT estado, COUNT(id_cliente) AS contagem_clientes FROM clientes
GROUP BY estado


-- ==========================================
-- Quantos pedidos cada cliente fez.
-- ==========================================
SELECT c.nome, COUNT(p.id_pedido) AS contagem_pedidos FROM clientes c
LEFT JOIN pedidos p ON p.id_cliente = c.id_cliente
GROUP BY c.nome


-- ==========================================
-- Preço médio por categoria.
-- ==========================================
SELECT categoria, 
       CAST(AVG(preco) AS DECIMAL(10,2)) AS preco_medio 
FROM produtos
GROUP BY categoria


-- ==========================================
-- Produto mais caro por categoria.
-- ==========================================
SELECT categoria, nome, preco
FROM produtos
WHERE preco IN (SELECT MAX(preco) FROM produtos GROUP BY categoria)

-- ==========================================
-- Quantos produtos existem por categoria.
-- ==========================================
SELECT categoria, COUNT(id_produto) AS contagem_produtos FROM produtos
GROUP BY categoria