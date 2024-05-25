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

CREATE FUNCTION MediaSalarialPorFuncao(p_Função_ID INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE media_salarial DECIMAL(10, 2);
    
    SELECT AVG(Salário) INTO media_salarial
    FROM Funcionário
    WHERE Função_ID = p_Função_ID;
    
    RETURN media_salarial;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION CalcularIdadeFuncionario(p_Funcionario_ID INT) RETURNS INT
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