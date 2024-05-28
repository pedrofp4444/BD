#let diagrama = {
  [
    == Apresentação e Explicação do Diagrama ER Produzido

    Após a identificação e caracterização detalhada de cada entidade, atributo e relacionamento nos tópicos anteriores, prosseguimos agora para a apresentação de todo o diagrama ER que suporta o modelo da base de dados em questão.

    #align(center)[
      #figure(
        kind: image,
        caption: "Ilustração do diagrama ER produzido.",
        image("../../images/Captura_DiagramaER.png", width: 100%)
      )
    ]

    Neste diagrama, é possível identificar de forma clara todas as entidades da base de dados, bem como os relacionamentos responsáveis por interligar as mesmas. Deste modo, o diagrama é interpretado da seguinte forma: um funcionário desempenha obrigatoriamente uma função; um funcionário qualificado gere outros funcionários; os funcionários operacionais trabalham em diversos terrenos; a um terreno podem estar associados vários casos; num caso podem estar contidos vários funcionários.
    
    Por fim, podemos também identificar, em cada entidade e num dos relacionamentos, os atributos que os definem. Em todas as entidades destacam-se os atributos que constituem uma chave primária da mesma, visto serem representados por um círculo totalmente preenchido. Para além disso, no diagrama são também visíveis outros tipos de atributos, tais como multivalorados e opcionais.
    
    Assim, com a conclusão desta fase, é possível passar para a construção de um novo modelo capaz de especificar a caracterização de cada um dos elementos, sendo este o modelo de dados lógico.

  ]
}