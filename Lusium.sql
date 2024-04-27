CREATE DATABASE IF NOT EXISTS Lusium;

USE Lusium;

-- Criação da tabela Função
CREATE TABLE Função (
    Função_ID INT PRIMARY KEY,
    Designação ENUM('Operacional', 'Detetive', 'Representante')
);

-- Criação da tabela Funcionário
CREATE TABLE Funcionario (
    Funcionario_ID INT PRIMARY KEY,
    Nome VARCHAR(75),
    Data_de_nascimento DATE,
    Salário INT,
    NIF VARCHAR(10),
    Fotografia VARCHAR(150),
    Função_ID INT,
    FOREIGN KEY (Função_ID) REFERENCES Função(Função_ID)
);

-- Criação da tabela Número de telemóvel
CREATE TABLE Número_de_telemoveL (
    Número_de_telemoveL_ID INT PRIMARY KEY,
    Funcionario_ID INT,
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(Funcionario_ID)
);

-- Criação da tabela Gere
CREATE TABLE Gere (
    Funcionario_Gestor_ID INT,
    Funcionario_ID INT,
    PRIMARY KEY (Funcionario_Gestor_ID, Funcionario_ID),
    FOREIGN KEY (Funcionario_Gestor_ID) REFERENCES Funcionario(Funcionario_ID),
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(Funcionario_ID)
);

-- Criação da tabela Terreno
CREATE TABLE Terreno (
    Terreno_ID INT PRIMARY KEY,
    Minério_previsto INT,
    Minério_coletado INT
);

-- Criação da tabela Trabalha
CREATE TABLE Trabalha (
    Funcionario_ID INT,
    Terreno_ID INT,
    PRIMARY KEY (Funcionario_ID, Terreno_ID),
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(Funcionario_ID),
    FOREIGN KEY (Terreno_ID) REFERENCES Terreno(Terreno_ID)
);

-- Criação da tabela Caso
CREATE TABLE Caso (
    Caso_ID INT PRIMARY KEY,
    Data_de_abertura DATE,
    Estado ENUM('Aberto', 'Fechado'),
    Estimativa_de_roubo INT,
    Data_de_encerramento DATE,
    Terreno_ID INT,
    FOREIGN KEY (Terreno_ID) REFERENCES Terreno(Terreno_ID)
);

-- Criação da tabela Suspeito
CREATE TABLE Suspeito (
    Funcionario_ID INT,
    Caso_ID INT,
    Estado ENUM('Inocente', 'Em investigação', 'Culpado'),
    Envolvimento INT,
    Notas TEXT,
    PRIMARY KEY (Funcionario_ID, Caso_ID),
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(Funcionario_ID),
    FOREIGN KEY (Caso_ID) REFERENCES Caso(Caso_ID)
);
