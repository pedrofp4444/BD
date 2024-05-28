#let calculoEspaço = {
  [
    == Cálculo do espaço da base de dados (inicial e taxa de crescimento anual) 

    De forma a perceber o espaço que a base de dados pode vir a ocupar, calculamos inicialmente o mesmo quando existe apenas um registo por tabela e, numa fase final, estimou-se o espaço total necessário para armazenar toda a informação contida na base de dados, assim como a informação que surgirá com um determinado crescimento anual esperado.
    
    Assim, representa-se, a seguir, uma tabela que evidencia os tipos de dados usados no sistema, acompanhados pelos seus tamanhos respetivos em bytes, de acordo com o manual de referência do MySQL 8.0 /*Falta aqui a referência que devem colocar na bibliografia*/.
    
    #figure(
      caption: "Tipos de dados utilizados e o seu respetivo tamanho em bytes.",
      kind: table,
      table(
        columns: (0.3fr, 0.5fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tipo de dados*], [*Tamanho (bytes)*]),
        [INT], [4],
        /* - */
        [DATE], [3],   
        /* - */
        [TEXT], [L + 2 bytes, onde L < 2#super[16]],
        /* - */
        [VARCHAR(M)], [L + 1 bytes caso a coluna necessite 0 − 255 bytes],
        /* - */
        [ENUM('valor1','valor2',...)], [1 ou 2 bytes, dependendo no número de valores enumerados (máximo de 65,535 valores)]
      )
    )
    
    \
    Seguidamente, representam-se os espaços ocupados por cada tabela, em bytes, para quando existe apenas um registo na mesma.

    #figure(
      caption: "Espaço ocupado pela tabela Funcionário com um registo.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Tamanho (bytes)*]),
        table.cell(
          rowspan: 7,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Funcionário
          ],
        ),
        /* - */
        ["Funcionário_ID"], [INT], [4],
        /* - */
        ["Nome"], [VARCHAR(75)], [76],   
        /* - */
        [“Data_de_nascimento”], [DATE], [3],
        /* - */
        ["Salário"], [INT], [4],
        /* - */
        ["NIF"], [VARCHAR(10)], [11],
        /* - */
        ["Fotografia"], [VARCHAR(150)], [151],
        /* - */
        ["Função_ID"], [INT], [4],
        /* - */
        [*Total*], [-], [-], [*253*],
      )
    )
    
    \
    #figure(
      caption: "Espaço ocupado pela tabela Número de Telemóvel com um registo.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr),
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Tamanho (bytes)*]),
        table.cell(
          rowspan: 2,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Número de Telemóvel
          ],
        ),
        /* - */
        ["Número_de_Telemóvel"], [INT], [4],
        /* - */
        ["Funcionário_ID], [INT], [4],
        /* - */
        [*Total*], [-], [-], [*8*],
      )
    )
    
    \
    #figure(
      caption: "Espaço ocupado pela tabela Função com um registo.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Tamanho (bytes)*]),
        table.cell(
          rowspan: 2,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Função
          ],
        ),
        /* - */
        ["Função_ID"], [INT], [4],
        /* - */
        ["Designação"], [ENUM(“Representante”, “Detetive”, “Operacional”)], [1],   
        /* - */
        [*Total*], [-], [-], [*5*],
      )
    )
    
    \
    #figure(
      caption: "Espaço ocupado pela tabela Gere com um registo.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Tamanho (bytes)*]),
        table.cell(
          rowspan: 2,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Gere
          ],
        ),
        /* - */
        ["Funcionário_ID"], [INT], [4],
        /* - */
        ["Funcionário_Gestor_ID"], [INT], [4],
        /* - */
        [*Total*], [-], [-], [*8*],
      )
    )
    
    \
    #figure(
      caption: "Espaço ocupado pela tabela Terreno com um registo.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Tamanho (bytes)*]),
        table.cell(
          rowspan: 3,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Terreno
          ],
        ),
        /* - */
        ["Terreno_ID"], [INT], [4],
        /* - */
        ["Minério_previsto"], [INT], [4],   
        /* - */
        [“Minério_coletado”], [INT], [4],
        /* - */
        [*Total*], [-], [-], [*12*],
      )
    )
    
    \
    #figure(
      caption: "Espaço ocupado pela tabela Caso com um registo.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Tamanho (bytes)*]),
        table.cell(
          rowspan: 6,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Caso
          ],
        ),
        /* - */
        ["Caso_ID"], [INT], [4],
        /* - */
        ["Data_de_abertura"], [DATE], [3],   
        /* - */
        [“Estado”], [ENUM(“Aberto”, “Fechado”)], [1],
        /* - */
        ["Estimativa_de_roubo"], [INT], [4],
        /* - */
        ["Data_de_encerramento"], [DATE], [3],
        /* - */
        ["Terreno_ID"], [INT], [4],
        /* - */
        [*Total*], [-], [-], [*19*],
      )
    )
    
    \
    #figure(
      caption: "Espaço ocupado pela tabela Trabalha com um registo.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Tamanho (bytes)*]),
        table.cell(
          rowspan: 2,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Trabalha
          ],
        ),
        /* - */
        ["Funcionário_ID"], [INT], [4],
        /* - */
        ["Terreno_ID"], [INT], [4],
        /* - */
        [*Total*], [-], [-], [*8*],
      )
    )
    
    \
    #figure(
      caption: "Espaço ocupado pela tabela Suspeito com um registo.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Tamanho (bytes)*]),
        table.cell(
          rowspan: 5,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Suspeito
          ],
        ),
        /* - */
        ["Funcionário_ID"], [INT], [4],
        /* - */
        ["Caso_ID"], [INT], [4],   
        /* - */
        [“Estado”], [ENUM(“Inocente”, “Em Investigação”, “Culpado”)], [1],
        /* - */
        ["Envolvimento"], [INT], [4],
        /* - */
        ["Notas"], [TEXT(256)], [258],
        /* - */
        [*Total*], [-], [-], [*271*],
      )
    )

    Com esta configuração, o espaço total ocupado pelas tabelas, preenchidas com um registo cada, seria igual a 584 bytes.

    \
    Após o povoamento inicial, a base de dados conta com 100 funcionários registados, dos quais 3 são representantes e 10 são detetives. Cada funcionário tem, em média, 2 números de telemóvel e, geralmente, trabalha em 2 terrenos. Neste caso, existem 11 terrenos distintos e um total de 13 casos ativos, dos quais são suspeitos, em média, 18 funcionários. Para além disso, cada representante é responsável por gerir uma parte dos restantes 97 funcionários, neste caso, um dos representantes gere os 10 detetives e os outros dois gerem, respetivamente, 40 e 47 funcionários operacionais. Deste modo, é possível calcular o espaço total ocupado pelas tabelas na primeira implementação do sistema de gestão de base de dados.

    \
    #figure(
      caption: "Espaço total ocupado pelas tabelas com o povoamento inicial.",
      kind: table,
      table(
        columns: (0.3fr, 0.3fr, 0.3fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Quantidade de registos*], [*Tamanho da tabela (bytes)*]),
        /* - */
        [Funcionário], [100], [25300],
        /* - */
        [Número de Telemóvel], [200], [1600],  
        /* - */
        [Função], [100], [500],
        /* - */
        [Gere], [97], [776], /*Aqui é a parte que o Hélder comentou no discord.*/
        /* - */
        [Terreno], [11], [132],
        /* - */
        [Caso], [13], [247],
        /* - */
        [Trabalha], [200], [1600],
        /* - */
        [Suspeito], [234], [63414],
        /* - */
        [*Total*], [-], [*93569*],
      )
    )

    \
    Com base nas estatísticas anuais fornecidas pela empresa _Lusium_, é esperado que o número de funcionários e o número de terrenos aumente em 20% e 27%, respetivamente. Por outro lado, é expectável que surjam, em média, 7 novos casos por ano. Com isto, prevemos que no primeiro ano as tabelas vão ter, respetivamente, as seguintes variações:

    #figure(
      caption: "Variações do espaço ocupado pelas tabelas após um ano.",
      kind: table,
      table(
        columns: (0.3fr, 0.3fr, 0.3fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Quantidade de registos*], [*Diferença da tabela (bytes)*]),
        /* - */
        [Funcionário], [+20], [+5060],
        /* - */
        [Número de Telemóvel], [+40], [+320],  
        /* - */
        [Função], [+20], [+100],
        /* - */
        [Gere], [+20], [+160], /*Aqui é a parte que o Hélder comentou no discord.*/
        /* - */
        [Terreno], [+3], [+36],
        /* - */
        [Caso], [+7], [+133],
        /* - */
        [Trabalha], [+40], [+320],
        /* - */
        [Suspeito], [+119], [+32249],
        /* - */
        [*Total*], [-], [*+38378*],
      )
    )

    \
    Como foi evidenciado nas tabelas, o espaço necessário mínimo para a primeira implementação da base de dados seria de *93.6 _KBytes_*, com um crescimento anual de *41%*, em que no primeiro ano é traduzido por um aumento de *38.4 _KBytes_*. 
  ]
}
