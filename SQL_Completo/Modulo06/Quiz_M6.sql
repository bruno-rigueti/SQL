USE treinamentos;

CREATE TABLE pilotos(
					  id int unsigned not null auto_increment,
                      nome varchar(20) not null,
                      equipe varchar(2) not null,
                      pontos int unsigned not null,
                      PRIMARY KEY(id));
INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Fernando', 'A', 2);
INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Paulo', 'B', 5);
INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Richa', 'A', 3);
INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Gomes', 'C', 6);
INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Fred', 'B', 7);
select * from pilotos;

-- 1:
SELECT COUNT(pontos) FROM pilotos WHERE equipe = 'B'; -- Resultado: 2

-- 2:
SELECT * FROM PILOTOS ORDER BY PONTOS DESC LIMIT 1; -- Resultado: Fred

-- 3:
SELECT COUNT(*) FROM PILOTOS WHERE EQUIPE != 'C'; -- Resultado: 4

-- 4:
SELECT * FROM PILOTOS WHERE EQUIPE IN
(SELECT EQUIPE FROM PILOTOS GROUP BY EQUIPE HAVING SUM(PONTOS) > 5); -- Resultado: Paulo, Gomes e Fred

-- 5:
SELECT MAX(PONTOS) FROM PILOTOS WHERE EQUIPE != 'B'; -- Resultado: 6

DROP TABLE pilotos;
