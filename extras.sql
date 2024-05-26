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
/* Estava a dar muitos problemas esta function, documentamos para não chatear
DELIMITER $$

CREATE FUNCTION calcularIdade(funcionario_id INT)
RETURNS INT
BEGIN
  DECLARE data_nascimento DATE;
  DECLARE ano_atual INT;
  DECLARE mes_atual INT;
  DECLARE idade INT;

  -- Obter data de nascimento do funcionário
  SELECT Data_de_nascimento INTO data_nascimento FROM Funcionário WHERE Funcionário_ID = funcionario_id;

  -- Obter ano e mês atual
  SET ano_atual = YEAR(CURRENT_DATE);
  SET mes_atual = MONTH(CURRENT_DATE);

  -- Calcular a idade do funcionário
  SET idade = ano_atual - YEAR(data_nascimento);

  -- Ajustar a idade se o mês de nascimento for posterior ao mês atual
  IF MONTH(data_nascimento) > mes_atual THEN
    SET idade = idade - 1;
  ELSEIF MONTH(data_nascimento) = mes_atual AND DAY(data_nascimento) > DAY(CURRENT_DATE) THEN
    SET idade = idade - 1;
  END IF;

  -- Retornar a idade do funcionário
  RETURN idade;
END $$
DELIMITER ;
*/















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
