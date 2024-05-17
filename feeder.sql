-- Inserção de dados na tabela Função
INSERT INTO Função (Função_ID, Designação) VALUES
    (1, 'Operacional'),
    (2, 'Detetive'),
    (3, 'Representante');

-- Inserção de dados na tabela Funcionario
INSERT INTO Funcionario (Funcionario_ID, Nome, Data_de_nascimento, Salário, NIF, Fotografia, Função_ID) VALUES
    (1, 'Miguel Silva', '1985-03-15', 1200, '123456789', 'foto_miguel.jpg', 1),
    (2, 'Ana Costa', '1990-07-21', 2800, '987654321', 'foto_ana.jpg', 2),
    (3, 'Pedro Santos', '1982-12-10', 3000, '456789123', 'foto_pedro.jpg', 3),
    (4, 'Sofia Pereira', '1988-05-02', 1000, '789123456', 'foto_sofia.jpg', 1),
    (5, 'Rui Oliveira', '1995-09-18', 2600, '321654987', 'foto_rui.jpg', 2),
    (6, 'Inês Rodrigues', '1980-11-30', 850, '654987321', 'foto_ines.jpg', 1),
    (7, 'Tiago Fernandes', '1993-04-25', 2900, '987321654', 'foto_tiago.jpg', 3);

-- Inserção de dados na tabela Número_de_telemoveL
INSERT INTO Número_de_telemoveL (Número_de_telemoveL_ID, Funcionario_ID) VALUES
    (934678592, 1),
    (966492873, 2),
    (922245762, 3),
    (936457856, 4),
    (926486516, 5),
    (964884547, 6),
    (964554178, 7);

-- Inserção de dados na tabela Gere
INSERT INTO Gere (Funcionario_Gestor_ID, Funcionario_ID) VALUES
    (3, 1),
    (3, 2),
    (3, 4),
    (6, 5),
    (6, 6),
    (6, 7);

-- Inserção de dados na tabela Terreno
INSERT INTO Terreno (Terreno_ID, Minério_previsto, Minério_coletado) VALUES
    (1, 1000, 800),
    (2, 1500, 1200),
    (3, 800, 600),
    (4, 2000, 1800),
    (5, 1200, 1000),
    (6, 1800, 1600),
    (7, 900, 700);

-- Inserção de dados na tabela Trabalha
INSERT INTO Trabalha (Funcionario_ID, Terreno_ID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7);

-- Inserção de dados na tabela Caso
INSERT INTO Caso (Caso_ID, Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID) VALUES
    (1, '2024-01-10', 'Aberto', 500, NULL, 1),
    (2, '2024-02-15', 'Fechado', 1000, '2024-05-05', 2),
    (3, '2024-03-20', 'Aberto', 700, NULL, 3),
    (4, '2024-04-25', 'Aberto', 800, NULL, 4),
    (5, '2024-05-01', 'Aberto', 300, NULL, 5),
    (6, '2024-05-08', 'Aberto', 900, NULL, 6),
    (7, '2024-05-10', 'Aberto', 600, NULL, 7);

-- Inserção de dados na tabela Suspeito
INSERT INTO Suspeito (Funcionario_ID, Caso_ID, Estado, Envolvimento, Notas) VALUES
    (1, 1, 'Inocente', 10, 'Nenhuma informação adicional.'),
    (2, 2, 'Culpado', 90, 'Suspeito estava presente na cena do crime.'),
    (3, 3, 'Em investigação', 50, 'Algumas pistas indicam possível envolvimento.'),
    (4, 4, 'Em investigação', 30, 'Não há provas concretas.'),
    (5, 5, 'Inocente', 20, 'Sem evidências contra o suspeito.'),
    (6, 6, 'Culpado', 80, 'Fortes indícios de participação.'),
    (7, 7, 'Em investigação', 40, 'Possível conexão com outras investigações.');
