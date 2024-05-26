-- Inserção de dados na tabela Função
INSERT INTO Função (Designação) VALUES
    ('Operacional'),
    ('Detetive'),
    ('Representante');
    

-- Inserção de dados na tabela Funcionário
INSERT INTO Funcionário (Nome, Data_de_nascimento, Salário, NIF, Fotografia, Função_ID) VALUES
    ('Miguel Silva', '1985-03-15', 1200, '123456789', 'foto_miguel.jpg', 1),
    ('Ana Costa', '1990-07-21', 2800, '987654321', 'foto_ana.jpg', 2),
    ('Pedro Santos', '1982-12-10', 3000, '456789123', 'foto_pedro.jpg', 3),
    ('Sofia Pereira', '1988-05-02', 1000, '789123456', 'foto_sofia.jpg', 1),
    ('Rui Oliveira', '1995-09-18', 2600, '321654987', 'foto_rui.jpg', 2),
    ('Inês Rodrigues', '1980-11-30', 850, '654987321', 'foto_ines.jpg', 1),
    ('Tiago Fernandes', '1993-04-25', 2900, '987321654', 'foto_tiago.jpg', 3);

-- Inserção de dados na tabela Número_de_telemóvel
INSERT INTO Número_de_telemóvel (Número_de_telemóvel_ID, Funcionário_ID) VALUES
    (934678592, 1),
    (966492873, 2),
    (922245762, 3),
    (936457856, 4),
    (926486516, 5),
    (964884547, 6),
    (964554178, 7);

-- Inserção de dados na tabela Gere
INSERT INTO Gere (Funcionário_Gestor_ID, Funcionário_ID) VALUES
    (3, 1),
    (3, 2),
    (3, 4),
    (6, 5),
    (6, 6),
    (6, 7);

-- Inserção de dados na tabela Terreno
INSERT INTO Terreno (Minério_previsto, Minério_coletado) VALUES
    (1000, 800),
    (1500, 1200),
    (800, 600),
    (2000, 1800),
    (1200, 1000),
    (1800, 1600),
    (900, 700);

-- Inserção de dados na tabela Trabalha
INSERT INTO Trabalha (Funcionário_ID, Terreno_ID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7);

-- Inserção de dados na tabela Caso
INSERT INTO Caso (Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID) VALUES
    ('2024-01-10', 'Aberto', 500, NULL, 1),
    ('2024-02-15', 'Fechado', 1000, '2024-05-05', 2),
    ('2024-03-20', 'Aberto', 700, NULL, 3),
    ('2024-04-25', 'Aberto', 800, NULL, 4),
    ('2024-05-01', 'Aberto', 300, NULL, 5),
    ('2024-05-08', 'Aberto', 900, NULL, 6),
    ('2024-05-10', 'Aberto', 600, NULL, 7);

-- Inserção de dados na tabela Suspeito
INSERT INTO Suspeito (Funcionário_ID, Caso_ID, Estado, Envolvimento, Notas) VALUES
    (1, 1, 'Inocente', 1, 'Nenhuma informação adicional.'),
    (2, 2, 'Culpado', 9, 'Suspeito estava presente na cena do crime.'),
    (3, 3, 'Em investigação', 5, 'Algumas pistas indicam possível envolvimento.'),
    (4, 4, 'Em investigação', 3, 'Não há provas concretas.'),
    (5, 5, 'Inocente', 2, 'Sem evidências contra o suspeito.'),
    (6, 6, 'Culpado', 8, 'Fortes indícios de participação.'),
    (7, 7, 'Em investigação', 4, 'Possível conexão com outras investigações.');
