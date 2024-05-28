#let explicação = {
  [
    == Apresentação e Explicação do Modelo Lógico Produzido

    Para a correta construção do modelo lógico, a equipa da “Quatro em Linha” reuniu-se para considerar como proceder à execução do diagrama, apoiado, inicialmente, por uma ponderação sobre a quantidade de tabelas a utilizar. Procede-se à apresentação dos resultados:
    
    - 4 tabelas, uma por entidade;
    - 2 tabelas, uma por cada relacionamento N para M;
    - 1 tabela de um atributo multivalorado;
    - 1 tabela de um relacionamento unário.
    
    A equipa iniciou a produção das 8 tabelas referidas acima de acordo com a ordem de formulação do modelo concetual. Para tal, inaugurou o diagrama com a criação da tabela de Funcionário ao herdar os atributos já definidos no diagrama de sustento, que se define pelas seguintes colunas:

    #figure(
      caption: "Caracterização da tabela lógica do Funcionário.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Referência (tabela)*]),
        table.cell(
          rowspan: 7,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Funcionário
          ],
        ),
        /* - */
        ["Funcionário_ID"],
        [INT],
        [-],
        /* - */
        ["Nome"],
        [VARCHAR(75)],
        [-],   
        /* - */
        [“Data_de_nascimento”],
        [DATE],
        [-],
        /* - */
        ["Salário"],
        [INT],
        [-],
        /* - */
        ["NIF"],
        [VARCHAR(10)],
        [-],
        /* - */
        ["Fotografia"],
        [VARCHAR(150)],
        [-],
        /* - */
        ["Função_ID"],
        [INT],
        [“Função_ID“ (Função)],
      )
    )
    
    De acordo com esta decisão, surgiu a necessidade de criar 2 tabelas com um relacionamento associado, sendo elas, a tabela de Número de telemóvel, derivada do atributo multivalorado “Número de telemóvel” da entidade Funcionário, e Função, constituída pela “Designação” correspondente ao cargo de um determinado Funcionário:

    #figure(
      caption: "Caracterização da tabela lógica do Número de telemóvel.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Referência (tabela)*]),
        table.cell(
          rowspan: 2,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Número de \ telemóvel /*AQUI DÁ PARA FICAR MELHOR*/
          ],
        ),
        /* - */
        [“Número_de_Telemóvel”],
        [INT],
        [-],
        /* - */
        [“Funcionário_ID”],
        [INT],
        ["Funcionário_ID" (Funcionário)],
      )
    ) 
    #figure(
      caption: "Caracterização da tabela lógica da Função.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Referência (tabela)*]),
        table.cell(
          rowspan: 2,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Função
          ],
        ),
        /* - */
        ["Função_ID"],
        [INT],
        [-],
        /* - */
        ["Designação"],
        [ENUM(“Representante”, “Detetive”, “Operacional”)],
        [-],   
      )
    ) 
    De acordo com os requisitos, torna-se necessário fazer surgir uma nova tabela denominada Gere, esta que deriva de um relacionamento unário da entidade Funcionário para a própria, permitindo assim a autogestão de informações:

    #figure(
      caption: "Caracterização da tabela lógica de Gere.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Referência (tabela)*]),
        table.cell(
          rowspan: 2,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Gere
          ],
        ),
        /* - */
        ["Funcionário_Gestor_ID"],
        [INT],
        [“Funcionário_ID” (Funcionário)],
        /* - */
        ["Funcionário_ID"],
        [INT],
        [“Funcionário_ID” (Funcionário)],   
      )
    ) 
    
    Deu-se seguimento aos trabalhos com a conversão da entidade Terreno para uma tabela, à qual se associaram os atributos previamente definidos:

    #figure(
      caption: "Caracterização da tabela lógica do Terreno.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Referência (tabela)*]),
        table.cell(
          rowspan: 3,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Terreno
          ],
        ),
        /* - */
        ["Terreno_ID"],
        [INT],
        [-],
        /* - */
        ["Minério_previsto"],
        [INT],
        [-],   
        /* - */
        ["Minério_coletado"],
        [INT],
        [-],
      )
    ) 
    
    Na sequência da referência da tabela anterior, cria-se então a nova tabela Caso, que mais uma vez reflete os atributos definidos na modelação concetual:

    #figure(
      caption: "Caracterização da tabela lógica do Caso.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Referência (tabela)*]),
        table.cell(
          rowspan: 6,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Caso
          ],
        ),
        /* - */
        ["Caso_ID"],
        [INT],
        [-],
        /* - */
        ["Data_de_abertura"],
        [DATE],
        [-],   
        /* - */
        ["Estado"],
        [ENUM(“Aberto”, “Fechado”)],
        [-],
        /* - */
        ["Estimativa_de_roubo"],
        [INT],
        [-],
        /* - */
        ["Data_de_encerramento"],
        [DATE],
        [-],     
        /*-*/
        ["Terreno_ID"],
        [INT],
        ["Terreno_ID" (Terreno)],         
      )
    )
    
    Ao analisar o diagrama concetual, repara-se no relacionamento N para M entre as entidades de Funcionário e Terreno, este que, no processo de conversão, culmina com o aparecimento de uma nova tabela que estabelece o relacionamento:

    #figure(
      caption: "Caracterização da tabela lógica de Trabalha.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Referência (tabela)*]),
        table.cell(
          rowspan: 2,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Trabalha
          ],
        ),
        /* - */
        ["Funcionário_ID"],
        [INT],
        [“Funcionário_ID” (Funcionário)],
        /* - */
        ["Terreno_ID"],
        [INT],
        [“Terreno_ID” (Terreno)],   
      )
    )    

    Finalmente, finda-se o processo de obtenção do modelo lógico com a transfiguração do relacionamento fulcral entre as entidades Funcionário e Caso que, ao representar um relacionamento N para M com atributos associados, concebe a última tabela, Suspeito.

    #figure(
      caption: "Caracterização da tabela lógica do Suspeito.",
      kind: table,
      table(
        columns: (0.3fr, 0.9fr, 0.6fr, 1.2fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tabela*], [*Nome da coluna*], [*Tipo de dado*], [*Referência (tabela)*]),
        table.cell(
          rowspan: 5,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Suspeito
          ],
        ),
        /* - */
        ["Funcionário_ID"],
        [INT],
        [“Funcianário_ID” (Funcionário)],
        /* - */
        ["Caso_ID"],
        [INT],
        [“Caso_ID” (Caso)],   
        /* - */
        ["Estado"],
        [ENUM(“Inocente”, “Em Investigação”, “Culpado”)],
        [-],
        /* - */
        ["Envolvimento"],
        [INT],
        [-],
        /* - */
        ["Notas"],
        [TEXT(256)],
        [-],      
      )
    )

    Na modelação lógica, os relacionamentos entre entidades desempenham um papel crucial na representação da interação entre diferentes elementos de um sistema de gestão de base de dados:

    #underline[*Relacionamento binário de grau 1:N com participação obrigatória do lado N:*] \

    São necessárias duas entidades lógicas, uma para cada entidade, e a chave primária da entidade do lado 1 tem de ser usada como atributo na entidade correspondente à entidade do lado N.
    
    Ocorrências:
    - “tem” entre Caso(N) e Terreno(1)
    - “desempenha” entre Funcionário(N) e Função(1)

    #underline[*Relacionamento binário de grau N:M:*] \

    São sempre necessárias três entidades lógicas neste tipo de relacionamentos, uma para cada entidade e uma para o relacionamento. As chaves primárias das entidades têm de ser atributos na entidade lógica do relacionamento.
    
    Ocorrências:
    - “trabalha” entre Funcionário e Terreno
    - “pertence” entre Funcionário e Caso

     #underline[*Relacionamento unário:*] \
     Na ocorrência “gere”, entre a entidade Funcionário e a própria, surge um relacionamento unário, do grau N:M, pois um ou mais funcionários podem gerir outros funcionários. Isto representa uma estrutura hierárquica onde um funcionário é responsável pela gestão de outros, dentro da organização.
     
     Com base nos parâmetros e nos relacionamentos estabelecidos anteriormente, foi desenvolvido um modelo lógico para representar de forma precisa e organizada as interações entre as entidades envolvidas. Este modelo visa proporcionar uma estrutura robusta para armazenar e gerir informações relacionadas aos diversos elementos do sistema de gestão de base de dados.

     #figure(
       caption: "Ilustração do modelo lógico produzido.",
       kind: image,
       image("../../images/Captura_ModeloLógico.png")
      )
  ]
}
