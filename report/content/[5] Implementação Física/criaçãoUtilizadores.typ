#let criaçãoUtilizadores = {
  [
     == Criação de utilizadores da base de dados
    
     Beneficiando agora dos requisitos de controlo recolhidos inicialmente, a equipa passou a desenvolver e definir toda a caracterização relativa aos utilizadores da base de dados em questão. Neste caso, os únicos utilizadores a serem criados no sistema seriam os representantes da _Lusium_ e os detetives do departamento de espionagem. Seguida da criação dos mesmos, são definidas as suas permissões de trabalho na base de dados, de forma a garantir a segurança e integridade da mesma.

     \
     Na base de dados, o utilizador "detetive" foi criado com permissões limitadas ao controlo de casos e suspeitos adjacentes. Para tal, a este utilizador são atribuídas permissões de "SELECT", "INSERT" e "UPDATE" nas tabelas Caso e Suspeito e de, unicamente, "SELECT" na tabela Funcionário e na view FuncionariosEmCasos. Para além disso, também conta com permissões de execução do procedimento CriarCasosETornarSuspeitos e da função CalcularEstimativaDeRoubo.
     
     #align(center)[
      #figure(
        kind: image,
        caption: [Criação de utilizadores "detetive" e devidas permissões.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          CREATE USER 'detetive'@'localhost' IDENTIFIED BY 'detetive1234';
          
          GRANT SELECT, INSERT, UPDATE ON Caso                  TO 'detetive'@'localhost';
          GRANT SELECT, INSERT, UPDATE ON Suspeito              TO 'detetive'@'localhost';
          GRANT SELECT                 ON Funcionário           TO 'detetive'@'localhost';
          GRANT SELECT                 ON FuncionariosEmCasos   TO 'detetive'@'localhost';
          GRANT EXECUTE ON PROCEDURE CriarCasoETornarSuspeitos  TO 'detetive'@'localhost';
          GRANT EXECUTE ON FUNCTION CalcularEstimativaDeRoubo   TO 'detetive'@'localhost';
          ```
        )
      )
    ]
    \

    Foi também criado o utilizador "representante" com permissões limitadas ao controlo de funcionários e terrenos. Assim, o mesmo tem acesso às tabelas Gere, Função, Terreno, Trabalha, Funcionário e Número de telemóvel, onde está restrito às operações de "SELECT", "INSERT" e "UPDATE" nas mesmas. Adicionalmente, também dispõe da permissão de "SELECT" na vista FuncionariosEmTerrenos.  
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Criação de utilizadores "representantes" e devidas permissões.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql         
          CREATE USER 'representante'@'localhost' IDENTIFIED BY 'representante1234';
          
          GRANT SELECT, INSERT, UPDATE ON Gere                   TO 'representante'@'localhost';
          GRANT SELECT, INSERT, UPDATE ON Função                 TO 'representante'@'localhost';
          GRANT SELECT, INSERT, UPDATE ON Terreno                TO 'representante'@'localhost';
          GRANT SELECT, INSERT, UPDATE ON Trabalha               TO 'representante'@'localhost';
          GRANT SELECT, INSERT, UPDATE ON Funcionário            TO 'representante'@'localhost';
          GRANT SELECT, INSERT, UPDATE ON Número de telemóvel    TO 'representante'@'localhost';
          GRANT SELECT                 ON FuncionariosEmTerrenos TO 'representante'@'localhost';
          ```
        )
      )
    ]
    \

    Desta forma, ficam definidos os utilizadores da base de dados, assim como as suas permissões. Os detetives apenas têm autorização para manipular os casos e os seus suspeitos, enquanto que os representantes têm permissões mais abrangentes que lhes permitem manipular todas as tabelas, com a exceção das tabelas caso e suspeito.
  ]
}