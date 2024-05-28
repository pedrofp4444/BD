#let explicação = {
  [
    == Apresentação e explicação da base de dados implementada

    De forma a iniciar o desenvolvimento do sistema de gestão de base de dados, decidimos criar a implementação mySQL de cada tabela apresentada anteriormente no modelo lógico.

    Dá-se início ao processo com duas instruções SQL essenciais: a primeira é responsável pela criação da base de dados com o nome atribuído _Lusium_, a segunda indica ao sistema qual a base de dados que deve ser utilizada para as operações executadas.

    #align(center)[
      #figure(
        kind: image,
        caption: [Instruções SQL para criar e utilizar a base de dados.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
            CREATE DATABASE IF NOT EXISTS Lusium;

            USE Lusium;
          ```
        )
      )
    ]

    \
    A primeira tabela a ser implementada no modelo físico é a Função, esta que, ao seguir a estrutura habitual de SQL, é inaugurada com duas colunas. Possui o identificador único "Função_ID", que é definido pelos parâmetros "INT", que define o tipo de dados, "PRIMARY KEY" que garante a atomicidade e capacidade identificativa, "AUTO_INCREMENT" para que o sistema atribua automaticamente um identificador sequencial e "NOT NULL", para assegurar que o valor existe. Representa-se também a "Designação", do tipo "ENUM()", para restringir os valores possíveis na coluna Operacional, Detetive ou Representante, apoiada pelo "NOT NULL", de forma a certificar uma atribuição de valor.

    #grid(
      align: horizon,
      columns: 2,
      column-gutter: 0pt,
      figure(
        caption: [Tabela lógica da Função.],
        image("../../images/FunçãoTabela.png", width:50%)
      ),
      figure(
        kind: image,
        caption: [Implementação correspondente à Função.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Criação da tabela Função
          CREATE TABLE Função (
            Função_ID INT AUTO_INCREMENT NOT NULL,
            Designação ENUM(         'Operacional', 'Detetive', 'Representante') NOT NULL,
            PRIMARY KEY (Função_ID)
          );
          ```
        )
      )
    )

    \
    A tabela Funcionário armazena dados essenciais dos colaboradores. A coluna “Funcionário_ID” é um “INT” que serve como “PRIMARY KEY” e é “NOT NULL”, garantindo que cada funcionário tenha um identificador único. “Nome” é um “VARCHAR(75)” e também “NOT NULL”, permitindo nomes com até 75 caracteres. “Data_de_nascimento” é um campo “DATE” e “NOT NULL”, registrando a data de nascimento de cada funcionário. “Salário” é um “INT” e “NOT NULL”, refletindo o salário do funcionário. “NIF” é um “VARCHAR(10)” e “NOT NULL”, contendo o número fiscal do funcionário. “Fotografia” é um “VARCHAR(150)” e pode ser “NULL”, indicando que a fotografia é opcional. “Função_ID” é um “INT” e “NOT NULL”, atuando como uma chave estrangeira que referencia a tabela Função.
    
    #grid(
      align: horizon,
      columns: 2,
      column-gutter: 0pt,
      figure(
        caption: [Tabela lógica do Funcionário.],
        image("../../images/FuncionárioTabela.png", width:50%)
      ),
      figure(
        kind: image,
        caption: [Implementação correspondente ao Funcionário.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Criação da tabela Funcionário
          CREATE TABLE Funcionário (
              Funcionário_ID INT AUTO_INCREMENT NOT NULL,
              Nome VARCHAR(75) NOT NULL,
              Data_de_nascimento DATE NOT NULL,
              Salário INT NOT NULL,
              NIF VARCHAR(10) NOT NULL,
              Fotografia VARCHAR(150) NULL,
              Função_ID INT NOT NULL,
              PRIMARY KEY (Funcionário_ID),
              FOREIGN KEY (Função_ID) REFERENCES Função(Função_ID)
          );
          ```
        )
      )
    )  

    \
    A tabela Número de telemóvel é dedicada aos contactos telefónicos dos funcionários. “Número_de_telemóvel_ID” é um “INT”, definido como “PRIMARY KEY” e “NOT NULL”, assegurando a unicidade de cada número. “Funcionário_ID” é um “INT” e “NOT NULL”, estabelecendo uma chave estrangeira que liga o número de telemóvel ao seu respectivo funcionário na tabela Funcionário.
    
    #grid(
      align: horizon,
      columns: 2,
      column-gutter: 0pt,
      figure(
        caption: [Tabela lógica do Número de Telemóvel.],
        image("../../images/NumTelemóvelTabela.png", width:50%)
      ),
      figure(
        kind: image,
        caption: [Implementação correspondente ao Número de Telemóvel.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Criação da tabela Número de telemóvel
          CREATE TABLE Número_de_telemóvel (
              Número_de_telemóvel_ID INT NOT NULL,
              Funcionário_ID INT NOT NULL,
              PRIMARY KEY (Número_de_telemóvel_ID),
              FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID)
          );
          ```
        )
      )
    )  

    \
    A tabela Gere representa a hierarquia de gestão. “Funcionário_Gestor_ID” e “Funcionário_ID” são ambos “INT” e “NOT NULL”, formando uma “PRIMARY KEY” composta que identifica cada relação de gestão. Ambos são também chaves estrangeiras que apontam para “Funcionário_ID” na tabela Funcionário, delineando quem gere quem.
    
    #grid(
      align: horizon,
      columns: 2,
      column-gutter: 0pt,
      figure(
        caption: [Tabela lógica do Gere.],
        image("../../images/GereTabela.png", width:50%)
      ),
      figure(
        kind: image,
        caption: [Implementação correspondente ao Gere.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Criação da tabela Gere
          CREATE TABLE Gere (
              Funcionário_Gestor_ID INT NOT NULL,
              Funcionário_ID INT NOT NULL,
              PRIMARY KEY (Funcionário_Gestor_ID, Funcionário_ID),
              FOREIGN KEY (Funcionário_Gestor_ID) REFERENCES Funcionário(Funcionário_ID),
              FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID)
          );
          ```
        )
      )
    )  

    \
    A tabela Terreno regista os terrenos de mineração. “Terreno_ID” é um “INT”, marcado como “PRIMARY KEY”, "AUTO_INCREMENT" para que o sistema atribua automaticamente um identificador sequencial e “NOT NULL”, identificando cada terreno de forma única. “Minério_previsto” e “Minério_coletado” são ambos “INT” e “NOT NULL”, quantificando o minério esperado e extraído, respectivamente.

    #grid(
      align: horizon,
      columns: 2,
      column-gutter: 0pt,
      figure(
        caption: [Tabela lógica do Terreno.],
        image("../../images/TerrenoTabela.png", width:50%)
      ),
      figure(
        kind: image,
        caption: [Implementação correspondente ao Terreno.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Criação da tabela Terreno
          CREATE TABLE Terreno (
              Terreno_ID INT AUTO_INCREMENT NOT NULL,
              Minério_previsto INT NOT NULL,
              Minério_coletado INT NOT NULL,
              PRIMARY KEY (Terreno_ID)
          );
          ```
        )
      )
    )  

    \
    A tabela Trabalha associa funcionários aos terrenos onde operam. “Funcionário_ID” e “Terreno_ID” são “INT” e “NOT NULL”, constituindo uma “PRIMARY KEY” composta que garante a singularidade da relação. Estas colunas são chaves estrangeiras que referenciam as tabelas “Funcionário” e “Terreno”, respectivamente.
    
    #grid(
      align: horizon,
      columns: 2,
      column-gutter: 0pt,
      figure(
        caption: [Tabela lógica do Trabalha.],
        image("../../images/TrabalhaTabela.png", width:50%)
      ),
      figure(
        kind: image,
        caption: [Implementação correspondente ao Trabalha.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Criação da tabela Trabalha
          CREATE TABLE Trabalha (
              Funcionário_ID INT NOT NULL,
              Terreno_ID INT NOT NULL,
              PRIMARY KEY (Funcionário_ID, Terreno_ID),
              FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID),
              FOREIGN KEY (Terreno_ID) REFERENCES Terreno(Terreno_ID)
          );
          ```
        )
      )
    )  

    \
    A tabela Caso é usada para o acompanhamento de investigações. “Caso_ID” é um “INT”, servindo como “PRIMARY KEY”, "AUTO_INCREMENT" para que o sistema atribua automaticamente um identificador sequencial e “NOT NULL”. “Data_de_abertura” é um campo “DATE” e “NOT NULL”, marcando o início do caso. “Estado” é um “ENUM(‘Aberto’, ‘Fechado’)” e “NOT NULL”, indicando o estado atual do caso. “Estimativa_de_roubo” é um “INT” e “NOT NULL”, estimando o valor subtraído. “Data_de_encerramento” pode ser um campo “DATE” e “NULL”, representando a data de conclusão do caso. “Terreno_ID” é um “INT” e “NOT NULL”, funcionando como uma chave estrangeira que liga o caso ao terreno relevante.
    
    #grid(
      align: horizon,
      columns: 2,
      column-gutter: 0pt,
      figure(
        caption: [Tabela lógica do Caso.],
        image("../../images/CasoTabela.png", width:50%)
      ),
      figure(
        kind: image,
        caption: [Implementação correspondente ao Caso.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Criação da tabela Caso
          CREATE TABLE Caso (
              Caso_ID INT AUTO_INCREMENT NOT NULL,
              Data_de_abertura DATE NOT NULL,
              Estado ENUM('Aberto', 'Fechado') NOT NULL,
              Estimativa_de_roubo INT NOT NULL,
              Data_de_encerramento DATE NULL,
              Terreno_ID INT NOT NULL,
              PRIMARY KEY (Caso_ID),
              FOREIGN KEY (Terreno_ID) REFERENCES Terreno(Terreno_ID)
          );
          ```
        )
      )
    )  

    \
    A tabela Suspeito mantém o registo dos suspeitos nos casos. “Funcionário_ID” e “Caso_ID” são “INT” e “NOT NULL”, formando uma “PRIMARY KEY” composta. “Estado” é um “ENUM(‘Inocente’, ‘Em investigação’, ‘Culpado’)” e “NOT NULL”, refletindo a condição do suspeito. “Envolvimento” é um “INT” e “NOT NULL”, medindo o grau de envolvimento do suspeito no caso. “Notas” é um campo “TEXT” e pode ser “NULL”, permitindo anotações adicionais sobre o suspeito.
    
    #grid(
      align: horizon,
      columns: 2,
      column-gutter: 0pt,
      figure(
        caption: [Tabela lógica do Suspeito.],
        image("../../images/SuspeitoTabela.png", width:50%)
      ),
      figure(
        kind: image,
        caption: [Implementação correspondente ao Suspeito.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Criação da tabela Suspeito
          CREATE TABLE Suspeito (
              Funcionário_ID INT NOT NULL,
              Caso_ID INT NOT NULL,
              Estado ENUM('Inocente', 'Em investigação', 'Culpado') NOT NULL,
              Envolvimento INT NOT NULL,
              Notas TEXT NULL,
              PRIMARY KEY (Funcionário_ID, Caso_ID),
              FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID),
              FOREIGN KEY (Caso_ID) REFERENCES Caso(Caso_ID)
          );
          ```
        )
      )
    )  
  ]
}
