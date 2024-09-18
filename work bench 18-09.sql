-- Exibir as bases de dados 
show databases;

-- apagar a base de dados;
drop database pizzaria;

-- Criar base de dados (database)
create database if not exists pizzaria;


-- utilizar a base de dados 
use pizzaria;

-- criar tabelas clientes
create table if not exists clientes(
id int not null auto_increment primary key,
nome varchar(30),
telefone int,
logradouro varchar(30),
numero int,
complemento varchar(30),
bairro varchar(30),
referencia varchar(30)
);

-- tabela de pizzas 
create table if not exists pizzas (
id int not null auto_increment primary key,
nome varchar(30),
descricao varchar(100),
valor decimal(15,2)
);

-- exibir tabelas 
show tables;

-- apagar a tabela 
drop table if exists pedidos;

-- pedidos
create table if not exists pedidos (
id int not null auto_increment primary key,
cliente_id integer,
data datetime,
valor decimal(15,2)
);

alter table pedidos add foreign key (cliente_id) references clientes (id);

-- exibir a estrutura da tabela
describe pedidos;

-- Tabela ITEM_PEDIDO
CREATE TABLE Itens_pedido (
pedido_id INTEGER,
pizza_id INTEGER,
quantidade int,
valor DECIMAL(15,2),
primary key (pedido_id, pizza_id),
FOREIGN KEY (pizza_id)
REFERENCES pizzas (id),
FOREIGN KEY (pedido_id)
REFERENCES pedidos (id)
);

INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, 
NULL, 'Bela Vista', 'Em frente a escola');

-- apagar coluna da tabela 
alter table clientes drop telefone;

-- adicionar uma coluna 
alter table clientes add tell numeric(15);

-- alterar o tipo de dados de um campo da tabela 
alter table clientes modify tell varchar(14);

-- alterar o tipo de dados e nome da tabela
alter table clientes change tell telefone varchar(14);

INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(22) 2222-2222', 'Bruna Dantas', 'Rua das Rosas', 222, 
NULL, 'Cantareira',NULL);

INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(33) 3333-3333', 'Bruno Vieira', 'Rua das Avencas', 333, 
NULL, 'Bela Vista',NULL);

INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(44) 4444-4444', 'Giulia Silva', 'Rua das Cravos', 444, 
NULL, 'Cantareira', 'Esquina do Mercado');

INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(55) 5555-5555', 'José Silva', 'Rua das Acácias', 555, 
NULL, 'Bela Vista',NULL);

INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
VALUES ('(66) 6666-6666', 'Laura Madureira', 'Rua das Gardências', 666, 
NULL, 'Cantareira',NULL);
update clientes set telefone = '(11) 1111-1111' where id = 1;

select * from clientes;

insert into pizzas (nome, valor)
values ('Provolone', 17),
('Portuguesa', 15),
('4 Queijos', 20),
('Calabresa', 17);

insert into pizzas (nome) values ('Escaroola');
alter table pizzas modify valor decimal (15,2) default 99;
insert into pizzas (nome) values ('Moda da Casa');

insert into pedidos (id, cliente_id, data, valor)
values(1, 1, '2016-12-15 20:30:00' , 32),
(2, 2, '2016-12-15 20:38:00', 40.00),
(3, 3, '2016-12-15 20:59:00', 22),
(4, 1, '2016-12-17 22:00:00', 42),
(5, 2, '2016-12-18 19:00:00', 45),
(6, 3, '2016-12-18 21:12:00', 44),
(7, 4, '2016-12-19 22:22:00', 72),
(8, 6, '2016-12-19 22:26:00', 34.0);

select * from pedidos;

insert into itens_pedido (pedido_id, pizza_id, quantidade, valor)
values (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

select * from itens_pedido;


/*

select [distinct] <colunas>
from <tabelas>
[where condição]alter
[group by <coluna>]
[having <condição>]alter
[order by <coluna>];
*/

-- apagar coluna da tabela 
alter table clientes drop telefone;

-- adicionar uma coluna 
alter table clientes add tell numeric(15);

-- alterar o tipo de dados de um campo da tabela 
alter table clientes modify tell varchar(14);

-- alterar o tipo de dados e nome da tabela
alter table clientes change tell telefone varchar(14);

-- selecionar todos os valores 
select * from pizzas;
select valor, id, nome from pizzas;

-- A sequencia das colunas podem ser alteradas
select valor, id, nome from pizzas;

-- nome da coluna exibindo na resposta do comando pode ser alterado com a cláusula AS
select id as codigo, nome, valor as 'Valor R$' from pizzas;

-- operações aritiméticas
select 10 + 3, 10 - 3, 10 / 3, 10 * 3;
select 10 + 3 as SOMA, 10 - 3 as SUBTRACAO, 10 / 3 as 'Divisão', 10 * 3 as Multiplicacão;

select id, nome, valor, valor as '+10%' from pizzas;
select *, ((valor*10)/100) + valor as '+10%' from pizzas;