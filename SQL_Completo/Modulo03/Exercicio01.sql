CREATE DATABASE treinamentos;

USE treinamentos;

CREATE TABLE tipo
	(
		id int unsigned not null auto_increment,
        tipo varchar(45) not null,
        PRIMARY KEY (id)
	);
    
CREATE TABLE instrutor
	(
		cod int unsigned not null auto_increment,
        nome varchar(45) not null,
        telefone int default null,
        PRIMARY KEY (cod)
	);
    
CREATE TABLE curso
	(
		id int unsigned not null auto_increment,
        instrutor_cod int unsigned default null,
        tipo_id int unsigned default null,
        nome varchar(45) not null,
        preco double not null default '0',
        PRIMARY KEY (id),
        CONSTRAINT fk_curso_instrutor FOREIGN KEY (instrutor_cod) REFERENCES instrutor(cod),
        CONSTRAINT fk_curso_tipo FOREIGN KEY (tipo_id) REFERENCES tipo(id)
	);
    
CREATE TABLE alunos
	(
		id int unsigned not null auto_increment,
        nome varchar(45) not null,
        endereco varchar(60) not null,
        email varchar(45),
        PRIMARY KEY (id)
	);
    
CREATE TABLE compras
	(
		id int unsigned not null auto_increment,
        aluno_id int unsigned default null,
        dat date not null,
        hora time not null,
        PRIMARY KEY (id),
        CONSTRAINT fk_alunos_compras FOREIGN KEY (aluno_id) REFERENCES alunos(id)
	);
    
CREATE TABLE detalhes
	(
		id int unsigned not null auto_increment,
        compra_id int unsigned default null,
        curso_id int unsigned default null,
        PRIMARY KEY (id),
        CONSTRAINT fk_compra_detalhe FOREIGN KEY (compra_id) REFERENCES compras(id),
        CONSTRAINT fk_curso_detalhe FOREIGN KEY (curso_id) REFERENCES curso(id)
	);