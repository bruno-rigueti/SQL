-- Criando um novo usuário com acesso a partir de um IP específico:
CREATE USER 'andre'@'200.200.190.190' identified BY 'milani123456';

-- Criando um novo usuário com acesso a partir de qualquer endereço de IP:
CREATE USER 'andre'@'%' identified BY 'milani123456';

-- Criando um Novo usuário - Acesso a partir da máquina local - localhost:
CREATE USER 'andre'@'localhost' identified BY 'milani123456';

-- Concedendo acesso Geral ao usuário - Comando utilizado para criar o Administrador do Banco de Dados:
GRANT ALL ON curso_sql.* TO 'andre'@'localhost';

-- Criando um novo usuário com o mesmo nome com acesso de qualquer lugar:
CREATE USER 'andre'@'%' IDENTIFIED BY 'milani123456';

-- Concedendo acesso a esse novo usuário apenas para fazer consultas ao banco de dados:
GRANT SELECT ON curso_sql.* TO 'andre'@'%';

-- Concedendo acesso ao usuário para incluir novos registros no banco de dados:
GRANT INSERT ON curso_sql.* TO 'andre'@'%';

-- Concedento acesso ao usuário para incluir novos registros apenas em uma tabela específica do banco de dados:
GRANT INSERT ON curso_sql.funcionarios TO 'andre'@'%';

-- Removendo os Acessos do Usuário

-- Removendo o acesso para inclusão de registros na tabela específica:
REVOKE INSERT ON curso_sql.funcionarios FROM 'andre'@'%';

-- No caso do MySQL, se concedermos acesso de leitura a todas as tabelas, só poderemos revogar o acesso de todas as tabelas, não somente de uma:
REVOKE SELECT ON curso_sql.* FROM 'andre'@'%';

-- Incluindo acesso a mais de uma tabela para o usuario:
GRANT SELECT ON curso_sql.funcionarios TO 'andre'@'%';
GRANT SELECT ON curso_sql.veiculos TO 'andre'@'%';

-- Removendo acesso a mais de uma tabela do usuario:
REVOKE SELECT ON curso_sql.funcionarios FROM 'andre'@'%';
REVOKE SELECT ON curso_sql.veiculos FROM 'andre'@'%';

-- Exclusão dos Acessos do usuário do Administrador do Banco de Dados:
REVOKE ALL ON curso_sql.* FROM 'andre'@'localhost';

-- Exclusão dos Usuários do Servidor:
DROP USER 'andre'@'%';
DROP USER 'andre'@'localhost';

-- Consultar a lista de usuários cadastrados no Servidor:
SELECT User FROM mysql.user;

-- Consultar os acessos concedidos ao usuário:
SHOW GRANTS FOR 'andre'@'%';

REVOKE SELECT ON curso_sql.* FROM 'andre'@'%';
REVOKE INSERT ON curso_sql.funcionarios FROM 'andre'@'%';
DROP USER 'andre'@'%';

GRANT * ON curso_sql.* TO 'andre'@'%';