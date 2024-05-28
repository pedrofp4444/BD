#let relacionamentos = {
  [
    == Identificação e Caracterização dos Relacionamentos

    Na modelação concetual surgirão vários relacionamentos entre entidades responsáveis por representar as diferentes interações entre os elementos definidos na base de dados.

    #figure(
      caption: "Caracterização dos relacionamentos.",
      kind: table,
      table(
        columns: 5 * (1fr, ), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Entidade*], [*Multiplicidade*], [*Relacionamento*], [*Multiplicidade*], [*Entidade (relacionada)*]),
        /* Relacionamento */ [Funcionário],
        [N (obrigatório)],
        [gere],
        [M (obrigatório)],
        [Funcionário],
        /* Relacionamento */ [Funcionário],
        [N (obrigatório)],
        [desempenha],
        [1 (obrigatório)],
        [Função],
        /* Relacionamento */ [Funcionário],
        [N (obrigatório)],
        [trabalha],
        [M (obrigatório)],
        [Terreno],
        /* Relacionamento */ [Funcionário],
        [N (parcial)],
        [pertence],
        [M (obrigatório)],
        [Caso],
        /* Relacionamento */ [Terreno],
        [1 (parcial)],
        [tem],
        [N (obrigatório)],
        [Caso],
      )
    ) 

    #underline[*Relacionamento Funcionário - Funcionário*] (Requisito 9,  #link(<Tabela1>, "Tabela 1"))
    #align(center)[
      #figure(
        kind: image,
        caption: "Ilustração do Relacionamento Funcionário - Funcionário.",
        image("../../images/[3] - 1.png", width: 60%)
      )
    ]

    *Relacionamento*: Funcionário gere Funcionário.

    *Descrição*: No que toca aos funcionários da Lusium, existem, entre eles, funcionários qualificados para gerir certos grupos de trabalhadores.

    *Cardinalidade*: Funcionário (1,n) - Funcionário (1,n). Um funcionário qualificado gere, obrigatoriamente, um ou mais funcionários. Por outro lado, um funcionário é, obrigatoriamente, gerido por um ou mais funcionários qualificados.

    *Atributos*: Este relacionamento não apresenta atributos. 

    #linebreak()

    #underline[*Relacionamento Funcionário - Função*] (Requisito 4,  #link(<Tabela1>, "Tabela 1"))
    #align(center)[
      #figure(
        kind: image,
        caption: "Ilustração do Relacionamento Funcionário - Função.",
        image("../../images/[3] - 2.png", width: 25%)
      )
    ]

    *Relacionamento*: Funcionário desempenha Função.

    *Descrição*: Os funcionários da Lusium distinguem-se com base na função que desempenham.

    *Cardinalidade*: Funcionário (1,n) - Função (1,1). Um funcionário desempenha, obrigatoriamente, uma única função. Por outro lado, uma função é, obrigatoriamente, desempenhada por um ou vários funcionários.

    *Atributos*: Este relacionamento não apresenta atributos, até porque a sua cardinalidade não é N:M.

    #linebreak()

    #underline[*Relacionamento Funcionário - Terreno*] (Requisito 5, #link(<Tabela1>, "Tabela 1"))
    #align(center)[
      #figure(
        kind: image,
        caption: "Ilustração do Relacionamento Funcionário - Terreno.",
        image("../../images/[3] - 3.png", width: 80%)
      )
    ]

    *Relacionamento*: Funcionário trabalha em Terreno.

    *Descrição*: Os funcionários operacionais da Lusium trabalham em terrenos monitorizados pela empresa.

    *Cardinalidade*: Funcionário (1,n) - Terreno (1,n). Um funcionário trabalha, obrigatoriamente, em um ou mais terrenos. Por outro lado, num terreno trabalham, obrigatoriamente, um ou mais funcionários.

    *Atributos*: Este relacionamento não apresenta atributos.

    #linebreak()
    
   #underline[*Relacionamento Funcionário - Caso*] (Requisito 15,  #link(<Tabela1>, "Tabela 1"))
   #align(center)[
      #figure(
        kind: image,
        caption: "Ilustração do Relacionamento Funcionário - Caso.",
        image("../../images/[3] - 4.png", width: 90%)
      )
    ]

    *Relacionamento*: Funcionário pertence a Caso.

    *Descrição*: Os funcionários da Lusium podem estar associados a um caso de furto relacionado com um determinado terreno.

    *Cardinalidade*: Funcionário (0,n) - Caso (1,n). Um funcionário pode ou não pertencer a um ou mais casos. Por outro lado, a um caso pertencem, obrigatoriamente, um ou mais funcionários.

    *Atributos*: Este relacionamento contém os atributos *estado*, *envolvimento* e *notas*. Deste modo, estas características podem ser atribuídas a um determinado suspeito, isto é, um funcionário associado a um caso. Desta forma, *estado* faz referência ao estado atual do suspeito (inocente, em investigação ou culpado), *envolvimento* traduz-se num nível de 1 a 10, capaz de indicar o grau de envolvência do suspeito no caso e *notas* consistem em comentários adicionais não obrigatórios sobre o suspeito.

    #linebreak()

    #underline[*Relacionamento Terreno - Caso*] (Requisito 12,  #link(<Tabela1>, "Tabela 1"))
    #align(center)[
      #figure(
        kind: image,
        caption: "Ilustração do Relacionamento Terreno - Caso.",
        image("../../images/[3] - 5.png", width: 80%)
      )
    ]

    *Relacionamento*: Terreno tem Caso.

    *Descrição*: Os terrenos da Lusium podem ter casos de furto de minérios associados.

    *Cardinalidade*: Terreno (0,1) - Caso (1,n). Um terreno pode ou não ter um ou mais casos associados a si mesmo. Por outro lado, um caso está, obrigatoriamente, associado a um único terreno.

    *Atributos*: Este relacionamento não apresenta atributos.
  ]
}
