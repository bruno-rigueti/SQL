CREATE DATABASE cadastro;

USE cadastro;

CREATE TABLE pessoas (
		id int not null auto_increment,
        nome varchar(30) not null,
        nascimento date,
        sexo enum('M', 'F'),
        peso decimal(5,2),
        altura decimal(3,2),
        nacionalidade varchar(20) default 'Brasil',
        PRIMARY KEY(id)
        ) default charset = utf8mb4;
/* Descrição da estrutura da tabela 'pessoas':
   id:
	int - tipo inteiro
    not null - não pode ficar vazio
    auto_increment - auto preenchido quando um novo registro é criado
   nome:
	varchar(30) - tipo string com 30 posições possíveis
    not null - não pode ficar vazio
   nascimento:
	date - tipo data
   sexo:
	enum - restringe as opções de entrada disponíveis para o campo. No exemplo, as entradas só poderão ser M (masculino) ou F (feminino)
   peso:
	decimal(5,2) - tipo de dados decimal, restringindo a 5 (não conta a vírgula) caractes por registro e 2 caractres após a vírgula
   altura:
	decimal(5,2) - tipo de dados decimal, restringindo a 3 (não conta a vírgula) caractes por registro e 2 caractres após a vírgula
   nacionalidade:
	varchar(20) - tipo string com 20 posições possíveis
    default 'Brasil' - caso não seja preenchido, será atribuído o valor 'Brasil' automaticamente

	PRIMARY KEY(id) - define o campo id como chave primária da tabela
    defaulta charset = utf8mb4 - define o encoding dos dados da tabela para utf8mb4
	*/

INSERT INTO pessoas -- indica que serão inseridos dados na tabela
(nome, nascimento, sexo, peso, altura, nacionalidade) -- indica os campos que receberão os dados e em qual ordem os dados serão inseridos
VALUES -- indica que os dados seguinte serão inseridos na tabela
('Tarcisio', '1994-05-13', 'M', 78.5, 1.83, 'Brasil'); -- dados que serão inseridos na tabela

select * from pessoas; -- confere se os dados foram inseridos corretamente, apresentando os registros da tabela

INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(default, 'Fulana', '1999-05-13', 'F', 90.5, 1.83, default),
(default, 'Fulano1', '1999-05-13', 'M', 90.5, 1.83, default),
(default, 'Fulana2', '1999-05-13', 'M', 90.5, 1.83, default); -- Insere diversos registros em um único comando

select * from pessoas;

ALTER TABLE pessoas -- Comando que altera a Tabela
ADD COLUMN profissao varchar(20) default ''; -- Indicação da alteração a ser feita: Inclusão de uma nova coluna

select * from pessoas; -- confere as alterações feitas na Tabela

ALTER TABLE pessoas
MODIFY COLUMN profissao varchar(30) default ''; -- Indicação da alteração a ser feita: Modificação de uma coluna
-- a coluna foi modificada de varchar(20) para varchar(30)
-- os demais paramentros que não serão alterados são repetidos

