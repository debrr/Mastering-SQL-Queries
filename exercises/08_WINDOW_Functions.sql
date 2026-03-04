/*
====================================================================
Project     : LojaSQL
File        : 08_Window_Functions.sql
Author      : Débora
Created At  : 2026-03-04
Database    : SQL Server
Schema      : dbo
====================================================================

Description:
Conjunto de consultas analíticas utilizando Window Functions 
(ROW_NUMBER, RANK, DENSE_RANK, LAG e funções de agregação com OVER)
para análise de faturamento, ranking, evolução de vendas e 
participação percentual.

Objectives:
- Aplicar funções de ranking em diferentes contextos
- Calcular running total (acumulado temporal)
- Comparar valores atuais com anteriores utilizando LAG
- Calcular participação percentual dentro de partições
- Trabalhar agregações combinadas com funções janela

Dependencies:
Tabelas: clientes, pedidos, itens_pedido, produtos

Notes:
- Consultas focadas em análise de dados (perfil BI/Analytics)
- Uso combinado de GROUP BY e Window Functions

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
SELECT 
	ped.data_pedido, 
	SUM(i.quantidade * prod.preco) AS total_dia,
	SUM(SUM(i.quantidade * prod.preco)) OVER(ORDER BY ped.data_pedido) AS acumulado_vendas 
FROM produtos prod 
JOIN itens_pedido i ON i.id_produto = prod.id_produto 
JOIN pedidos ped ON ped.id_pedido = i.id_pedido 
GROUP BY ped.data_pedido ORDER BY ped.data_pedido ASC


-- ==========================================
-- LAG para comparar pedido atual com anterior do mesmo cliente
-- ========================================== 
SELECT  
    ped.data_pedido,

    SUM(i.quantidade * prod.preco) AS total_dia,

    -- acumulado ao longo dos dias
    SUM(SUM(i.quantidade * prod.preco)) 
        OVER (ORDER BY ped.data_pedido) 
        AS acumulado_vendas,

    -- diferença do dia atual para o dia anterior
    SUM(i.quantidade * prod.preco) 
        - LAG(SUM(i.quantidade * prod.preco), 1, 0) 
          OVER (ORDER BY ped.data_pedido) 
        AS evolucao_gasto

FROM produtos prod
JOIN itens_pedido i ON i.id_produto = prod.id_produto
JOIN pedidos ped ON ped.id_pedido = i.id_pedido

GROUP BY ped.data_pedido

ORDER BY ped.data_pedido ASC;


-- ==========================================
-- Percentual que cada produto representa dentro da categoria
-- ========================================== 
SELECT
	prod.nome,
	prod.categoria,
	CONCAT(CAST(ROUND((SUM(i.quantidade * prod.preco) * 100.0) / SUM(SUM(i.quantidade * prod.preco)) OVER(PARTITION BY prod.categoria), 2) AS DECIMAL(10,2)), '%') AS porcentagem
	FROM produtos prod

JOIN itens_pedido i  ON i.id_produto = prod.id_produto
GROUP BY prod.nome, prod.categoria