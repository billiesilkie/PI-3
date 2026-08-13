drop database if exists lingobug;
create database lingobug;
use lingobug;

-- Tabela Usuario
CREATE TABLE Usuario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);

-- Tabela Questao
CREATE TABLE Questao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Enunciado TEXT NOT NULL,
    Verdadeira VARCHAR(255) NOT NULL,
    Falsa1 VARCHAR(255) NOT NULL,
    Falsa2 VARCHAR(255) NOT NULL,
    Falsa3 VARCHAR(255) NOT NULL
);

-- Tabela associativa Responde (relacionamento N:M entre Usuario e Questao)
CREATE TABLE Responde (
    UsuarioID INT NOT NULL,
    QuestaoID INT NOT NULL,
    Resultado VARCHAR(50),
    RespondidoEm VARCHAR(20),
    PRIMARY KEY (UsuarioID, QuestaoID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (QuestaoID) REFERENCES Questao(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
