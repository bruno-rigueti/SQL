-- Quiz do Modulko 5:
USE treinamentos;

CREATE TABLE instrutores
	(
		id int unsigned not null,
        nome varchar(20) not null,
        PRIMARY KEY(id)
    );
    
CREATE TABLE cursos
	(
    id int unsigned not null,
    ins int unsigned,
    titulo varchar(45) not null,
    PRIMARY KEY(id),
    CONSTRAINT fk_cursos FOREIGN KEY (ins) REFERENCES instrutores(id)
    );
    
INSERT INTO instrutores (id, nome) VALUES (1, 'André');
INSERT INTO instrutores (id, nome) VALUES (2, 'Carlos');
INSERT INTO instrutores (id, nome) VALUES (3, 'Samuel');
INSERT INTO instrutores (id, nome) VALUES (4, 'Fábio');
select * from instrutores;

INSERT INTO cursos (id, ins, titulo) VALUES (1, 1, 'Java');
INSERT INTO cursos (id, ins, titulo) VALUES (2, null, 'PHP');
INSERT INTO cursos (id, ins, titulo) VALUES (3, 1, 'MySQL');
INSERT INTO cursos (id, ins, titulo) VALUES (4, 3, 'SQL');
INSERT INTO cursos (id, ins, titulo) VALUES (5, 2, 'C++');
select * from cursos;

-- 1:
SELECT * FROM instrutores RIGHT JOIN cursos
ON instrutores.nome = cursos.titulo;

-- 2:
SELECT * FROM instrutores INNER JOIN cursos USING (id);

-- 3:
SELECT * FROM instrutores INNER JOIN cursos ON instrutores.id = cursos.ins;

-- 4:
SELECT * FROM instrutores LEFT JOIN cursos ON instrutores.id = cursos.ins;

DROP TABLE cursos;
DROP TABLE instrutores;
