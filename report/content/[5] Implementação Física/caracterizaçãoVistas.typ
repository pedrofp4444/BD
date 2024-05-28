#let caracterizaçãoVistas = {
  [
    == Definição e caracterização de vistas de utilização em SQL

    Nesta secção, apresenta-se a definição de um conjunto de vistas essenciais para uma utilização eficiente da base de dados implementada. As vistas foram criadas para fornecer informações relevantes sobre os funcionários e suas características, bem como sobre casos e terrenos, facilitando o trabalho dos detetives e representantes. Para a caracterização destas vistas foram usadas um conjunto de seleções e junções.

    A primeira vista cria uma tabela virtual que contém informações vitais para a identificação de um funcionário, incluindo o nome e o número de telemóvel, além de dados cruciais para uma compreensão completa dos casos associados a cada funcionário.

    #align(center)[
      #figure(
        kind: image,
        caption: [Vista que demonstra todos os funcionários e os seus casos associados.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- View das informações dos funcionários e dos casos associados
          CREATE VIEW FuncionariosEmCasos AS
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
          ```
        )
      )
    ]

    A segunda vista foca-se na utilização pelos representantes, permitindo-lhes acessar de forma exclusiva as informações de identificação de um funcionário, entre elas, o nome, o número de telemóvel, função desempenhada e através de uma função, a idade, assim como os dados relativos aos terrenos aos quais cada funcionário está associado. 
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Vista que demonstra todos os funcionários e os seus casos associados.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- View das informações dos funcionários e dos terrenos associados
          CREATE VIEW FuncionariosEmTerrenos AS
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
          ```
        )
      )
    ]

    Segue abaixo, um exemplo de formato de utilização de uma das vistas criadas:
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Exemplo de utilização da vista "FuncionariosEmTerrenos".],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Exemplo de utilização da vista FuncionariosEmTerrenos
          SELECT *
          FROM FuncionariosEmTerrenos;
          ```
        )
      )
    ]
    
  ]
}
