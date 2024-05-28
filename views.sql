-- View das informações dos funcionários e dos casos associados.
CREATE VIEW Funcionarios_Em_Casos AS
SELECT
    Funcionário.Nome,
    Número_de_telemóvel.Número_de_telemóvel_ID,
    Caso.Caso_ID,
    Caso.Data_de_abertura,
    Caso.Estado,
    Caso.Estimativa_de_roubo,
    Caso.Data_de_encerramento,
    Caso.Terreno_ID
FROM
    Funcionário
INNER JOIN
    Suspeito ON Funcionário.Funcionário_ID = Suspeito.Funcionário_ID
INNER JOIN
    Caso ON Suspeito.Caso_ID = Caso.Caso_ID
LEFT JOIN
    Número_de_telemóvel ON Funcionário.Funcionário_ID = Número_de_telemóvel.Funcionário_ID;

-- View das informações dos funcionários e dos terrenos associados.
CREATE VIEW Funcionarios_Em_Terrenos AS
SELECT
	Funcionário.Nome,
    Função.Designação,
	Número_de_telemóvel.Número_de_telemóvel_ID,
	CalcularIdade(Funcionário.Data_de_nascimento) AS Idade,
	Funcionário.Salário,
	Terreno.Terreno_ID,
	Terreno.Minério_previsto,
	Terreno.Minério_coletado
FROM
	Funcionário
INNER JOIN
	Trabalha ON Funcionário.Funcionário_ID = Trabalha.Funcionário_ID
INNER JOIN
	Terreno ON Trabalha.Terreno_ID = Terreno.Terreno_ID
INNER JOIN
	Função ON Funcionário.Função_ID = Função.Função_ID
LEFT JOIN
	Número_de_telemóvel ON Funcionário.Funcionário_ID = Número_de_telemóvel.Funcionário_ID;
    
    