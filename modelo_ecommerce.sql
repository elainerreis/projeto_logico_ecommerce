#Criação de banco de dados para e-commerce
create database ecommerce2;
use ecommerce2;
-- drop database ecommerce2;

#Criar a tabela conta
create table conta(
idConta int auto_increment primary key,
Tipo enum('PF', 'PJ'),
constraint chk_tipo_conta CHECK (Tipo IN ('PF', 'PJ')));

alter table conta auto_increment =1;

#Criar tabela cliente
create table cliente_pf(
idConta INT PRIMARY KEY,
Nome varchar(10) not null, 
CPF char(11) UNIQUE NOT NULL,
Sobrenome varchar(10) not null,
Endereço varchar(45) not null,
Telefone varchar(11) not null,
email varchar(45) not null,
Data_de_nascimento date,
 CONSTRAINT fk_cliente_pf FOREIGN KEY (idConta) REFERENCES conta(idConta) ON DELETE CASCADE);

CREATE TABLE cliente_pj (
    idConta INT PRIMARY KEY,
    Razao_social VARCHAR(45) NOT NULL,
    CNPJ CHAR(14) UNIQUE NOT NULL,
    nome_responsavel varchar(45),
    cpf_responsave char(11),
    CONSTRAINT fk_cliente_pj FOREIGN KEY (idConta) REFERENCES conta(idConta) ON DELETE CASCADE
);
#Criar tabela pagamento
create table pagamento(
idPagamento int auto_increment primary key,
tipo enum("Débito", "Crédito"),
Nome varchar(45),
numero varchar(16),
cvc int(3),
data_validade date,
constraint chk_tipo_pagamento CHECK (tipo IN ('Débito', 'Crédito')),
constraint chk_numero_cartao CHECK (numero REGEXP '^[0-9]{16}$'));

#Criando tabela de relacionamento entre cliente e forma de pagamento

create table pagamento_conta(
idPagamento_Conta int auto_increment primary key,
pagamento_idPagamento int,
conta_idConta int,
constraint fk_pagamento_cliente foreign key (pagamento_idPagamento) references pagamento(idPagamento),
constraint fk_cliente_pagamento foreign key (conta_idConta) references conta(idConta));

create table produto(
idProduto int auto_increment primary key,
categoria ENUM("brinquedos", "eletrolicos", "vestuário", "casa"),
nome varchar(45) not null,
valor float,
CONSTRAINT chk_valor_produto CHECK (valor > 0),
CONSTRAINT unique_categoria_nome UNIQUE (categoria, nome));

#Criar tabela pedido 
create table pedido(
idPedido int auto_increment primary key,
conta_idConta int,
pagamento_idPagamento_Conta int,
Status enum('em processamento', 'enviado', 'entregue', 'devolvido') default "em processamento", 
observacao varchar(250),
frete float default 10,
valor_total float,
Data date,
constraint chk_frete CHECK (Frete >= 0),
constraint chk_valor_total CHECK (Valor_total >= 0),
constraint fk_pedido_conta foreign key (conta_idConta) references conta(idConta)
	ON DELETE CASCADE,
constraint fk_pedido_pagamento foreign key (pagamento_idPagamento_Conta) references pagamento_conta(idPagamento_Conta)
	ON DELETE SET NULL);

#Criando tabela de relacionamento entre produto e pedido
create table produto_pedido(
produto_idProduto int,
pedido_idPedido int,
quantidade int default 1,
status ENUM('disponível', 'sem estoque') default 'disponível',
primary key(produto_idProduto, pedido_idPedido),
constraint fk_produto_pedido foreign key (produto_idProduto) references produto(idProduto),
constraint fk_pedido_produto foreign key (pedido_idPedido) references pedido(idPedido));

#Criando tabela fornecedor
create table fornecedor(
idFornecedor int auto_increment primary key,
razao_social varchar(45) not null,
CNPJ CHAR(14) UNIQUE NOT NULL, 
endereço varchar(45),
email varchar(45),
telefone char(11));

#Criando a tabela de relacionamento entre fornecedor e produto

create table fornecedor_produto(
produto_idProduto int,
fornecedor_idFornecedor int,
quantidade int default 1,
primary key(produto_idProduto, fornecedor_idFornecedor),
constraint fk_produto_fornecedor foreign key (produto_idProduto) references produto(idProduto),
constraint fk_fornecedor_produto foreign key (fornecedor_idFornecedor) references fornecedor(idFornecedor));

#Criando a tabela vendedor terceiro

create table vendedor_terceiro(
idVendedor int auto_increment primary key,
razao_social varchar(45) not null,
CNPJ CHAR(14) UNIQUE NOT NULL, 
endereço varchar(45),
email varchar(45),
telefone char(11));

#Criando a tabela de relacionamento entre vendedor terceiro e produto

create table vendedort_produto(
produto_idProduto int,
vendedort_idVendedor int,
quantidade int default 1,
primary key(produto_idProduto, vendedort_idVendedor),
constraint fk_produto_vendedort foreign key (produto_idProduto) references produto(idProduto),
constraint fk_vendedort_produto foreign key (vendedort_idVendedor) references vendedor_terceiro(idVendedor));

#Criando tabela estoque 
create table estoque(
idEstoque int auto_increment primary key,
endereco varchar(45));

#Criando tabela de relacionamento entre produto e estoque 

create table produto_estoque(
produto_idProduto int,
estoque_idEstoque int,
primary key(produto_idProduto, estoque_idEstoque),
constraint fk_produto_estoque foreign key (produto_idProduto) references produto(idProduto),
constraint fk_estoque_produto foreign key (estoque_idEstoque) references estoque(idEstoque));

