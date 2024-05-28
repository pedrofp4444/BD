-- Trigger: Atualizar Data de Encerramento do Caso ao Fechar
DELIMITER $$
CREATE TRIGGER AtualizarDataEncerramento
BEFORE UPDATE ON Caso
FOR EACH ROW
BEGIN
    IF NEW.Estado = 'Fechado' AND OLD.Estado != 'Fechado' THEN
        SET NEW.Data_de_encerramento = CURDATE();
    END IF;
END $$
DELIMITER ;

-- Function:  Calcular Média Salarial por Função
DELIMITER $$

CREATE FUNCTION MediaSalarialPorFuncao(p_Função_ID INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE media_salarial DECIMAL(10, 2);
    
    SELECT AVG(Salário) INTO media_salarial
    FROM Funcionário
    WHERE Função_ID = p_Função_ID;
    
    RETURN media_salarial;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION CalcularIdadeFuncionario(p_Funcionario_ID INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE v_Data_de_nascimento DATE;
    DECLARE v_Idade INT;

    -- Obter a data de nascimento do funcionário
    SELECT Data_de_nascimento INTO v_Data_de_nascimento
    FROM Funcionário
    WHERE Funcionário_ID = p_Funcionario_ID;

    -- Calcular a idade
    SET v_Idade = TIMESTAMPDIFF(YEAR, v_Data_de_nascimento, CURDATE());

    RETURN v_Idade;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION CalcularIdade(Data_de_nascimento DATE) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE idade INT;
    
    -- Calcula a idade considerando apenas o ano
    SET idade = YEAR(CURDATE()) - YEAR(Data_de_nascimento);
    
    -- Ajusta a idade se o aniversário ainda não ocorreu este ano
    IF (MONTH(CURDATE()) < MONTH(Data_de_nascimento)) OR 
       (MONTH(CURDATE()) = MONTH(Data_de_nascimento) AND DAY(CURDATE()) < DAY(Data_de_nascimento)) THEN
        SET idade = idade - 1;
    END IF;

    RETURN idade;
END $$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION CalcularEstimativaDeRoubo(p_Terreno_ID INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Estimativa_De_Roubo INT;

    -- Obter o minério previsto e coletado para o terreno especificado
    SELECT (Minério_previsto - Minério_coletado) INTO v_Estimativa_De_Roubo
    FROM Terreno WHERE Terreno_ID = p_Terreno_ID;

    RETURN v_Estimativa_De_Roubo;
END $$
DELIMITER ;

-- CALL CriarCasoETornarSuspeitos(TERRENO_ID, CURDATE());
DELIMITER $$
CREATE PROCEDURE CriarCasoETornarSuspeitos(
    IN p_Terreno_ID INT,
    IN p_Data_de_abertura DATE
)
BEGIN
    DECLARE v_Caso_ID INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
         -- Em caso de erro, reverter todas as operações	
         ROLLBACK;
    END;
    
    START TRANSACTION;
    
    -- Insere um novo caso
    INSERT INTO Caso (Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID)
    VALUES (p_Data_de_abertura, 'Aberto', CalcularEstimativaDeRoubo(p_Terreno_ID), NULL, p_Terreno_ID);
    
    -- Obter o último ID do caso inserido
    SET v_Caso_ID = LAST_INSERT_ID();

    -- Seleciona todos os funcionários que trabalham no terreno especificado
    INSERT INTO Suspeito (Funcionário_ID, Caso_ID, Estado, Envolvimento, Notas)
    SELECT t.Funcionário_ID, v_Caso_ID, 'Em Investigação', 3, 'Funcionário estava presente no terreno no dia do roubo'
    FROM Trabalha t
    WHERE t.Terreno_ID = p_Terreno_ID;

    COMMIT;
END $$

DELIMITER ;
