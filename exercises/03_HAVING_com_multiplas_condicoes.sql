
-- ==========================================
-- Clientes cujo pedido possui pelo menos 2 itens
-- e total gasto > 2.000
-- ==========================================
SELECT c.nome, i.id_pedido, SUM(i.quantidade) AS qtd_itens, SUM(i.quantidade * pp.preco) AS valor_pedido 
FROM itens_pedido i
JOIN produtos pp ON pp.id_produto = i.id_produto
JOIN pedidos p   ON p.id_pedido = i.id_pedido
JOIN clientes c  ON c.id_cliente = p.id_cliente
GROUP BY c.nome, i.id_pedido, i.quantidade
HAVING SUM(i.quantidade * pp.preco) > 2000 AND SUM(i.quantidade) >= 2


-- ==========================================
-- Produtos com pelo menos 2 vendas
-- e preco > 300
-- ==========================================
SELECT p.nome, SUM(i.quantidade) AS total_vendido, p.preco 
FROM produtos p
JOIN itens_pedido i ON i.id_produto = p.id_produto
GROUP BY p.nome, p.preco
HAVING SUM(i.quantidade) >= 2 AND p.preco > 300


-- ==========================================
-- Categorias com mais de 3 vendas
-- e faturamento > 5.000
-- ==========================================
SELECT p.categoria, SUM(i.quantidade) AS num_vendas, SUM(i.quantidade * p.preco) AS faturamento_total FROM produtos p
JOIN itens_pedido i ON p.id_produto = i.id_produto
GROUP BY p.categoria
HAVING SUM(i.quantidade) > 3 AND SUM(i.quantidade * p.preco) > 5000