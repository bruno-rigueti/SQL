USE curso_sql;

SHOW ENGINES; -- Mostra os mecanismos de armazenamento de dados que o MySQL oferece.
-- Consultando a tabela apresentada, na coluna "Transactions", apenas o mecanismo "InnoDB" oferece suporte a transações.

-- Criando uma tabela com suporte a transações:
CREATE TABLE contas_bancarias
		(
			id int unsigned not null auto_increment,
            titular varchar(45) not null,
            saldo double not null,
            PRIMARY KEY(id)
		) engine = InnoDB;
-- Incluir o engine após o fechamento do parentesis e antes do ";".

-- Criando registros na tabela criada:
INSERT INTO contas_bancarias (titular, saldo) VALUES ('André', 1000);
INSERT INTO contas_bancarias (titular, saldo) VALUES ('Carlos', 2000);

select * from contas_bancarias;

-- Criando Transações:

-- Transação Cancelada
START TRANSACTION; -- Inicia a transação
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1; -- operações da transação
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
ROLLBACK; -- desfaz as operações e finaliza a transação

-- Transação Efetivada
START TRANSACTION; -- Inicia a transação
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1; -- operações da transação
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
COMMIT; -- efetiva as operações e finaliza a transação