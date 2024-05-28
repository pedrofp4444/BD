#let indexação = {
  [
    == Indexação do Sistema de Dados

    Nesta secção aborda-se a necessidade de aplicar uma metodologia de indexação à base de dados, com o objetivo de otimizar a eficiência das operações de pesquisa e manipulação de dados. O primeiro passo é a avaliação e previsão dos pontos de incidência resultantes da utilização da base de dados.

    O processo de avaliação inicia-se com a identificação das tabelas e colunas que necessitarão de um índice. Após estudo detalhado da situação, concluiu-se que dado que os utilizadores principais da base de dados serão os detetives, prevê-se que as tabelas Caso e Suspeito sejam frequentemente acedidas, tornando assim os seus identificadores (chaves primárias e estrangeiras) pontos críticos de acesso.

    Recorre-se à utilização de indexação por três motivos principais:

    + *Melhoria do desempenho das operações de consulta:* A indexação permite um acesso mais rápido aos registos, uma vez que os índices facilitam a localização eficiente dos dados. Isto é particularmente útil para operações de leitura, que são frequentes e exigem tempos de resposta rápidos.

    + *Redução da necessidade de leitura de dados repetitivos:* Com a utilização de índices, o sistema pode aceder diretamente aos elementos específicos de uma tabela sem necessidade de percorrer todos os registos. Isto reduz a carga de trabalho no sistema de armazenamento e melhora a eficiência geral.

    + *Facilitação da escalabilidade do sistema:* À medida que o número de registos aumenta, os índices são projetados para lidar com pesquisas simultâneas de forma eficiente, sem degradar o desempenho geral do sistema de gestão de base de dados. Isto é essencial para manter a performance do sistema em ambientes de alto tráfego e grande volume de dados.

    Na situação da _Lusium_, após identificar os pontos de maior incidência, prossegue-se a criação dos índices nas chaves estrangeiras das duas tabelas com maior frequência. Note-se que não há necessidade de criar índices para chaves primárias, uma vez que naturalmente já são constituídas num índice no momento da sua criação.

    #align(center)[
      #figure(
        kind: image,
        caption: [Aplicação de indexação na base de dados.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Criação de um índice para a coluna Terreno_ID na tabela Caso
          CREATE INDEX index_caso_terreno_id ON Caso(Terreno_ID);
          
          -- Criação de um índice para a coluna Caso_ID na tabela Suspeito
          CREATE INDEX idx_suspeito_caso_id ON Suspeito(Caso_ID);
          
          -- Criação de um índice para a coluna Funcionário_ID na tabela Suspeito
          CREATE INDEX idx_suspeito_funcionario_id ON Suspeito(Funcionário_ID);
          ```
        )
      )
    ]

  ]
}
