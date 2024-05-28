#let interrogações = {
  [
    == Tradução das interrogações do utilizador para SQL

    Nesta secção, apresenta-se uma análise detalhada das consultas SQL, convertidas dos requisitos de manipulação, utilizadas para extrair informações relevantes da base de dados da _Lusium_. Cada consulta aos dados foi cuidadosamente projetada para fornecer informações específicos sobre os dados relacionados a funcionários, terrenos e casos. Ao examinar cada interrogação, é possível entender melhor como os dados são manipulados e analisados de forma a auxiliar na investigação e tomada de decisões.

    No início do ficheiro, declaram-se três variáveis para permitir indicar qual o funcionário, caso ou terreno a ser utilizado na resolução das consultas, se necessário. Neste exemplo, propõe-se a utilização dos IDs 3, 3 e 1, para o funcionário, o caso e o terreno, respetivamente.

    #align(center)[
      #figure(
        kind: image,
        caption: [Declaração dos IDs para utilização nas consultas.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Definir variáveis para utilizar nas queries
          SET @Funcionario_ID = 3;
          SET @Caso_ID = 3;
          SET @Terreno_ID = 1;
          ```
        )
      )
    ]

    \
    A primeira consulta calcula o prejuízo de um terreno. Para isso, subtrai a quantidade de minério coletado da quantidade de minério previsto.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Listar o prejuízo de um terreno com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Listar o prejuízo de um terreno
          SELECT 
              Terreno_ID, 
              (Minério_previsto - Minério_coletado) AS Prejuízo
          FROM 
              Terreno
          WHERE Terreno_ID = @Terreno_ID;
          ```
        )
      )
    ]

    \
    A segunda consulta verifica quando um funcionário se tornou suspeito de um determinado caso. Ela une as tabelas "Suspeito" e "Caso" para obter a data de abertura do caso correspondente ao funcionário e caso especificados.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Ver quando é que um funcionário se tornou suspeito de um determinado caso com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Ver quando é que um funcionário se tornou suspeito de um determinado caso
          SELECT 
            s.Funcionário_ID, 
            s.Caso_ID, 
            c.Data_de_abertura
          FROM 
            Suspeito s
          INNER JOIN 
            Caso c ON s.Caso_ID = c.Caso_ID
          WHERE 
            s.Funcionário_ID = @Funcionário_ID 
            AND s.Caso_ID = @Caso_ID;
          ```
        )
      )
    ]

    \
    A terceira consulta lista todos os suspeitos de um determinado caso. Une as tabelas "Suspeito" e "Funcionário" para exibir informações detalhadas sobre os suspeitos, incluindo nome, estado, envolvimento e notas.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Listar os suspeitos de um determinado caso com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Listar os suspeitos de um determinado caso
          SELECT 
            s.Funcionário_ID, 
            f.Nome, 
            s.Estado, 
            s.Envolvimento, 
            s.Notas
          FROM 
            Suspeito s
          INNER JOIN 
            Funcionário f ON s.Funcionário_ID = f.Funcionário_ID
          WHERE 
            s.Caso_ID = @Caso_ID;
          ```
        )
      )
    ]

    \
    A quarta consulta mostra a data do último caso associado a um determinado funcionário. Junta as tabelas "Caso" e "Suspeito" e ordena os resultados por data de abertura em ordem decrescente, limitando a um único resultado.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Ver a data do último caso de um determinado funcionário com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Ver a data do último caso de um determinado funcionário
          SELECT 
            c.Caso_ID, 
            c.Data_de_abertura
          FROM 
            Caso c
          INNER JOIN 
            Suspeito s ON c.Caso_ID = s.Caso_ID
          WHERE 
            s.Funcionário_ID = @Funcionário_ID
          ORDER BY 
            c.Data_de_abertura DESC
          LIMIT 1;
          ```
        )
      )
    ]

    \
    A quinta consulta lista todos os casos a que um determinado funcionário está associado. Une as tabelas "Caso" e "Suspeito" para exibir informações detalhadas sobre os casos, incluindo estado, estimativa de roubo, data de encerramento e ID do terreno.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Listar os casos a que um determinado funcionário está associado com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
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
          INNER JOIN 
            Suspeito s ON c.Caso_ID = s.Caso_ID
          WHERE 
            s.Funcionário_ID = @Funcionário_ID;
          ```
        )
      )
    ]

    \
    A sexta consulta determina o dia em que mais casos foram abertos. Agrupa os casos pela data de abertura, conta quantos casos foram abertos em cada data, e ordena em ordem decrescente, limitando a um único resultado, ou seja, o que contém mais casos.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Ver o dia em que mais casos foram abertos com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
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
          ```
        )
      )
    ]

    \
    A última consulta lista os top 5 funcionários por quantidade de casos. Une as tabelas "Suspeito" e "Funcionário", agrupa por funcionário, conta os casos associados a cada um e ordena em ordem decrescente, limitando os resultados aos cinco principais.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Listar os top 5 funcionários por quantidade de casos com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Listar os top 5 funcionários por quantidade de casos
          SELECT 
            s.Funcionário_ID, 
            f.Nome, 
            COUNT(s.Caso_ID) AS Total_de_Casos
          FROM 
            Suspeito s
          INNER JOIN 
            Funcionário f ON s.Funcionário_ID = f.Funcionário_ID
          GROUP BY 
            s.Funcionário_ID, f.Nome
          ORDER BY 
            Total_de_Casos DESC
          LIMIT 5;
          ```
        )
      )
    ]

  ]
}
