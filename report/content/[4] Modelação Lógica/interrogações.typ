#import "@preview/commute:0.2.0": node, arr, commutative-diagram


#let interrogações = {
  [
    == Validação do Modelo com Interrogações do Utilizador

    No âmbito do projeto, é fundamental garantir que o modelo lógico concebido satisfaz os requisitos de manipulação estabelecidos. Uma das formas de validação do modelo ocorre através da execução de consultas ou queries, neste caso, representadas em Álgebra Relacional. Esta abordagem permite comprovar se as operações de manipulação de dados permitem fornecer os dados previstos.

    Para cumprir este fim, apresentam-se de seguida sete expressões em Álgebra Relacional que refletem os sete requisitos de manipulação estabelecidos anteriormente:

    #block(
      breakable: false,
      above: 30pt,
      [
    #underline[*Listar o prejuízo de um terreno:*] (Requisito 1, #link(<Tabela2>, "Tabela 2"))

    Para o exemplo do terreno de ID número 1.
    
    #linebreak()

    #figure(
      kind: image,
      caption: "Ilustração do primeiro diagrama de Álgebra Relacional.",
      gap: 20pt,
      align(center)[
        #commutative-diagram(
          padding: 0pt,
          node-padding: (0pt, 30pt),
          node((0, 0), [Caso]),
          node((1, 0), [$pi_"Caso_ID, Terreno_ID, Estimativa_de_roubo"$]),
          node((2, 0), [$sigma_"Terreno_ID = 1"$]),
          node((3, 0), [$pi_"Caso_ID, Estimativa_de_roubo"$]),
          arr((0,0), (1,0), ""),
          arr((1,0), (2,0), ""),
          arr((2,0), (3,0), ""),
        )
      ]
    )

    #linebreak()

    Casos_total $arrow.l$ $pi$#sub[Caso_ID, Terreno_ID, Estimativa_de_roubo] (Casos)

    Caso_Terreno $arrow.l$ $sigma$#sub[Terreno_ID = 1] (Casos_total)

    $pi$#sub[Caso_ID, Estimativa_de_roubo] (Casos_Terreno)

    ])

    #block(
      breakable: false,
      above: 30pt,
      [
      #underline[*Ver quando é que um funcionário se tornou suspeito de um determinado caso:*] (Requisito 2,  #link(<Tabela2>, "Tabela 2")) \

    Para o exemplo do caso de ID número 1.
    
    #linebreak()

    #figure(
      kind: image,
      caption: "Ilustração do segundo diagrama de Álgebra Relacional.",
      gap: 20pt,
      align(center)[
        #commutative-diagram(
          padding: 0pt,
          node-padding: (0pt, 30pt),
          node((0, 0), [Caso]),
          node((1, 0), [$sigma_"Caso_ID = 1"$]),
          node((2, 0), [$pi_"Data_de_abertura"$]),
          arr((0,0), (1,0), ""),
          arr((1,0), (2,0), ""),
        )
      ]
    )

    #linebreak()
    
    $pi$#sub[Data_de_abertura] ($sigma$#sub[Caso_ID = ID_Caso_Pretendido] (Caso))

      ])

    #block(
      breakable: false,
      above: 30pt,
      [
    #underline[*Listar os suspeitos de um determinado caso:*] (Requisito 3, #link(<Tabela2>, "Tabela 2")) \

    Para o exemplo do caso de ID número 1.
    
    #linebreak()

    #figure(
      kind: image,
      caption: "Ilustração do terceiro diagrama de Álgebra Relacional.",
      gap: 20pt,
      align(center)[
      #commutative-diagram(
        padding: 0pt,
        node-padding: (0pt, 30pt),
        node((0, 0), [Suspeito]),
        node((1, 0), [$pi_"Caso_ID, Funcionário_ID"$]),
        node((2, 0), [$sigma$#sub[Caso_ID = 1]]),
        node((3, 0), [$pi_"Funcionário_ID"$]),
        arr((0,0), (1,0), ""),
        arr((1,0), (2,0), ""),
        arr((2,0), (3,0), ""),
      )
    ]
  )

    #linebreak()
    
    Suspeitos $arrow.l$ $pi$#sub[Caso_ID, Funcionário_ID] (Suspeitos)

    Suspeitos_Caso $arrow.l$ $sigma$#sub[Caso_ID = 1] (Suspeitos)

    $pi$ #sub[Funcionário_ID] (Suspeitos_Caso)
    ])
    
    #block(
      breakable: false,
      [
       #underline[*Ver a data do último caso de um determinado funcionário:*] (Requisito 4,  #link(<Tabela2>, "Tabela 2")) \

    Para o exemplo do funcionário de ID número 1.
    
    #linebreak()

    #figure(
      kind: image,
      caption: "Ilustração do quarto diagrama de Álgebra Relacional.",
      gap: 20pt,
      align(center)[
      #commutative-diagram(
        padding: 0pt,
        node-padding: (0pt, 30pt),
        node((0, 0), [Suspeito]),
        node((0, 2), [Caso]),
        node((1, 0), [$sigma_"Funcionário_ID = 1"$]),
        node((2, 0), [$pi_"Caso_ID"$]),
        node((2, 2), [$pi_"Caso_ID, Data_de_abertura"$]),
        node((3, 1), [$join_"Caso_ID = Caso_ID"$]),
        node((4, 1), [$Gamma_"dec Data_de_abertura"$]),
        node((5, 1), [$sigma_1$]),
        arr((0,0), (1,0), ""),
        arr((1,0), (2,0), ""),
        arr((2,0), (3,1), ""),
        arr((0,2), (2,2), ""),
        arr((2,2), (3,1), ""),
        arr((3,1), (4,1), ""),
        arr((4,1), (5,1), ""),
      )
    ]
  )

    #linebreak()

    Suspeito $arrow.l$ $pi$#sub[Caso_ID] ($sigma$#sub[Funcionário_ID = 1] (Suspeito))

    Caso $arrow.l$ $pi$#sub[Caso_ID, Data_de_abertura]

    Casos_Suspeito $arrow.l$ (Suspeito) $join$#sub[Caso_ID = Caso_ID] (Caso)

    $sigma$(1)$tau$#sub[dec Data_de_abertura] (Casos_Suspeitos)

      
    ])

    #block(
      breakable: false,
      above: 30pt,
      [
      #underline[*Listar os casos a que um determinado funcionário está associado:*] (Requisito 5,  #link(<Tabela2>, "Tabela 2")) \

    Para o exemplo do funcionário de ID número 1.
    
    #linebreak()

    #figure(
      kind: image,
      caption: "Ilustração do quinto diagrama de Álgebra Relacional.",
      gap: 20pt,
      align(center)[
      #commutative-diagram(
        padding: 0pt,
        node-padding: (0pt, 30pt),
        node((0, 0), [Suspeito]),
        node((1, 0), [$sigma_"Funcionário_ID = 1"$]),
        node((2, 0), [$sigma_"Caso_ID"$]),
        arr((0,0), (1,0), ""),
        arr((1,0), (2,0), ""),
      )
    ]
  )

    #linebreak()

    $pi$#sub[Caso_ID] ($sigma$ #sub[Funcionário_ID = 1] (Suspeito))

    ])

    #block(
      breakable: false,
      above: 30pt,
      [
      #underline[*Ver o dia em que mais casos foram abertos:*] (Requisito 6,  #link(<Tabela2>, "Tabela 2")) \

    #linebreak()

    #figure(
      kind: image,
      caption: "Ilustração do sexto diagrama de Álgebra Relacional.",
      gap: 20pt,
      align(center)[
      #commutative-diagram(
        padding: 0pt,
        node-padding: (0pt, 30pt),
        node((0, 0), [$#sub[Quantidade_de_casos]$F$#sub[COUNT(Data_de_abertura), $pi$(Data_de_abertura)] ("Caso")$]),
        node((1, 0), [Caso]),
        node((2, 0), [$Gamma_"dec Quantidade_de_casos"$]),
        node((3, 0), [$sigma_1$]),
        arr((1,0), (2,0), ""),
        arr((2,0), (3,0), ""),
      )
    ]
  )

    #linebreak()

    #sub[Quantidade_Casos]$F$#sub[COUNT Data_de_abertura] (Caso)

     $pi$#sub[Data de abertura] ($sigma$(1)$tau$#sub[Quantidade_Casos_COUNT] (Quantidade_Casos))

    ])

    #block(
      breakable: false,
      above: 30pt,
      [
          #underline[*Listar os top 5 funcionários por quantidade de casos:*] (Requisito 7,  #link(<Tabela2>, "Tabela 2")) \

    #linebreak()

    #figure(
      kind: image,
      caption: "Ilustração do sétimo diagrama de Álgebra Relacional.",
      gap: 20pt,
      align(center)[     
        #commutative-diagram(
          padding: 0pt,
          node-padding: (0pt, 30pt),
          node((0, 0), [$#sub[Quantidade_de_casos]$F$#sub[COUNT(Funcionário_ID), $pi$(Funcionário_ID)] ("Suspeito")$]),
          node((1, 0), [Quantidade_de_casos]),
          node((2, 0), [$tau$#sub[dec Quantidade_Casos] (Quantidade_Casos)]),
          node((3, 0), [$pi$#sub[Funcionário_ID]]),
          node((4, 0), [$sigma_5$]),
          arr((1,0), (2,0), ""),
          arr((2,0), (3,0), ""),
          arr((3,0), (4,0), ""),
        )
    ]
  )

    #linebreak()

    #sub[Quantidade_Casos]$F$#sub[COUNT Funcionário_ID] (Suspeito)

    $pi$#sub[Funcionário_ID] ($sigma$(5)$tau$#sub[dec Quantidade_Casos] (Quantidade_Casos))
    
    ])
        
  ]
}