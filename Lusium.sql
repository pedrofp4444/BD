CREATE DATABASE IF NOT EXISTS Lusium;

USE Lusium;

-- Criação da tabela Função
CREATE TABLE Função (
    Função_ID INT PRIMARY KEY NOT NULL,
    Designação ENUM('Operacional', 'Detetive', 'Representante') NOT NULL
);

-- Criação da tabela Funcionário
CREATE TABLE Funcionário (
    Funcionário_ID INT PRIMARY KEY NOT NULL,
    Nome VARCHAR(75) NOT NULL,
    Data_de_nascimento DATE NOT NULL,
    Salário INT NOT NULL,
    NIF VARCHAR(10) NOT NULL,
    Fotografia VARCHAR(150) NULL,
    Função_ID INT NOT NULL,
    FOREIGN KEY (Função_ID) REFERENCES Função(Função_ID)
);

-- Criação da tabela Número de telemóvel
CREATE TABLE Número_de_telemóvel (
    Número_de_telemóvel_ID INT PRIMARY KEY NOT NULL,
    Funcionário_ID INT NOT NULL,
    FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID)
);

-- Criação da tabela Gere
CREATE TABLE Gere (
    Funcionário_Gestor_ID INT NOT NULL,
    Funcionário_ID INT NOT NULL,
    PRIMARY KEY (Funcionário_Gestor_ID, Funcionário_ID),
    FOREIGN KEY (Funcionário_Gestor_ID) REFERENCES Funcionário(Funcionário_ID),
    FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID)
);

-- Criação da tabela Terreno
CREATE TABLE Terreno (
    Terreno_ID INT PRIMARY KEY NOT NULL,
    Minério_previsto INT NOT NULL,
    Minério_coletado INT NOT NULL
);

-- Criação da tabela Trabalha
CREATE TABLE Trabalha (
    Funcionário_ID INT NOT NULL,
    Terreno_ID INT NOT NULL,
    PRIMARY KEY (Funcionário_ID, Terreno_ID),
    FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID),
    FOREIGN KEY (Terreno_ID) REFERENCES Terreno(Terreno_ID)
);

-- Criação da tabela Caso
CREATE TABLE Caso (
    Caso_ID INT PRIMARY KEY NOT NULL,
    Data_de_abertura DATE NOT NULL,
    Estado ENUM('Aberto', 'Fechado') NOT NULL,
    Estimativa_de_roubo INT NOT NULL,
    Data_de_encerramento DATE NULL,
    Terreno_ID INT NOT NULL,
    FOREIGN KEY (Terreno_ID) REFERENCES Terreno(Terreno_ID)
);

-- Criação da tabela Suspeito
CREATE TABLE Suspeito (
    Funcionário_ID INT NOT NULL,
    Caso_ID INT NOT NULL,
    Estado ENUM('Inocente', 'Em investigação', 'Culpado') NOT NULL,
    Envolvimento INT NOT NULL,
    Notas TEXT NULL,
    PRIMARY KEY (Funcionário_ID, Caso_ID),
    FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID),
    FOREIGN KEY (Caso_ID) REFERENCES Caso(Caso_ID)
);
