USE curso_sql; -- Faz com que os comandos sejam efetivamente executados no Banco de Dados

-- Criando a Tabela salarios:
CREATE TABLE salarios
	(
		faixa varchar(45) not null,
        inicio double not null,
        fim double not null,
        primary key (faixa)
	);
    
-- Inserindo Registro na Tabela:
INSERT INTO funcionarios (id, nome, salario, departamento)
VALUES (1, 'Fernando', 1400, 'TI');

INSERT INTO funcionarios (id, nome, salario, departamento)
VALUES (2, 'Fernando', 1400, 'TI');

-- Consultando todos os registros da tabela:
SELECT * FROM funcionarios;

-- Atualizando o Registro 2:
UPDATE funcionarios SET nome = 'Guilherme', salario = 2500, departamento = 'Jurídico' WHERE id = 2;

-- Testando o Autoincrmento do campo 'id':
INSERT INTO funcionarios (nome, salario, departamento)
VALUES('Fabio', 1700, 'TI');

INSERT INTO funcionarios (nome, salario, departamento)
VALUES('Jose', 1800, 'Marketing');
INSERT INTO funcionarios (nome, salario, departamento)
VALUES('Isabela', 2200, 'Jurídico');

-- Consultando todos os registros da tabela:
SELECT * FROM funcionarios;

-- Consulta os registros onde o salário é maior que 2000:
SELECT * FROM funcionarios
WHERE salario > 2000;

-- Retorna os dados de um funcionário específico na tabela - Jose:
SELECT * FROM funcionarios
WHERE nome = 'Jose';

-- Retorna um registro por sua Chave Primária(id):
SELECT * FROM funcionarios
WHERE id = 3;

-- Reajustar o salários dos funcionarários:

-- Safe Updates ativo:
UPDATE funcionarios SET salario = salario * 1.1; -- erro 1175, Safe Update ativo - não permite atualizar toda a tabela

-- Atualizando o salário de um único funcionário:
UPDATE funcionarios SET salario = salario * 1.1 WHERE id = 1;

-- Desabilitar o Safe Update e Atualizar o salários dos demais funcionários:
SET SQL_SAFE_UPDATES = 0; -- desabilita o Safe Update
UPDATE funcionarios SET salario = salario * 1.1 WHERE id != 1; -- atualiza os salários dos demais funcionarios

-- Arredondar as Casas Decimais de Valores Numéricos:
UPDATE funcionarios SET salario = ROUND(salario, 2);

-- Exclusão do Registro de um funcionário:
DELETE FROM funcionarios WHERE id = 4;
select * from funcionarios;

-- Incluindo registros na tabela Veiculos:
INSERT INTO veiculos (funcionario_id, veiculo, placa)
VALUES (1, 'Carro', 'SB-0001');

INSERT INTO veiculos (funcionario_id, veiculo, placa)
VALUES (1, 'Carro', 'SB-0002');

select * from veiculos;

-- Alterando a propriedade de um veículo na tabela veiculos:
UPDATE veiculos SET funcionario_id = 5 WHERE id = 2;
select * from veiculos;

-- Inserindo registros na tabela salarios:
INSERT INTO salarios (faixa, inicio, fim)
VALUES ('Analista Jr', 1000, 2000);

INSERT INTO salarios (faixa, inicio, fim)
VALUES ('Analista Pleno', 2000, 4000);

select * from salarios;

-- Dando um apelido para a tabela funcionarios:
SELECT * FROM funcionarios f WHERE f.salario > 2000;

-- Escolhendo os campos que serão filtrados da tabela:
SELECT salario, nome FROM funcionarios f WHERE f.salario > 2000;
SELECT nome, salario FROM funcionarios f WHERE f.salario > 2000;

-- Dando apelidos aos campos das tabelas na consulta:
SELECT nome AS 'Funcionário', salario AS 'Valor' FROM funcionarios f
WHERE f.salario > 2000;

-- Criando uma Consulta Composta com a instrução UNION:
-- Consultas Separadas:
SELECT * FROM funcionarios WHERE nome = 'Guilherme';
SELECT * FROM funcionarios WHERE id = 5;

-- Consulta Composta - unificada:
SELECT * FROM funcionarios WHERE nome = 'Guilherme'
UNION
SELECT * FROM funcionarios WHERE id = 5;