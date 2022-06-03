USE RpgOnlineSENAI

CREATE LOGIN aluno
WITH PASSWORD = '1234'

CREATE USER aluno FOR LOGIN aluno

GRANT SELECT TO aluno

SELECT * FROM Personagens

INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseId) VALUES ('TestandoPermissão', 4, 1)