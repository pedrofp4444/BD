#let caracterização = {
  [
    ==  Identificação e Caracterização dos Atributos das Entidades e dos Relacionamentos

    Nesta etapa, a caracterização dos atributos das entidades e, possivelmente, dos relacionamentos passa a ser o alvo principal.

    #figure(
      caption: "Caracterização dos atributos da entidade Funcionário.",
      kind: table,
      table(
        columns: (0.6fr, 0.9fr, 1.5fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Entidade*], [*Atributo*], [*Descrição*], [*Nulo*], [*Composto*], [*Multivalorado*], [*Derivado*],[*Chave Primária*]),
        table.cell(
          rowspan: 7,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Funcionário
          ],
        ),
        /* Atributo */
        [ID],
        [Identificador único do funcionário],
        [Não],
        [Não],
        [Não],
        [Não],
        [Sim],
        /* Atributo */
        [Nome],
        [Nome do funcionário],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],        
        /* Atributo */
        [Data de nascimento],
        [Data de nascimento do funcionário],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],        
        /* Atributo */ 
        [Salário],
        [Salário do funcionário atribuído pela Lusium],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],        
        /* Atributo */ 
        [NIF],
        [Número de identificação fiscal do funcionário],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],        
        /* Atributo */ 
        [Fotografia],
        [Fotografia identificadora do funcionário],
        [Sim],
        [Não],
        [Não],
        [Não],
        [Não],        
        /* Atributo */ 
        [Número de telemóvel],
        [Número de telemóvel do funcionário],
        [Não],
        [Não],
        [Sim],
        [Não],
        [Não],
      )
    ) 

    #underline[*Entidade Funcionário*]\
    Nenhum dos atributos da entidade Funcionário (*ID* - chave primária, *Nome*, *Data de nascimento*, *Salário*, *NIF*,* Fotografia* e* Número de Telemóvel*) é *composto* ou *derivado*. Apenas o atributo *Fotografia* pode ser *nulo*, uma vez que um funcionário pode escolher ter ou não uma fotografia associada, sendo todos os outros atributos *não nulos*. Por fim, apenas o atributo *Número de telemóvel* é *multivalorado*, visto que um funcionário pode ter vários números de telemóvel.

#linebreak()

    #figure(
      caption: "Caracterização dos atributos da entidade Função.",
      kind: table,
      table(
        columns: (0.6fr, 0.9fr, 1.5fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Entidade*], [*Atributo*], [*Descrição*], [*Nulo*], [*Composto*], [*Multivalorado*], [*Derivado*],[*Chave Primária*]),
        table.cell(
          rowspan: 2,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Função
          ],
        ),
        /* Atributo */
        [ID],
        [Identificador único do função],
        [Não],
        [Não],
        [Não],
        [Não],
        [Sim],
        /* Atributo */
        [Designação],
        [Designação da função],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],        
      )
    ) 

  #underline[*Entidade Função*]\
  Nenhum dos atributos da entidade Função (*ID* - chave primária e *designação*) é *composto*, *derivado*, *nulo* ou *multivalorado*.

#linebreak()

    #figure(
      caption: "Caracterização dos atributos da entidade Terreno.",
      kind: table,
      table(
        columns: (0.6fr, 0.9fr, 1.5fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Entidade*], [*Atributo*], [*Descrição*], [*Nulo*], [*Composto*], [*Multivalorado*], [*Derivado*],[*Chave Primária*]),
        table.cell(
          rowspan: 3,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Terreno
          ],
        ),
        /* Atributo */
        [ID],
        [Identificador único do terreno],
        [Não],
        [Não],
        [Não],
        [Não],
        [Sim],
        /* Atributo */
        [Minério previsto],
        [Quantidade mínima estimada de minério a coletar por dia],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],   
        /* Atributo */
        [Minério coletado],
        [Quantidade de minério efetivamente coletado por dia],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],
      )
    ) 

  #underline[*Entidade Terreno*]\
  Nenhum dos atributos da entidade Terreno (*ID* - chave primária, *Minério previsto* e *Minério coletado*) é *composto*, *derivado*, *nulo* ou *multivalorado*.

#linebreak()

    #figure(
      caption: "Caracterização dos atributos da entidade Caso.",
      kind: table,
      table(
        columns: (0.6fr, 0.9fr, 1.5fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Entidade*], [*Atributo*], [*Descrição*], [*Nulo*], [*Composto*], [*Multivalorado*], [*Derivado*],[*Chave Primária*]),
        table.cell(
          rowspan: 5,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Caso
          ],
        ),
        /* Atributo */
        [ID],
        [Identificador único do caso],
        [Não],
        [Não],
        [Não],
        [Não],
        [Sim],
        /* Atributo */
        [Data de abertura],
        [Data de abertura do caso],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],   
        /* Atributo */
        [Estado],
        [Estado atual do caso],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],
        /* Atributo */
        [Estimativa de roubo],
        [Quantidade estimada de minério roubado],
        [Não],
        [Não],
        [Não],
        [Sim],
        [Não],
        /* Atributo */
        [Data de encerramento],
        [Data de encerramento do caso],
        [Sim],
        [Não],
        [Não],
        [Não],
        [Não],  
      )
    ) 


  #underline[*Entidade Caso*]\
  Nenhum dos atributos da entidade Caso (ID - chave primária, *Data de abertura*, *Estado*, *Estimativa de roubo* e *Data de encerramento*) é composto ou *multivalorado*. Apenas o atributo *Estimativa de roubo* pode ser *derivado*, uma vez que provém da diferença entre os valores dos atributos *Minério previsto* e *Minério coletado* associados à entidade *Terreno*. Por fim, apenas o atributo *Data de encerramento* pode ser *nulo*, pois um caso só apresenta uma data de encerramento a partir do momento em que o seu estado passa para “fechado”.

#linebreak()

    #figure(
      caption: "Caracterização dos atributos do relacionamento Funcionário - Caso.",
      kind: table,
      table(
        columns: (0.6fr, 0.9fr, 1.5fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr), 
        stroke: (thickness: 0.5pt),
        align: horizon,
        fill: (x, y) => if y == 0 { gray.lighten(50%) },
        table.header([*Relacionamento*], [*Atributo*], [*Descrição*], [*Nulo*], [*Composto*], [*Multivalorado*], [*Derivado*],[*Chave Primária*]),
        table.cell(
          rowspan: 3,
          align: horizon,
          rotate(-90deg, reflow: true)[
          Funcionário - Caso
          ],
        ),
        /* Atributo */
        [Estado],
        [Estado atual do suspeito no caso],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],
        /* Atributo */
        [Envolvimento],
        [Grau de envolvência do suspeito no caso],
        [Não],
        [Não],
        [Não],
        [Não],
        [Não],   
        /* Atributo */
        [Notas],
        [Observações importantes sobre o suspeito],
        [Sim],
        [Não],
        [Não],
        [Não],
        [Não],
      )
    ) 

#underline[*Relacionamento Funcionário - Caso*]\
Nenhum dos atributos do relacionamento Funcionário - Caso (*Estado*, *Envolvimento* e *Notas*) é *composto*, *derivado* ou *multivalorado*. Apenas o atributo *Notas* pode ser *nulo*, uma vez que podem não existir notas associadas ao relacionamento.
  ]
}