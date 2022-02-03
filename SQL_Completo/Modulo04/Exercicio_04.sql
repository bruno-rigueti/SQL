USE treinamentos;
-- 1 - Criando Massa de Dados

-- Dados da tabela tipo:
INSERT INTO tipo (id, tipo)
VALUES (1, 'Banco de Dados');

INSERT INTO tipo (id, tipo)
VALUES (2, 'Programação');

INSERT INTO tipo (id, tipo)
VALUES (3, 'Modelagem de Dados');

select * from tipo;

-- Dados da tabela instrutor:
INSERT INTO instrutor (cod, nome, telefone)
VALUES (1, 'André Milani', 11111111);

INSERT INTO instrutor (cod, nome, telefone)
VALUES (2, 'Carlos Tosin', 12121212);

select * from instrutor;

-- Dados da tabela curso:
INSERT INTO curso (id, instrutor_cod, tipo_id, nome, preco)
VALUES (1, 2, 2, 'Java Fundamentos', 270);

INSERT INTO curso (id, instrutor_cod, tipo_id, nome, preco)
VALUES (2, 2, 2, 'Java Avançado', 330);

INSERT INTO curso (id, instrutor_cod, tipo_id, nome, preco)
VALUES (3, 1, 1, 'SQL Completo', 170);

INSERT INTO curso (id, instrutor_cod, tipo_id, nome, preco)
VALUES (4, 2, 1, 'Php Básico', 270);

select * from curso;

-- Dados da tabela alunos:
INSERT INTO alunos (id, nome, endereco, email)
VALUES (1, 'José', 'Rua XV de Novembro 72', 'jose@softblue.com.br');

INSERT INTO alunos (id, nome, endereco, email)
VALUES (2, 'Wagner', 'Av. Paulista', 'wagner@softblue.com.br');

INSERT INTO alunos (id, nome, endereco, email)
VALUES (3, 'Emílio', 'Rua Lajes 103, ap: 701', 'emilio@softblue.com.br');

INSERT INTO alunos (id, nome, endereco, email)
VALUES (4, 'Cris', 'Rua Tauney 22', 'cris@softblue.com.br');

INSERT INTO alunos (id, nome, endereco, email)
VALUES (5, 'Regina', 'Rua Salles 305', 'regina@softblue.com.br');

INSERT INTO alunos (id, nome, endereco, email)
VALUES (6, 'Fernando', 'Av. Central 30', 'fernando@softblue.com.br');

select * from alunos;

-- Dados da tabela compras:
INSERT INTO compras (id, aluno_id, dat, hora)
VALUES (1, 2, '2010/04/15', "11:23:32");

INSERT INTO compras (id, aluno_id, dat, hora)
VALUES (3, 3, '2010/04/16', "11:17:45");

INSERT INTO compras (id, aluno_id, dat, hora)
VALUES (4, 4, '2010/04/17', "14:27:22");

INSERT INTO compras (id, aluno_id, dat, hora)
VALUES (5, 5, '2010/04/18', "11:18:19");

INSERT INTO compras (id, aluno_id, dat, hora)
VALUES (6, 6, '2010/04/19', "13:47:35");

INSERT INTO compras (id, aluno_id, dat, hora)
VALUES (7, 6, '2010/04/20', "18:13:44");

INSERT INTO compras (id, aluno_id, dat, hora)
VALUES (2, 2, '2010/04/15', "14:36:21");

select * from compras;

-- Dados da tabela detalhe:
CREATE TABLE pedido_detalhes
	(
    id int unsigned not null auto_increment,
    id_compra int unsigned,
    curso_id int unsigned,
    valor int,
    primary key(id),
    CONSTRAINT fk_detalhes_compras foreign key (id_compra) references compras (id),
    CONSTRAINT fk_detalhes_curso foreign key (curso_id) references curso (id)
    );

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (1, 1, 270);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (1, 2, 330);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (2, 1, 270);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (2, 2, 330);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (2, 3, 170);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (3, 4, 270);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (4, 2, 330);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (4, 4, 270);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (5, 3, 170);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (6, 3, 170);

INSERT INTO pedido_detalhes (id_compra, curso_id, valor)
VALUES (7, 4, 270);

select * from pedido_detalhes;

-- 2 - Queries a serem executadas com os dados:

-- Exibir todas as informações de todos os alunos:
select * from alunos;

-- Exibir somente o título de cada curso da Softblue:
select nome as 'Título' from curso;

-- Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200:
select nome as 'Título', preco as 'Valor' from curso
where preco > 200;

-- Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200 e menor que 300:
select nome as 'Título', preco as 'Valor' from curso
where preco > 200 and preco < 300;

-- Exibir as informações da tabela PEDIDOS para os pedidos realizados entre 15/04/2010 e 18/04/2010:
select * from compras
where dat between '2010/04/15' and '2010/04/18';

-- Exibir as informações da tabela PEDIDOS para os pedidos realizados na data de 15/04/2010:
select * from compras
where dat = '2010/04/15';

-- 3 - Manipulações a serem feitas nos dados:

-- Altere o endereço do aluno JOSÉ para 'Av. Brasil 778':
UPDATE alunos SET endereco = 'Av. Brasil 778' where nome = 'José';
select * from alunos;

-- Altere o e-mail do aluno CRIS para 'cristiano@softblue.com.br':
UPDATE alunos SET email = 'cristiano@softblue.com.br' where nome = 'Cris';
select * from alunos;

-- Aumente em 10% o valor dos cursos abaixo de 300:
SET SQL_SAFE_UPDATES = 0;
update curso set preco = preco * 1.1;
select * from curso;
update curso set preco = round(preco, 2);
select * from curso;

-- Altere o nome do curso de Php Básico para Php Fundamentos:
update curso set nome = 'Php Fundamentos' where nome = 'Php Básico';
select * from curso;