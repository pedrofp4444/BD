#let entidades = {
  [
    == Identificação e Caracterização das Entidades

    Tendo em conta os requisitos recolhidos, foi possível identificar as entidades *Funcionário*, *Função*, *Terreno* e *Caso*.

    #figure(
      caption: "Caracterização das entidades.",
      kind: table,
      table(
        columns: (0.8fr, 1.5fr, 0.8fr, 1fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Designação*], [*Descrição*], [*Sinónimos*], [*Ocorrências*]),
        /* Entidade */ [Funcionário],
        [Entidade que representa os diferentes trabalhadores da Lusium.],
        [Trabalhador],
        [Um funcionário desempenha 1 função, gere 1 ou mais funcionários e trabalha em 1 ou mais terrenos.],
        /* Entidade */ [Função],
        [Entidade que define a função que os trabalhadores da Lusium desempenham.],
        [Cargo],
        [Um função é desempenhada por 1 ou mais funcionários.],
        /* Entidade */ [Terreno],
        [Entidade que representa o local de onde são extraídos os minérios nunium e edium.],
        [Campo],
        [Um terreno contém 1 ou mais casos e trabalham neste 1 ou mais funcionários.],
        /* Entidade */ [Caso],
        [Entidade que representa um possível furto de minérios, num dado terreno de extração,em investigação.],
        [Furto/Roubo],
        [Um caso está associado a 1 terreno e contém 1 ou mais funcionários.],
      )
    )

    Definidas as entidades, é importante passar à enumeração e descrição dos atributos únicos que caracterizam cada uma delas, tendo sempre por base os respetivos requisitos.

    #underline[*Funcionário*] \
    Com base nos requisitos 1 e 2 (#link(<Tabela1>, "Tabela 1")), um funcionário é identificado pelo seu *ID* e caracterizado com base no seu *nome*, *data de nascimento*, *salário*, *número de identificação fiscal*, *fotografia* (não obrigatória) e *números de telemóvel*, podendo também apresentar apenas um.

    #underline[*Função*] \
    Segundo o requisito 3 (#link(<Tabela1>, "Tabela 1")), uma função é identificada pelo seu *ID* e caracterizada por uma designação que pode tomar os valores de *Operacional*, *Detetive* ou *Representante*.

    #underline[*Terreno*] \
    Partindo dos requisitos  6, 7 e 8 (#link(<Tabela1>, "Tabela 1")), um terreno é identificado pelo seu *ID* e caracterizado pelo *minério previsto*, que corresponde à quantidade mínima estimada de minério a coletar por dia, e pelo *minério coletado*, que corresponde à quantidade de minério efetivamente coletado por dia.

    #underline[*Caso*] \
    Tendo por base os requisitos 10, 11, 13 e 14 (#link(<Tabela1>, "Tabela 1")), um caso é identificado pelo seu *ID* e definido pelo seu *estado* (aberto ou fechado), *data de abertura* do caso, *data de encerramento* do caso, se porventura estiver fechado, e *estimativa de roubo*, que corresponde à quantidade estimada de minério roubado. Um caso é aberto quando a quantidade de minério mínimo previsto num terreno, num dado dia, é superior à quantidade de minério coletado, cuja diferença origina o valor da estimativa de roubo.
  ]
}