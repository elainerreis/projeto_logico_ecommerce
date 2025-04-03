#Visualização da tabela cliente_pj
select * from cliente_pf;

#visualização da tabela conta
select *  from conta;

#Buscar pagamentos de um tipo específico
SELECT * FROM pagamento WHERE tipo = 'Crédito';

#Criar um campo "valor total com frete" nos pedidos
SELECT idPedido, valor_total, frete, (valor_total + frete) AS valor_final 
FROM pedido;

#Listar pedidos do mais caro para o mais barato
SELECT idPedido, valor_total FROM pedido ORDER BY valor_total DESC;

#Selecionar todas as contas e seus respectivos clientes (PF e PJ)
SELECT c.idConta, c.Tipo, pf.Nome, pf.CPF, pj.Razao_social, pj.CNPJ 
FROM conta c
LEFT JOIN cliente_pf pf ON c.idConta = pf.idConta
LEFT JOIN cliente_pj pj ON c.idConta = pj.idConta;

#Selecionar pedidos com seus valores e status
SELECT idPedido, conta_idConta, valor_total, Status FROM pedido;

#Atualizar um endereço de cliente PF
UPDATE cliente_pf 
SET Endereço = 'Rua Nova, 456' 
WHERE idConta = 1;

#Recuperar os pedidos com nome do cliente PF/PJ
SELECT p.idPedido, p.Status, p.valor_total, 
       COALESCE(pf.Nome, pj.Razao_social) AS Cliente
FROM pedido p
LEFT JOIN cliente_pf pf ON p.conta_idConta = pf.idConta
LEFT JOIN cliente_pj pj ON p.conta_idConta = pj.idConta;

#Listar pagamentos e o nome do titular
SELECT p.idPagamento, p.tipo, p.Nome, p.numero
FROM pagamento p;

#Quais pedidos ainda estão em processamento?
SELECT * FROM pedido WHERE Status = 'em processamento';

#Quantospedidos cada cliente já fez?
SELECT conta_idConta, COUNT(*) AS total_pedidos 
FROM pedido 
GROUP BY conta_idConta;

#Algum vendedor também é fornecedor?
SELECT f.razao_social AS NomeFornecedor, v.razao_social AS NomeVendedor, f.CNPJ
FROM fornecedor f
JOIN vendedor_terceiro v ON f.CNPJ = v.CNPJ;

#Relação de Produtos, Fornecedores e Estoques
SELECT 
    p.nome AS Produto, 
    f.razao_social AS Fornecedor, 
    e.endereco AS LocalEstoque
FROM produto p
LEFT JOIN fornecedor_produto fp ON p.idProduto = fp.produto_idProduto
LEFT JOIN fornecedor f ON fp.fornecedor_idFornecedor = f.idFornecedor
LEFT JOIN produto_estoque pe ON p.idProduto = pe.produto_idProduto
LEFT JOIN estoque e ON pe.estoque_idEstoque = e.idEstoque;

#Relação de Nomes dos Fornecedores e Nomes dos Produtos
SELECT f.razao_social AS Fornecedor, p.nome AS Produto
FROM fornecedor f
JOIN fornecedor_produto fp ON f.idFornecedor = fp.fornecedor_idFornecedor
JOIN produto p ON fp.produto_idProduto = p.idProduto;

