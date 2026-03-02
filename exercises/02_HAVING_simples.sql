-- ==========================================
-- Clientes que fizeram mais de 2 pedidos.
-- ==========================================
SELECT estado, COUNT(id_cliente) AS contagem_clientes FROM clientes
GROUP BY estado


-- ==========================================
-- Estados com mais de 1 cliente.
-- ==========================================
SELECT estado, COUNT(id_cliente) AS contagem_clientes FROM clientes
GROUP BY estado
HAVING COUNT(id_cliente) > 1


-- ==========================================
-- Produtos que venderam 3 unidades ou mais.
-- ==========================================
SELECT p.nome, COUNT(i.id_item) AS qtd_vendas FROM produtos p
JOIN itens_pedido i ON i.id_produto = p.id_produto
GROUP BY p.nome
HAVING COUNT(i.id_item) >= 3


-- ==========================================
-- Categorias com mais de 2 produtos.
-- ==========================================
SELECT categoria, COUNT(id_produto) AS qtd_produtos FROM produtos
GROUP BY categoria
HAVING COUNT(id_produto) > 2


-- ==========================================
-- Clientes que compraram mais de 3 itens.
-- ==========================================
SELECT c.nome, COUNT(i.id_item) AS qtd_itens FROM clientes c
JOIN pedidos p ON p.id_cliente = c.id_cliente
JOIN itens_pedido i ON i.id_pedido = p.id_pedido
GROUP BY c.nome 
HAVING COUNT(i.id_item) > 3