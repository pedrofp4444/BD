#let implementaçãoPFG = {
  [
    == Implementação de procedimentos, funções e gatilhos

    Como forma de automatizar e simplificar processos dentro do contexto do sistema de gestão da base de dados, foram definidos alguns gatilhos, funções e procedimentos. De seguida, evidenciam-se os mesmos, assim como a explicação para a sua implementação.

    \
    A função "CalcularEstimativaDeRoubo" permite ao sistema calcular rapidamente quantos quilogramas de minério foram roubados de um terreno, recebendo, para o efeito, apenas o ID do terreno em questão. Desta forma, a função devolve a subtração do minério previsto pelo minério realmente coletado. Esta função revela-se bastante útil uma vez que simplifica todo o processo de seleção e cálculo envolvido neste contexto e é usada, por exemplo, pelo procedimento "CriarCasoETornarSuspeitos" (evidenciado posteriormente).

    #align(center)[
      #figure(
        kind: image,
        caption: [Função que calcula a estimativa de roubo de um caso.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
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
          ```
        )
      )
    ]

    Para facilitar a visualização da idade dos utilizadores, decidimos criar a função "CalcularIdade". Esta função calcula a idade atual a partir da data de nascimento fornecida. A função é utilizada na vista "FuncionariosEmTerrenos" para apresentar a idade de um funcionário de forma clara.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Função que calcula a idade através de uma data de nascimento.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
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
          ```
        )
      )
    ] 

    \
    O gatilho "AtualizarDataEncerramento" é responsável por atribuir uma data de encerramento a um determinado caso que tenha encerrado recentemente. Assim sendo, a partir das suas tabelas OLD e NEW, é possível perceber, registo a registo, se houve uma atualização do estado de um certo caso para "Fechado" e, em caso afirmativo, atribui-se a data atual, usando a função CURDATE(), à data de encerramento do mesmo. Desta forma, este gatilho acaba por eliminar a necessidade da atribuição manual de uma data de encerramento a um determinado caso, sempre que o mesmo se dá como concluído. Isto promove uma maior abstração no contexto de manipulação de casos no que toca à interação dos utilizadores com a base de dados.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Gatilho responsável por atualizar a data de encerramento de um caso.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
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
          ```
        )
      )
    ]

    \
    O procedimento "CriarCasoETornarSuspeitos" tem como propósito automatizar o processo de criação de um caso relativo a um terreno e aos seus trabalhadores. O mesmo recebe o ID de um terreno e abre um caso, marcando todos os funcionários do mesmo como suspeitos. Para tal, faz uso da tabela trabalha, da qual consegue recolher todos os funcionários que lá trabalham, e cria um novo suspeito, por cada funcionário, com os atributos estado, envolvimento e notas já pré-definidos. 
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Procedimento que automatiza a atribuição de suspeitos a um novo caso.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
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
          ```
        )
      )
    ]
  ]
}