USE curso_sql;
SELECT * FROM funcionarios;
-- Contar os registros existentes na tabela funcionarios:
SELECT COUNT(*) FROM funcionarios;

-- Contar os registros com salario acima de 2000:
SELECT COUNT(*) FROM funcionarios
WHERE salario > 2000;

-- Contar quantos registros tem salario acima de 1600 e trabalham no departamento Jurídico:
SELECT COUNT(*) FROM funcionarios
WHERE salario > 1600 and departamento = 'Jurídico';

-- Saber a soma dos salários dos funcionários:
SELECT SUM(salario) FROM funcionarios;

-- Saber a soma dos salários dos funcionários do departamento de TI:
SELECT SUM(salario) FROM funcionarios
WHERE departamento = 'TI';

-- Saber a Média dos salérios dos funcionários:
SELECT AVG(salario) FROM funcionarios;

-- Saber a Média dos salários dos funcionários do departamento de TI:
SELECT AVG(salario) FROM funcionarios
WHERE departamento = 'TI';

-- Saber qual o maior salário:
SELECT MAX(salario) FROM funcionarios;

-- Saber o salário mais alto do departamento de TI:
SELECT MAX(salario) FROM funcionarios
WHERE departamento = 'TI';

-- Saber o menor salário:
SELECT MIN(salario) FROM funcionarios;

-- Saber o menor salário do departamento Jurídico:
SELECT MIN(salario) FROM funcionarios
WHERE departamento = 'Jurídico';

-- Listar os departamentos da empresa

-- Listar dos registros:
SELECT departamento FROM funcionarios;

-- Listar departamentos distintos - sem repetição:
SELECT DISTINCT(departamento) FROM funcionarios;

-- Ordenar os registros pelos nomes dos funcionários:
SELECT * FROM funcionarios
ORDER BY nome;

-- Ordenar os registros pelos nomes dos funcionários em ordem decrescente:
SELECT * FROM funcionarios
ORDER BY nome DESC;

-- Ordenar os registros pelos salarios dos funcionarios:
SELECT * FROM funcionarios
ORDER BY salario;

-- Ordenar os registros dos funcionários do departamento de TI por seus salarios:
SELECT * FROM funcionarios
WHERE departamento ='TI'
ORDER BY salario;

-- Ordenar os registros por departamento e depois por salario em cada departamento:
SELECT * FROM funcionarios
ORDER BY departamento, salario;

-- Comandos de Paginação:

-- Limitar a consulta para apresentar apenas 2 registros:
SELECT * FROM funcionarios LIMIT 2;

-- Apresentar apenas 2 registros pulando o primeiro registro:
SELECT * FROM funcionarios
LIMIT 2 -- limita em 2 a quantidade de registros a serem apresentados
OFFSET 1; -- pula o primeiro registro da tabela

-- Ou:
SELECT * FROM funcionarios LIMIT 1, 2;
/* LIMIT 1, 2:
1 - registros a serem pulados
2 - quantidade de registros a serem apresentados
Dispensa o parâmetro OFFSET
Exclusivo do MySQL
*/

-- Funções de Agrupamento:

-- Para saber a média salarial de cada departamento:
SELECT departamento, AVG(salario) FROM funcionarios
GROUP BY departamento;

-- Saber a média salarial dos departamentos que sejam acima de 2000:
SELECT departamento, AVG(salario) FROM funcionarios
GROUP BY departamento
HAVING AVG(salario) > 2000;

-- Saber a quantidade de funcionários em cada departamento:
SELECT departamento AS 'DPTO', COUNT(*) AS 'QUANT FUNC' FROM funcionarios
GROUP BY departamento;

-- Subqueries:

-- Saber os nomes dos funcionários dos departamentos com média salarial acima de 2000:
SELECT * FROM funcionarios;

SELECT nome FROM funcionarios
WHERE departamento IN(SELECT departamento FROM funcionarios 
GROUP BY departamento 
HAVING AVG(salario) > 2000);