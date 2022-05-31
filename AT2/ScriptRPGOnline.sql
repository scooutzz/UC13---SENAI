--DDL
CREATE DATABASE RpgOnlineSENAI
GO

USE RpgOnlineSENAI
GO

CREATE TABLE Usuarios(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Classes(
	ClasseId INT PRIMARY KEY IDENTITY,
	NomeClasse VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)
GO

CREATE TABLE Personagens(
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(15) UNIQUE NOT NULL,
	UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId)
)
GO

CREATE TABLE Habilidades(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	NomeHabilidade VARCHAR(50) UNIQUE NOT NULL
)
GO

CREATE TABLE ClasseHabilidade(
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadeId INT FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
)


--DML
INSERT INTO Usuarios VALUES ('email@email.com', '123456')
INSERT INTO Classes VALUES ('Bárbaro', 'Descrição do bárbaro')
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('DeBug', 1, 1)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (1, 1), (1, 2)

INSERT INTO Usuarios VALUES ('email2@email.com', '123456')
INSERT INTO Classes VALUES ('Monge', 'Descrição do monge')
INSERT INTO Habilidades VALUES ('Recuperar vida')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('BitBug', 2, 2)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (2, 2), (2, 3)

UPDATE Usuarios
SET Senha = '123456'
WHERE UsuarioId = 1

--DQL
SELECT * FROM Habilidades
ORDER BY HabilidadeId

--JOIN em 2 tabelas
SELECT P.NomePersonagem, C.NomeClasse 'Classe', C.Descricao FROM Personagens AS P JOIN Classes C
ON P.ClasseId = C.ClasseId

--JOIN em 3 tabelas (Desafio cumprido :D)
SELECT Personagens.NomePersonagem, Classes.NomeClasse 'Classe', Classes.Descricao, Usuarios.UsuarioId 'Usuário' FROM Personagens JOIN Classes
ON Personagens.PersonagemId = Classes.ClasseId JOIN Usuarios ON Usuarios.UsuarioId = Personagens.PersonagemId