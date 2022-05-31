CREATE DATABASE ExemploJoin
GO

USE ExemploJoin
GO

--DDL
CREATE TABLE TabelaA(
	Nome VARCHAR(50) NOT NULL
)
GO

CREATE TABLE TabelaB(
	Nome VARCHAR(50) NOT NULL
)
GO

--DML
INSERT INTO TabelaA VALUES ('Fernanda')
INSERT INTO TabelaA VALUES ('Josefa')
INSERT INTO TabelaA VALUES ('Luiz')
INSERT INTO TabelaA VALUES ('Fernando')

INSERT INTO TabelaB VALUES ('Carlos'), ('Manoel'), ('Luiz'), ('Fernando')

--Inner Join traz oque combina nas duas tabelas
SELECT TabelaA.Nome, TabelaB.Nome FROM TabelaA INNER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome, TabelaB.Nome FROM TabelaA LEFT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome, TabelaB.Nome FROM TabelaA RIGHT JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome

SELECT TabelaA.Nome, TabelaB.Nome FROM TabelaA FULL OUTER JOIN TabelaB
ON TabelaA.Nome = TabelaB.Nome
WHERE TabelaA.Nome IS NULL OR TabelaB.Nome IS NULL