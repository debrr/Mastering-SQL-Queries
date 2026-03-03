/*
====================================================================
Project     : LojaSQL
Description : Consultas de ranking utilizando ORDER BY, TOP e OFFSET
Database    : SQL Server
Author      : Débora
Created At  : 2026-03-03
File        : 07_Ranking_manual.sql
Schema      : dbo
====================================================================

Purpose:
Este arquivo contém consultas voltadas para geração de rankings
manuais utilizando ORDER BY, TOP, OFFSET/FETCH e subqueries
correlacionadas para identificação de maiores valores,
posições específicas e máximos por grupo.

Dependencies:
- Tabelas: clientes, pedidos, itens_pedido, produtos

*/


-- ==========================================
-- Top 3 clientes que mais gastaram
-- ========================================== 
SELECT TOP 3
    c.nome,
    SUM(i.quantidade * pr.preco) AS faturamento_total
FROM clientes c
JOIN pedidos p ON p.id_cliente = c.id_cliente
JOIN itens_pedido i ON i.id_pedido = p.id_pedido
JOIN produtos pr ON pr.id_produto = i.id_produto
GROUP BY 
    c.nome
ORDER BY 
    faturamento_total DESC;


-- ==========================================
-- Segundo produto mais vendido
-- ========================================== 
SELECT 
    pr.nome,
    SUM(i.quantidade * pr.preco) AS total_vendas
FROM produtos pr
JOIN itens_pedido i ON i.id_produto = pr.id_produto
GROUP BY pr.nome
ORDER BY total_vendas DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;


-- ==========================================
-- Produto mais caro por categoria
-- ========================================== 
SELECT 
    p.nome, 
    p.categoria, 
    p.preco
FROM produtos p
WHERE p.preco = (
    SELECT MAX(p2.preco) 
    FROM produtos p2 
    WHERE p2.categoria = p.categoria
)
ORDER BY p.categoria;