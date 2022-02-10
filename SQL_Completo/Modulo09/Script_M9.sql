USE curso_sql;

CREATE TABLE pedidos
		(
			id int unsigned not null auto_increment,
            descricao varchar(100) not null,
            valor double not null default '0',
            pago varchar(3) not null default 'Não',
            PRIMARY KEY(id)
		);

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player', 300);

select * from pedidos;

-- A Criação da Stored Procedure se dá no MySQL clicando com o direito na opção Stored Procedure > Create Stored Procedure na lista de opção ao lado.

-- Invocando uma Stored Procedure
CALL limpa_pedidos();

CREATE TABLE estoque
		(
			id int unsigned not null auto_increment,
            descricao varchar(50) not null,
            quantidade int not null,
            PRIMARY KEY(id)
		);
        
-- Criando o novo Trigger:
CREATE TRIGGER gatilho_limpa_pedidos -- nome do trigger
BEFORE INSERT -- tipo do trigger
ON estoque -- nome da tabela que disparará o trigger
FOR EACH ROW -- indica que o trigger será executado para cada linha/registro inserido
CALL limpa_pedidos(); -- indica o stored procedure que será executado pela trigger

-- Consultar a tabela que sobre a ação do trigger:
select * from pedidos; -- visualiza os registros antes da execução do trigger

-- Inserindo um registro na tabela que ativa o trigger, o mesmo deverá ser executado
INSERT INTO estoque (descricao, quantidade) VALUES ('Fogão', 5);

-- Consultar a tabela que sofre a ação do trigger após a execução do mesmo:
select * from pedidos; -- deverá apresentar os registros tratados pelo trigger, ou seja a exclusão dos pedidos com pago = 'Não'

-- Consultar a tabela que ativa o trigger:
select * from estoque; -- deverá aparecer os registros cadastrados na mesma

-- Após incluir novamente os itens na tabela pedido, alteramos o status de pagamento do pedido da 'Geladeira' e incluimos um novo registro na tabela estoque:
select * from pedidos;

UPDATE pedidos SET pago = 'Sim' WHERE id = 8;

INSERT INTO estoque (descricao, quantidade) VALUES ('Forno', 3);

select * from pedidos; -- Ficará apenas o pedido com o status pago = 'Sim'