/*
====================================================================
Project     : LojaSQL
Description : Consultas utilizando Subqueries e agregações aninhadas
Database    : SQL Server
Author      : Débora
Created At  : 2026-03-03
File        : 06_Subqueries.sql
Schema      : dbo
====================================================================

Purpose:
Este arquivo contém consultas utilizando subqueries (consultas
aninhadas) combinadas com funções agregadas para comparação de
valores individuais com médias e mínimos calculados a partir
de conjuntos agregados.

Dependencies:
- Tabelas: clientes, pedidos, itens_pedido, produtos

*/


-- ==========================================
-- Produtos que venderam mais que a média de vendas geral
-- ========================================== 
SELECT 
    pr.nome
FROM produtos pr
JOIN itens_pedido i 
    ON i.id_produto = pr.id_produto
GROUP BY 
    pr.nome
HAVING 
    SUM(i.quantidade * pr.preco) > (
        SELECT 
            AVG(total_vendas)
        FROM (
            SELECT 
                SUM(ii.quantidade * pr1.preco) AS total_vendas
            FROM produtos pr1
            JOIN itens_pedido ii 
                ON ii.id_produto = pr1.id_produto
            GROUP BY 
                pr1.nome
        ) AS media_geral
    );


-- ==========================================
-- Clientes que gastaram mais que a média dos clientes
-- ========================================== 
SELECT 
    c.nome
FROM clientes c
JOIN pedidos p ON p.id_cliente = c.id_cliente
JOIN itens_pedido i ON i.id_pedido = p.id_pedido
JOIN produtos pr ON pr.id_produto = i.id_produto
GROUP BY 
    c.nome
HAVING 
    SUM(i.quantidade * pr.preco) > (
        /* SUBQUERY 1: Calcula a media dos valores encontrados */
        SELECT 
            AVG(total_vendas) 
        FROM (
            /* SUBQUERY 2: Gera uma lista com a soma de cada cliente */
            SELECT 
                SUM(i1.quantidade * pr1.preco) AS total_vendas
            FROM clientes c1
            JOIN pedidos p1 ON p1.id_cliente = c1.id_cliente
            JOIN itens_pedido i1 ON i1.id_pedido = p1.id_pedido
            JOIN produtos pr1 ON pr1.id_produto = i1.id_produto
            GROUP BY 
                c1.nome
        ) AS media_geral
    );


-- ==========================================
-- Clientes que gastaram mais que o cliente que menos gastou
-- ========================================== 
SELECT 
    c.nome
FROM clientes c
JOIN pedidos p 
    ON p.id_cliente = c.id_cliente
JOIN itens_pedido i 
    ON i.id_pedido = p.id_pedido
JOIN produtos pr 
    ON pr.id_produto = i.id_produto
GROUP BY 
    c.nome
HAVING 
    SUM(i.quantidade * pr.preco) > (
        SELECT 
            MIN(total_vendas) 
        FROM (
            SELECT 
                SUM(i1.quantidade * pr1.preco) AS total_vendas
            FROM pedidos p1
            JOIN itens_pedido i1 
                ON i1.id_pedido = p1.id_pedido
            JOIN produtos pr1 
                ON pr1.id_produto = i1.id_produto
            GROUP BY 
                p1.id_cliente
        ) AS resumo_vendas 
    );