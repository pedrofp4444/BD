#let organizacao = {
  [
    == Organização dos Requisitos Levantados

    Após a definição do método de levantamento e análise de requisitos, e consequente aplicação do mesmo, procede-se à disposição tabelada e organizada de acordo com a informação explícita nos anexos ao presente relatório.

    === Requisitos de descrição
    
    #figure(
      kind: "null",
      supplement: [Null],
      block(
        table(
          columns: (21pt, 15pt, 55pt, 215pt, 1.2fr, 1.2fr), 
          stroke: (thickness: 0.5pt),
          align: horizon,
          fill: (x, y) => if y == 0 { gray.lighten(50%) },
          table.header([*Tipo*], [*Nº*], [*Data*], [*Descrição do requisito*], [*Fonte*],[*Analista*]),
          table.cell(
            rowspan: 14,
            align: horizon,
            rotate(-90deg, reflow: true)[
            Descrição
            ],
          ),
          /* Requisito */ [1],
          [04/03/2024], 
          [Um funcionário é identificado pelo seu identificador único e sequencial, nome, data de nascimento, salário, número de identificação fiscal, fotografia, se aplicável, e números de telemóvel.], 
          [Representantes Maria Eduarda e João Guilherme], 
          [Eduardo Faria e Nuno Silva],
          /* Requisito */ [2], 
          [04/03/2024], 
          [Um funcionário tem 1 ou mais números de telemóvel.], 
          [Representante Maria Eduarda], 
          [Eduardo Faria e Nuno Silva],
          /* Requisito */ [3], 
          [04/03/2024], 
          [Uma função é identificada pelo seu identificador único e designação, que pode tomar os valores de Operacional, Detetive e Representante.],
          [Representante Ana Sofia], 
          [Eduardo Faria e Nuno Silva],
          /* Requisito */ [4], 
          [04/03/2024], 
          [Um funcionário desempenha uma única função e uma função é desempenhada por 1 ou mais funcionários.], 
          [Representante Ana Sofia], 
          [Eduardo Faria e Nuno Silva],
          /* Requisito */ [5],
          [04/03/2024],
          [Um funcionário Operacional trabalha em 1 ou mais terrenos e num terreno trabalham 1 ou mais funcionários.],
          [Representante Ana Sofia],
          [Eduardo Faria e Nuno Silva],
          /* Requisito */ [6],
          [04/03/2024],
          [Um terreno é identificado pelo seu identificador único e sequencial, minério previsto e minério coletado.],
          [Representantes da Lusium],
          [Eduardo Faria e Nuno Silva],
          /* Requisito */ [7],
          [04/03/2024],
          [O minério previsto corresponde à quantidade mínima estimada de minério a coletar por dia.],
          [Representantes da Lusium],
          [Eduardo Faria e Nuno Silva],
          /* Requisito */ [8],
          [04/03/2024],
          [O minério coletado corresponde à quantidade de minério efetivamente coletado por dia.],
          [Representantes da Lusium],
          [Eduardo Faria e Nuno Silva],
          /* Requisito */ [9],
          [04/03/2024],
          [Um funcionário que desempenha a função de Representante gere os funcionários que desempenham a função de Operacional.],
          [Representantes da Lusium],
          [Eduardo Faria e Nuno Silva],
          /* Requisito */ [10],
          [08/03/2024],
          [Um caso é identificado pelo seu identificador único e sequencial, data de abertura, data de encerramento, se aplicável, estado e estimativa de roubo.],
          [Detetive Filipe Sousa],
          [Hélder Gomes e Pedro Pereira],
          /* Requisito */ [11],
          [08/03/2024],
          [A estimativa de roubo de um caso corresponde à diferença entre a quantidade de minério prevista a ser coletada e a quantidade de minério efetivamente obtida.],
          [Detetive Filipe Sousa],
          [Hélder Gomes e Pedro Pereira],
          /* Requisito */ [12],
          [08/03/2024],
          [Um terreno pode ter casos e cada caso está associado a um só terreno.],
          [Detetive Lara Machado],
          [Hélder Gomes e Pedro Pereira],
          /* Requisito */ [13],
          [08/03/2024],
          [O estado de um caso pode ser aberto ou fechado.],
          [Detetive Américo Costa],
          [Hélder Gomes e Pedro Pereira],
          /* Requisito */ [14],
          [08/03/2024],
          [Caso a quantidade de minério coletada de um determinado dia seja inferior à quantidade de minério mínima prevista, um novo caso é aberto no terreno e todos os funcionários associados tornam-se suspeitos.],
          [Representante Ana Sofia],
          [Hélder Gomes e Pedro Pereira],
        )
      )
    )

    #figure(
      caption: "Requisitos de descrição.",
      kind: table,
      block(
        table(
          columns: (21pt, 15pt, 55pt, 215pt, 1.2fr, 1.2fr),
          stroke: (thickness: 0.5pt),
          align: horizon,
          table.cell(
            rowspan: 5,
            align: horizon,
            rotate(-90deg, reflow: true)[
            Descrição
            ],
          ),
          /* Requisito */ [15],
          [08/03/2024],
          [Um funcionário pode ou não pertencer a um ou mais casos, enquanto que a um caso estão associados um ou mais funcionários, obrigatoriamente.],
          [Representante Ana Sofia],
          [Hélder Gomes e Pedro Pereira],
          /* Requisito */ [16],
          [08/03/2024],
          [Um funcionário associado a um caso é considerado suspeito.],
          [Representante Ana Sofia],
          [Hélder Gomes e Pedro Pereira],
          /* Requisito */ [17],
          [08/03/2024],
          [Um suspeito é caracterizado pelo seu estado, nível de envolvimento e notas, se aplicável.],
          [Detetive Sandra Silva],
          [Hélder Gomes e Pedro Pereira],
          /* Requisito */ [18],
          [08/03/2024],
          [O nível de envolvimento é caracterizado por um inteiro de 1 a 10, onde 1 corresponde a pouco envolvimento e 10 a extremamente envolvido.],
          [Detetive Sandra Silva],
          [Hélder Gomes e Pedro Pereira],
          /* Requisito */ [19], 
          [08/03/2024],
          [O estado de um suspeito pode admitir os valores de inocente, em investigação ou culpado.],
          [Detetive Sandra Silva],
          [Hélder Gomes e Pedro Pereira],
        )
      )
    )
    #label("Tabela1")

    === Requisitos de manipulação

    #figure(
      caption: "Requisitos de manipulação.",
      kind: table,
      table(
        columns: (21pt, 15pt, 55pt, 6fr, 71pt, 71pt), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tipo*], [*Nº*], [*Data*], [*Descrição do requisito*], [*Fonte*],[*Analista*]),
        table.cell(
          rowspan: 7,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Manipulação
          ],
        ),
        /* Requisito */ [1],
        [04/03/2024], 
        [Listar o prejuízo de um terreno.], 
        [Representantes da Lusium], 
        [Eduardo Faria e Nuno Silva],
        /* Requisito */ [2], 
        [08/03/2024], 
        [Ver quando é que um funcionário se tornou suspeito de um determinado caso.], 
        [Representantes da Lusium], 
        [Hélder Gomes e Pedro Pereira],
        /* Requisito */ [3], 
        [08/03/2024], 
        [Listar os suspeitos de um determinado caso.], 
        [Representantes da Lusium], 
        [Hélder Gomes e Pedro Pereira],
        /* Requisito */ [4],
        [08/03/2024],
        [Ver a data do último caso de um determinado funcionário.],
        [Representantes da Lusium],
        [Hélder Gomes e Pedro Pereira],
        /* Requisito */ [5],
        [08/03/2024],
        [Listar os casos a que um determinado funcionário está associado.],
        [Detetives],
        [Hélder Gomes e Pedro Pereira],
        /* Requisito */ [6],
        [08/03/2024],
        [Ver o dia em que mais casos foram abertos.],
        [Detetives],
        [Hélder Gomes e Pedro Pereira],
        /* Requisito */ [7],
        [08/03/2024],
        [Listar os top 5 funcionários por quantidade de casos.],
        [Detetive Américo Costa],
        [Hélder Gomes e Pedro Pereira],
      )
    )
    #label("Tabela2")

    === Requisitos de controlo

    #figure(
      caption: "Requisitos de controlo.",
      kind: table,
      table(
        columns: (21pt, 15pt, 55pt, 6fr, 71pt, 71pt), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Tipo*], [*Nº*], [*Data*], [*Descrição do requisito*], [*Fonte*],[*Analista*]),
        table.cell(
          rowspan: 5,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Controlo
          ],
        ),
        /* Requisito */ [1],
        [04/03/2024], 
        [Só um funcionário Representante deve conseguir criar um terreno e alterar os campos de minério previsto e minério coletado de um terreno.], 
        [Representantes da Lusium], 
        [Eduardo Faria e Nuno Silva],
        /* Requisito */ [2], 
        [04/03/2024], 
        [Só um funcionário Representante deve conseguir criar um funcionário e alterar os campos nome, data de nascimento, função, salário, número de identificação fiscal, fotografia e telemóvel de um funcionário.], 
        [Representantes da Lusium], 
        [Eduardo Faria e Nuno Silva],
        /* Requisito */ [3], 
        [04/03/2024], 
        [Funcionários Operacionais não têm acesso a qualquer informação da base de dados.], 
        [Representante João Guilherme], 
        [Eduardo Faria e Nuno Silva],
        /* Requisito */ [4],
        [08/03/2024],
        [Só um funcionário Detetive deve conseguir criar um caso e alterar o seu estado e estimativa de roubo.],
        [Detetives],
        [Hélder Gomes e Pedro Pereira],
        /* Requisito */ [5],
        [08/03/2024],
        [Só um funcionário Detetive deve conseguir tornar um funcionário suspeito num caso e mudar o estado de um suspeito.],
        [Detetives],
        [Hélder Gomes e Pedro Pereira],
      )
    )
  ]
}
