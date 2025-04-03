# Sistema de Gestão de Pedidos e Pagamentos

## Sobre o Projeto
Este projeto consiste em um **banco de dados relacional** para um sistema de gestão de pedidos, pagamentos, clientes (PF e PJ), fornecedores e estoque. O banco foi modelado para suportar a estrutura necessária para um e-commerce ou marketplace, permitindo o gerenciamento de:

- **Clientes** (Pessoas Físicas e Jurídicas);
- **Pagamentos**;
- **Produtos** e **Pedidos**;
- **Fornecedores** e **Vendedores Terceiros**;
- **Estoque** e Relacionamento com Produtos.

---

## Estrutura do Banco de Dados

### **Tabelas:**
- `conta` → Define se o cliente é Pessoa Física (PF) ou Jurídica (PJ).
- `cliente_pf` → Contém os dados de clientes Pessoa Física.
- `cliente_pj` → Contém os dados de clientes Pessoa Jurídica.
- `pagamento` → Armazena os métodos de pagamento dos clientes.
- `pagamento_cliente` → Relaciona os pagamentos com os clientes.
- `produto` → Registra os produtos disponíveis para venda.
- `pedido` → Armazena informações dos pedidos realizados.
- `produto_pedido` → Relaciona os produtos com os pedidos.
- `entrega` → Armazena informações de status e rastreamento do pedido a ser entregue.
- `fornecedor` → Cadastro de fornecedores.
- `fornecedor_produto` → Relaciona fornecedores aos produtos.
- `vendedor_terceiro` → Cadastro de vendedores terceiros.
- `vendedort_produto` → Relaciona vendedores terceiros aos produtos.
- `estoque` → Controle de locais onde os produtos estão armazenados.
- `produto_estoque` → Relaciona produtos com os estoques.

---






