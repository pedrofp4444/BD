#let povoamento = {
  [
    == Povoamento da base de dados 

    Para o povoamento da base de dados, implementámos duas abordagens distintas. A primeira abordagem utilizou um ficheiro SQL, onde, através de instruções INSERT, inserimos um número reduzido de entradas para facilitar a visualização e a execução de queries simples. Esta abordagem permite uma compreensão mais clara das operações básicas da base de dados.

    A segunda abordagem foi realizada utilizando Python, que permitiu a inserção de um volume maior de dados na base de dados. Utilizando a biblioteca _mysql.connector_, estabelecemos a conexão com o servidor MySQL e gerámos dados aleatórios para povoar a base de dados de forma programática. Esta técnica é particularmente útil para simular um ambiente mais próximo do real, possibilitando testes de desempenho e escalabilidade, bem como a validação de queries mais complexas e robustas.

    Inicia-se o processo pela introdução de dados na tabela "Função", que contém informações sobre as funções que os funcionários podem desempenhar na _Lusium_. Adicionam-se três funções: "Operacional", "Detetive" e "Representante". Cada função tem um ID único atribuído automaticamente e uma designação correspondente.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Função com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Inserção de dados na tabela Função
          INSERT INTO Função (Designação) VALUES
              ('Operacional'),
              ('Detetive'),
              ('Representante');
          ```
        )
      )
    ]

    \
    Em seguida, procedemos à inserção de dados na tabela "Funcionário", que armazena informações detalhadas sobre os funcionários, incluindo o seu ID, nome, data de nascimento, salário, NIF, fotografia e o ID da função desempenhada. Este passo é essencial para registar os dados pessoais e profissionais dos funcionários na base de dados.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Funcionário com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Inserção de dados na tabela Funcionário
          INSERT INTO Funcionário (Nome, Data_de_nascimento, Salário, NIF, Fotografia, Função_ID) VALUES
              ('Miguel Silva', '1985-03-15', 1200, '123456789', 'foto_miguel.jpg', 1),
              ('Ana Costa', '1990-07-21', 2800, '987654321', 'foto_ana.jpg', 2),
              ('Pedro Santos', '1982-12-10', 3000, '456789123', 'foto_pedro.jpg', 3),
              ('Sofia Pereira', '1988-05-02', 1000, '789123456', 'foto_sofia.jpg', 1),
              ('Rui Oliveira', '1995-09-18', 2600, '321654987', 'foto_rui.jpg', 2),
              ('Inês Rodrigues', '1980-11-30', 850, '654987321', 'foto_ines.jpg', 1),
              ('Tiago Fernandes', '1993-04-25', 2900, '987321654', 'foto_tiago.jpg', 3);
          ```
        )
      )
    ]

    \
    A tabela "Número_de_telemóvel" regista os números de telemóvel associados a cada funcionário, estabelecendo uma ligação direta entre o ID do número de telemóvel e o ID do funcionário correspondente.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Número_de_telemóvel com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Inserção de dados na tabela Número_de_telemóvel
          INSERT INTO Número_de_telemóvel (Número_de_telemóvel_ID, Funcionário_ID) VALUES
              (934678592, 1),
              (966492873, 2),
              (922245762, 3),
              (936457856, 4),
              (926486516, 5),
              (964884547, 6),
              (964554178, 7);
          ```
        )
      )
    ]

    \
    Na tabela "Gere", registamos a relação de gestão entre funcionários, onde um funcionário gestor é associado a outros funcionários que estão sob sua supervisão. Este relacionamento é representado pelos IDs do gestor e do funcionário.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Gere com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Inserção de dados na tabela Gere
          INSERT INTO Gere (Funcionário_Gestor_ID, Funcionário_ID) VALUES
              (3, 1),
              (3, 2),
              (3, 4),
              (6, 5),
              (6, 6),
              (6, 7);
          ```
        )
      )
    ]

    \
    A tabela "Terreno" armazena informações sobre os terrenos geridos pela empresa, incluindo o ID do terreno, a quantidade de minério prevista e a quantidade de minério coletado. Esta tabela é crucial para a gestão e monitorização das operações de mineração.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Terreno com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Inserção de dados na tabela Terreno
          INSERT INTO Terreno (Minério_previsto, Minério_coletado) VALUES
              (1000, 800),
              (1500, 1200),
              (800, 600),
              (2000, 1800),
              (1200, 1000),
              (1800, 1600),
              (900, 700);
          ```
        )
      )
    ]

    \
    A tabela "Trabalha" regista quais funcionários estão alocados a quais terrenos, estabelecendo uma ligação direta entre o ID do funcionário e o ID do terreno.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Trabalha com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Inserção de dados na tabela Trabalha
          INSERT INTO Trabalha (Funcionário_ID, Terreno_ID) VALUES
              (1, 1),
              (2, 2),
              (3, 3),
              (4, 4),
              (5, 5),
              (6, 6),
              (7, 7);
          ```
        )
      )
    ]

    \
    A tabela "Caso" regista os casos de investigação, incluindo informações sobre a data de abertura, estado atual, estimativa de roubo, data de encerramento e o ID do terreno associado ao caso. Estes dados são essenciais para o acompanhamento das investigações em curso.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Caso com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Inserção de dados na tabela Caso
          INSERT INTO Caso (Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID) VALUES
              ('2024-01-10', 'Aberto', 500, NULL, 1),
              ('2024-02-15', 'Fechado', 1000, '2024-05-05', 2),
              ('2024-03-20', 'Aberto', 700, NULL, 3),
              ('2024-04-25', 'Aberto', 800, NULL, 4),
              ('2024-05-01', 'Aberto', 300, NULL, 5),
              ('2024-05-08', 'Aberto', 900, NULL, 6),
              ('2024-05-10', 'Aberto', 600, NULL, 7);
          ```
        )
      )
    ]

    \
    Por fim, a tabela "Suspeito" regista os funcionários suspeitos em cada caso, incluindo o seu estado de envolvimento, nível de envolvimento e notas adicionais sobre a suspeita. Estes dados são fundamentais para a análise e resolução dos casos de investigação.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Suspeito com SQL.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```sql
          -- Inserção de dados na tabela Suspeito
          INSERT INTO Suspeito (Funcionário_ID, Caso_ID, Estado, Envolvimento, Notas) VALUES
              (1, 1, 'Inocente', 1, 'Nenhuma informação adicional.'),
              (2, 2, 'Culpado', 9, 'Suspeito estava presente na cena do crime.'),
              (3, 3, 'Em investigação', 5, 'Algumas pistas indicam possível envolvimento.'),
              (4, 4, 'Em investigação', 3, 'Não há provas concretas.'),
              (5, 5, 'Inocente', 2, 'Sem evidências contra o suspeito.'),
              (6, 6, 'Culpado', 8, 'Fortes indícios de participação.'),
              (7, 7, 'Em investigação', 4, 'Possível conexão com outras investigações.');
          ```
        )
      )
    ]

    \
    Para iniciar o processo com Python, primeiro importamos as bibliotecas necessárias, entre elas, _mysql.connector_ para estabelecer conexão com a base de dados, _faker_ para criação de dados fictícios, _random_ de forma a induzir aleatoriedade nas informações criada e, finalmente, _datatime_ para facilitar a manipulação de datas em formatos pré-concebidos. Neste exemplo, solicita-se ao utilizador do programa que insira as suas credenciais e procede-se ao estabelecimento da ligação ao sistema e definição do cursor para execução de comandos SQL. Por último, inicializa-se o _faker_ para criar dados em "Português de Portugal".
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Importação de bibliotecas e conexão à base de dados.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          import mysql.connector
          from faker import Faker
          import random
          from datetime import timedelta
    
          # Solicita ao utilizador o nome de utilizador e a senha para se conectar ao SQL
          user = input("Insira o nome de utilizador da base de dados SQL: ")
          password = input("Insira a senha da base de dados SQL: ")
    
          # Estabelece a conexão com a base de dados SQL
          conn = mysql.connector.connect(
              host="localhost",
              user=user,
              password=password,
              database="Lusium"
          )
    
          # Verifica se a conexão foi bem-sucedida e imprime a versão do servidor
          if conn.is_connected():
              print("Conectado ao SQL Server versão ", conn.get_server_info())
    
          # Cria um cursor para executar comandos SQL
          cursor = conn.cursor()
    
          # Instancia o Faker configurado para gerar dados em português de Portugal
          fake = Faker('pt_PT')
          ```
        )
      )
    ]

    \
    Inicialmente, utiliza-se uma lista com as funções previstas e, em seguida, inserimos cada uma dessas funções na tabela "Função". Através de um ciclo _for_, itera-se sobre a lista e o método _cursor.execute()_ para executar a inserção, passando o identificador e a designação de cada função.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Função com Python.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          # Lista de funções para inserir na tabela Função
          funcoes = ['Operacional', 'Detetive', 'Representante']
    
          # Insere as 3 funções na tabela Função
          for i, funcao in enumerate(funcoes, start=1):
              cursor.execute("INSERT INTO Função (Função_ID, Designação) VALUES (%s, %s)", (i, funcao))
          ```
        )
      )
    ]

    \
    De seguida, geram-se e inserem-se dados fictícios para 100 funcionários na tabela "Funcionário". Utiliza-se a biblioteca _fake_ para gerar nomes, datas de nascimento, NIFs e URLs de fotografias, e a biblioteca _random_ para definir salários e IDs de função. Cada funcionário é inserido na tabela através de um ciclo _for_ que utiliza o método _cursor.execute()_.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Funcionário com Python.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          # Gera e insere dados fictícios para 100 funcionários na tabela Funcionário
          for i in range(1, 101):
              nome = fake.name()
              data_nascimento = fake.date_of_birth(minimum_age=18, maximum_age=65)
              salario = random.randint(1000, 5000)
              nif = fake.random_number(digits=9)
              fotografia = fake.image_url()
              funcao_id = random.randint(1, len(funcoes))
              cursor.execute("INSERT INTO Funcionário (Funcionário_ID, Nome, Data_de_nascimento, Salário, NIF, Fotografia, Função_ID) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                             (i, nome, data_nascimento, salario, nif, fotografia, funcao_id))
          ```
        )
      )
    ]

    \
    O bloco de código seguinte é responsável por inserir 100 números de telemóvel na tabela "Número_de_telemóvel". Geram-se números sequenciais a partir de 900000000 e associa-se cada número a um funcionário. Utiliza-se um ciclo _for_ para a inserção sequencial dos dados na tabela com o método _cursor.execute()_.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Número_de_telemóvel com Python.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          # Gera e insere 100 números de telefone sequenciais na tabela Número_de_telemóvel
          for i in range(1, 101):
              num_telefone = 900000000 + i
              funcionário_id = i
              cursor.execute("INSERT INTO Número_de_telemóvel (Número_de_telemóvel_ID, Funcionário_ID) VALUES (%s, %s)", (num_telefone, funcionário_id))
          ```
        )
      )
    ]

    \
    Neste bloco de código, inserem-se 50 registos na tabela "Gere". Estes registos representam relações de gestão entre funcionários. Para cada gestor, escolhe-se aleatoriamente um funcionário que ele gere, utilizando _random.randint_ para determinar o ID do funcionário gerido. As inserções são realizadas num ciclo _for_.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Gere com Python.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          # Gera e insere 50 dados de gestão aleatória na tabela Gere
          for i in range(1, 51):
              funcionário_gestor_id = i
              funcionário_id = random.randint(1, 100)
              cursor.execute("INSERT INTO Gere (Funcionário_Gestor_ID, Funcionário_ID) VALUES (%s, %s)", (funcionário_gestor_id, funcionário_id))
          ```
        )
      )
    ]

    \
    Prossegue-se com a geração e inserção de dados para 20 terrenos na tabela "Terreno". Cada terreno tem um valor previsto e coletado de minério, ambos gerados aleatoriamente. Utiliza-se um ciclo _for_ e o método _cursor.execute()_ para realizar as inserções na tabela.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Terreno com Python.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          # Gera e insere dados fictícios para 20 terrenos na tabela Terreno
          for i in range(1, 21):
              minério_previsto = random.randint(1000, 10000)
              minério_coletado = random.randint(0, minério_previsto)
              cursor.execute("INSERT INTO Terreno (Terreno_ID, Minério_previsto, Minério_coletado) VALUES (%s, %s, %s)", (i, minério_previsto, minério_coletado))
          ```
        )
      )
    ]

    \
    Na inserção de dados de trabalho para 100 funcionários na tabela "Trabalha", cada funcionário é associado aleatoriamente a um terreno. Utiliza-se um ciclo _for_ e a função _random.randint_ para selecionar o ID do terreno. As inserções são feitas novamente com o método _cursor.execute()_.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Trabalha com Python.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          # Gera e insere 100 dados de trabalho na tabela Trabalha
          for i in range(1, 101):
              funcionário_id = i
              terreno_id = random.randint(1, 20)
              cursor.execute("INSERT INTO Trabalha (Funcionário_ID, Terreno_ID) VALUES (%s, %s)", (funcionário_id, terreno_id))
          ```
        )
      )
    ]

    \
    No presente bloco de código, geram-se e inserem-se dados fictícios para 50 casos na tabela "Caso". Geram-se datas de abertura e encerramento, estados dos casos, estimativas de roubo e associam-se cada caso a um terreno, aplicando as estratégias já anteriormente descritas.

    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Caso com Python.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          # Gera e insere dados fictícios para 50 casos na tabela Caso
          for i in range(1, 51):
              data_abertura = fake.date_between(start_date='-1y', end_date='today')
              estado = random.choice(['Aberto', 'Fechado'])
              estimativa_roubo = random.randint(1000, 100000)
              data_encerramento = data_abertura + timedelta(days=random.randint(10, 365)) if estado == 'Fechado' else None
              terreno_id = random.randint(1, 20)
              cursor.execute("INSERT INTO Caso (Caso_ID, Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID) VALUES (%s, %s, %s, %s, %s, %s)", (i, data_abertura, estado, estimativa_roubo, data_encerramento, terreno_id))
          ```
        )
      )
    ]

    \
    Neste bloco de código, inserem-se dados fictícios para 100 suspeitos na tabela "Suspeito". Cada suspeito é associado a um funcionário e a um caso, com estados, níveis de envolvimento e notas gerados aleatoriamente.

    #align(center)[
      #figure(
        kind: image,
        caption: [Inserção de dados na tabela Suspeito com Python.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          # Gera e insere dados fictícios de 100 suspeitos na tabela Suspeito
          for i in range(1, 101):
              funcionário_id = i
              caso_id = random.randint(1, 50)
              estado = random.choice(['Inocente', 'Em investigação', 'Culpado'])
              envolvimento = random.randint(1, 10)
              notas = fake.text()
              cursor.execute("INSERT INTO Suspeito (Funcionário_ID, Caso_ID, Estado, Envolvimento, Notas) VALUES (%s, %s, %s, %s, %s)", (funcionário_id, caso_id, estado, envolvimento, notas))
          ```
        )
      )
    ]

    \
    Por fim, no último bloco de código, imprime-se uma mensagem de sucesso após a inserção correta dos dados. Em seguida, confirmam-se todas as transações pendentes na base de dados ao utilizar _conn.commit()_ e fecha-se a conexão com a base de dados ao utilizador _conn.close()_.
    
    #align(center)[
      #figure(
        kind: image,
        caption: [Finalização das transações e conexão com a base de dados.],
        block(
          fill: rgb("#f2f2eb"),
          inset: 8pt,
          ```python
          # Imprime a mensagem de sucesso
          print("Dados inseridos com sucesso!")
          
          # Confirma todas as transações e fecha a conexão com a base de dados
          conn.commit()
          conn.close()
          ```
        )
      )
    ]

    \
    As duas abordagens complementam-se eficazmente no povoamento da base de dados. A abordagem SQL, com menos registos, facilita a exemplificação de operações mais simples, enquanto a utilização de Python permitiu um povoamento extensivo e variado, essencial para testes avançados e validação de queries complexas. Desta forma, assegura-se um ambiente de desenvolvimento robusto e versátil.
    
  ]
}
