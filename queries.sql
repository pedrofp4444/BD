-- Definir variáveis para utilizar nas queries
SET @Funcionario_ID = 1;
SET @Caso_ID = 1;

-- Listar o prejuízo de um terreno
SELECT 
    Terreno_ID, 
    (Minério_previsto - Minério_coletado) AS Prejuízo
FROM 
    Terreno;

-- Ver quando é que um funcionário se tornou suspeito de um determinado caso
SELECT 
    s.Funcionário_ID, 
    s.Caso_ID, 
    c.Data_de_abertura
FROM 
    Suspeito s
JOIN 
    Caso c ON s.Caso_ID = c.Caso_ID
WHERE 
    s.Funcionário_ID = @Funcionario_ID 
    AND s.Caso_ID = @Caso_ID;

-- Listar os suspeitos de um determinado caso
SELECT 
    s.Funcionário_ID, 
    f.Nome, 
    s.Estado, 
    s.Envolvimento, 
    s.Notas
FROM 
    Suspeito s
JOIN 
    Funcionário f ON s.Funcionário_ID = f.Funcionário_ID
WHERE 
    s.Caso_ID = @Caso_ID;

-- Ver a data do último caso de um determinado funcionário
SELECT 
    c.Caso_ID, 
    c.Data_de_abertura
FROM 
    Caso c
JOIN 
    Suspeito s ON c.Caso_ID = s.Caso_ID
WHERE 
    s.Funcionário_ID = @Funcionario_ID
ORDER BY 
    c.Data_de_abertura DESC
LIMIT 1;

-- Listar os casos a que um determinado funcionário está associado
SELECT 
    c.Caso_ID, 
    c.Data_de_abertura, 
    c.Estado, 
    c.Estimativa_de_roubo, 
    c.Data_de_encerramento, 
    c.Terreno_ID
FROM 
    Caso c
JOIN 
    Suspeito s ON c.Caso_ID = s.Caso_ID
WHERE 
    s.Funcionário_ID = @Funcionario_ID;

-- Ver o dia em que mais casos foram abertos
SELECT 
    Data_de_abertura, 
    COUNT(*) AS Total_de_Casos
FROM 
    Caso
GROUP BY 
    Data_de_abertura
ORDER BY 
    Total_de_Casos DESC
LIMIT 1;

-- Listar os top 5 funcionários por quantidade de casos
SELECT 
    s.Funcionário_ID, 
    f.Nome, 
    COUNT(s.Caso_ID) AS Total_de_Casos
FROM 
    Suspeito s
JOIN 
    Funcionário f ON s.Funcionário_ID = f.Funcionário_ID
GROUP BY 
    s.Funcionário_ID, f.Nome
ORDER BY 
    Total_de_Casos DESC
LIMIT 5;
