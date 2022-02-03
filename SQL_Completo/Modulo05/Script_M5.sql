USE curso_sql; -- Nunca esquecer desse comando no início do Script do MySQL

SELECT * FROM funcionarios;
SELECT * FROM veiculos;

-- INNER JOIN entre funcionarios e veiculos:
SELECT * FROM funcionarios INNER JOIN veiculos
ON veiculos.funcionario_id = funcionarios.id;
-- Retorna somente os dados que tem relação nas duas tabelas.

-- INNER JOIN com apelidos nas tabelas:
SELECT * FROM funcionarios f INNER JOIN veiculos v
ON v.funcionario_id = f.id;

-- LEFT JOIN:
SELECT * FROM funcionarios f LEFT JOIN veiculos v
ON v.funcionario_id = f.id;
-- Retorna o relacionamento entre as tabelas com todos os regitros da tabela à esquerda - primeira tabela - , independente se atendem ou não os criterios da relação.

-- RIGHT JOIN:
INSERT INTO veiculos (funcionario_id, veiculo, placa)
VALUES (null, 'Moto', 'SB-0003');

SELECT * FROM funcionarios f RIGHT JOIN veiculos v
ON v.funcionario_id = f.id;
-- Retorna o relacionamento entre as tabelas com todos os regitros da tabela à direita - segunda tabela - , independente se atendem ou não os criterios da relação.

-- FULL JOIN:
-- Retorna todos os registros das duas tabelas, independente se atendem ou não os critérios do relacionamento
-- No MySQL não uma instrução específica implementada para o FULL JOIN
-- Precisamos fazer uma união entre um LEFT JOIN e um RIGHT JOIN para obter um FULL JOIN no MySQL:
SELECT * FROM funcionarios f LEFT JOIN veiculos v
ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v
ON v.funcionario_id = f.id;

-- EQUI JOIN:
CREATE TABLE cpfs
	(
		id int unsigned not null,
        cpf varchar(14) not null,
        PRIMARY KEY (id),
        CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
    );

INSERT INTO cpfs (id, cpf) VALUES (1, '111.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (2, '222.222.222-22');
INSERT INTO cpfs (id, cpf) VALUES (3, '333.333.333-33');
INSERT INTO cpfs (id, cpf) VALUES (5, '555.555.555-55');
SELECT * FROM cpfs;

-- Instrução Simplificada do EQUI JOIN:
SELECT * FROM funcionarios INNER JOIN cpfs USING(ID);

-- SELF JOIN:
CREATE TABLE clientes
 (
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned,
    PRIMARY KEY(ID),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
 );

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'André', NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Samuel', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Carlos', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Rafael', 1);
select * from clientes;

-- Criando o Self Join:
SELECT a.nome AS 'Cliente', b.nome AS 'Quem Indicou' -- seleciona os campos a exibir
FROM clientes a JOIN clientes b -- indica e renomeia a tabela
ON a.quem_indicou = b.id; -- indica o relacionamento entre os registros da tabela

-- Relacionamento entre Multiplas Tabelas:
SELECT * FROM funcionarios f -- seleciona a primeira tabela
INNER JOIN veiculos v -- indica o relacionamento com a segunda tabela
ON v.funcionario_id = f.id
INNER JOIN cpfs c -- indica o relacionamento com a terceira tabela
ON c.id = f.id;
-- Posso incluir Joins em sequencia para criar o relacionamento entre quantas tabelas eu quiser

-- Criando Views:

CREATE VIEW funcionarios_a
AS SELECT * FROM funcionarios
WHERE salario >= 1700;
-- Instrução que cria a View

SELECT * FROM funcionarios_a; -- Instrução que invoca a View criada

-- Alteração em dados da tabela:
UPDATE funcionarios SET salario = 1500 WHERE id = 3;

-- Acionando a View:
SELECT * FROM funcionarios_a; -- A view deverá trazer os resultados atualizados, mesmo sem ter sofrido alterações

-- Se for preciso fazer alguma alteração na View, o professor sugere que é mais fácil excluir e View e criá-la novamente com as alterações:

DROP VIEW funcionarios_a; -- Exclui a View

CREATE VIEW funcionarios_a
AS SELECT * FROM funcionarios WHERE salario >= 2000; -- Cria novamente a View com as alterações

SELECT * FROM funcionarios_a; -- Invoca a View recriada