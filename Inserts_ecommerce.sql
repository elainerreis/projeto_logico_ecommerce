use ecommerce2;

INSERT INTO conta (Tipo) VALUES 
('PF'), ('PJ'), ('PF'), ('PJ'), ('PF'), ('PF'), ('PJ');

INSERT INTO cliente_pf (idConta, Nome, CPF, Sobrenome, Endereço, Telefone, Email, Data_de_nascimento) VALUES 
(1, 'Carlos', '12345678901', 'Silva', 'Rua A, 123', '11999999999', 'carlos@email.com', '1990-05-10'),
(3, 'Mariana', '98765432100', 'Oliveira', 'Rua B, 456', '21988888888', 'mariana@email.com', '1995-07-22'),
(5, 'Lucas', '45678912322', 'Souza', 'Rua C, 789', '38537777777', 'lucas@email.com', '1988-03-15'),
(6, 'Rodrigo', '23568985322', 'Moura', 'Rua Z, 658', '31977777777', 'rodrigo@email.com', '1985-04-18');

INSERT INTO cliente_pj (idConta, Razao_social, CNPJ, nome_responsavel, cpf_responsave) VALUES 
(2, 'Tech Solutions LTDA', '12345678000199', 'Ana Pereira', '12345678901'),
(4, 'EletroHouse SA', '98765432000188', 'Bruno Costa', '98765432100'),
(7, 'Armazem Solutions SA', '98452362000188', 'Paulo Batista', '92335432750');

INSERT INTO pagamento (tipo, Nome, numero, cvc, data_validade) VALUES 
('Crédito', 'Carlos Silva', 1111222233334444, 123, '2026-08-01'),
('Débito', 'Mariana Oliveira', 5555666677778888, 456, '2025-12-01'),
('Crédito', 'Tech Solutions LTDA', 9999000011112222, 789, '2027-05-01'),
('Débito', 'Carlos Silva', 1111222233334444, 123, '2026-08-01');

INSERT INTO pagamento_conta (pagamento_idPagamento, conta_idConta) VALUES 
(1, 1),
(2, 3),
(3, 2),
(4, 1);

INSERT INTO produto (categoria, nome, valor) VALUES 
('brinquedos', 'Carrinho', 50.00),
('eletrolicos', 'Celular', 2000.00),
('vestuário', 'Camiseta', 80.00),
('casa', 'Liquidificador', 150.00);

INSERT INTO pedido (conta_idConta, pagamento_idPagamento_Conta, Status, observacao, frete, valor_total, Data) VALUES 
(1, 1, 'em processamento', 'Entrega rápida', 15.00, 2100.00, '2025-04-01'),
(3, 2, 'enviado', 'Embalagem reforçada', 10.00, 80.00, '2025-04-02');

INSERT INTO produto_pedido (produto_idProduto, pedido_idPedido, quantidade, status) VALUES 
(2, 1, 1, 'disponível'),
(3, 2, 1, 'disponível');

INSERT INTO fornecedor (razao_social, CNPJ, endereço, email, telefone) VALUES 
('Distribuidora ABC', '12345678000111', 'Rua XPTO, 100', 'contato@abc.com', '11999999999'),
('Comercial XYZ', '98765432000222', 'Av. Principal, 200', 'vendas@xyz.com', '21988888888');

INSERT INTO fornecedor_produto (produto_idProduto, fornecedor_idFornecedor, quantidade) VALUES 
(2, 1, 50),
(3, 2, 100);

INSERT INTO vendedor_terceiro (razao_social, CNPJ, endereço, email, telefone) VALUES 
('Loja Online 1', '12345678000333', 'Rua Virtual, 10', 'suporte@loja1.com', '11911111111'),
('Loja Online 2', '98765432000444', 'Av. Digital, 20', 'contato@loja2.com', '21922222222'),
('Loja Online 3', '62585432254864', 'Rua 13, 20', 'suport@loja3.com', '31652333222');

INSERT INTO vendedort_produto (produto_idProduto, vendedort_idVendedor, quantidade) VALUES 
(2, 1, 20),
(3, 2, 30);

INSERT INTO estoque (endereco) VALUES 
('Centro Logístico A'),
('Centro Logístico B');

INSERT INTO produto_estoque (produto_idProduto, estoque_idEstoque) VALUES 
(2, 1),
(3, 2);

