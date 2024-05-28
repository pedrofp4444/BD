#import "cover.typ": cover
#import "templates/template.typ": *
#import "templates/index.typ": *

#import "content/[0] Resumo/main.typ": resumo
#import "content/[1] Definição do sistema/main.typ": definicao_do_sistema
#import "content/[2] Levantamento e Análise de Requisitos/main.typ": requisitos
#import "content/[3] Modelação Concetual/main.typ": concetual
#import "content/[4] Modelação Lógica/main.typ": lógico
#import "content/[5] Implementação Física/main.typ": físico
#import "content/[6] Conclusão e Trabalhos Futuros/main.typ": conclusão

#show: project

#cover(title: [Brigada de Espionagem e \ Localização Operacional], authors: (
  (name: "Eduardo Faria", number: "a104353"), 
  (name: "Hélder Gomes", number: "a104100"), 
  (name: "Pedro Pereira", number: "a104082"), 
  (name: "Nuno Silva", number: "a104089")), 
  "28 de maio de 2024")

#set page(numbering: "i", number-align: center)
#counter(page).update(1)

#resumo

#index

// Make the page counter reset to 1
#set page(numbering: "1", number-align: center)
#counter(page).update(1)

#definicao_do_sistema

#requisitos

#concetual

#lógico

#físico

#conclusão

#heading(numbering: none)[Referências]

- Connolly, T. M., & Begg, C. E. (2005). Database systems: a practical approach to design, implementation, and management. Pearson Education.

- MySQL 8.0 Reference Manual. MySQL. (2024). https://dev.mysql.com/doc/refman/8.0/en/

#heading(numbering: none)[Lista de Siglas e Acrónimos]

/ B.E.L.O.: Brigada de Espionagem e Localização Operacional
/ SQL: Structured Query Language

#heading(numbering: none)[Anexos]

#align(center)[

  #block(
    breakable: true,
    [
      #attachment(caption: "Ata da primeira reunião", align(left)[
      *Data de realização:* 1 de março de 2024

      *Hora de início:* 09:37h

      *Hora de término:* 11:56h

      *Participantes*
      
      - Hélder Gomes - Membro da “Quatro em Linha”
      - Pedro Pereira - Membro da “Quatro em Linha”
      - Ana Sofia - Representante da empresa
      - Maria Eduarda - Representante da empresa
      - João Guilherme - Representante da empresa

      *Contextualização*
      
      Ao primeiro dia do mês de março de dois mil e vinte e quatro, com início às nove horas e trinta e sete minutos da manhã, na sala de reuniões número doze, localizada na sede da Lusium, realizou-se uma primeira reunião com os representantes da empresa, Ana Sofia, Maria Eduarda e João Guilherme, com a principal meta de apresentar uma solução para a questão-problema apresentada à empresa “Quatro em Linha”. 

      *Levantamentos*
      
      Iniciaram-se os trabalhos previstos com a apresentação dos representantes de ambas as valências, Hélder Gomes começou por fazer uma *descrição da história da empresa*, como as motivações de fundação e os princípios laborais inerentes. Após a intervenção, Pedro Pereira enumerou as *competências e habilidades* dos intervenientes associados aos vários projetos que a empresa já desenvolveu até ao momento com sucesso. 
      
      No decorrer da ordem de trabalhos, Maria Eduarda, na qualidade de representante da Lusium, procedeu à *descrição e qualificação da questão-problema*, principiando com o enunciar dos inúmeros casos de furtos decorrentes da criação da empresa de minério e triunfo consequente. João Guilherme completou a intervenção de Maria Eduarda com uma preocupação pessoal sobre a empresa, mas principalmente sobre Vizela, a sua cidade natal.
      
      Após as apresentações iniciais e discussão sobre os problemas enfrentados pela empresa e pela comunidade local, Hélder Gomes e Pedro Pereira *propuseram a implementação de um sistema de gestão de base de dados* como forma de controlar os novos furtos. A ideia foi bem recebida pelos participantes, que demonstraram entusiasmo com a proposta.
      
      Ana Sofia agradeceu as contribuições de todos os presentes e destacou a *importância do diálogo* e da *colaboração* para encontrar soluções eficazes. Em resposta à proposta, foi decidido marcar outras reuniões para avaliar e desenvolver a viabilidade da ideia.
      
      Em adição, ficou acordado formar um grupo de trabalho dedicado a abordar os desafios identificados e a elaborar estratégias para *melhorar a segurança e o bem-estar da comunidade*. Hélder Gomes e Pedro Pereira enfatizaram a eficácia de tal sistema de monitorização e registo para identificar padrões e *agir preventivamente contra os furtos*.
      
      A proposta foi recebida com entusiasmo pelos participantes, que concordaram em participar ativamente no grupo de trabalho. Ficou agendada uma próxima reunião, com data prevista  de 4 de março de 2024, às nove horas e trinta minutos da manhã, para dar continuidade às discussões e recolher as medidas e requisitos para a base de dados.
      
      Para sumarizar, a reunião foi encerrada com a promessa de um *esforço conjunto* para enfrentar os desafios e promover o *crescimento saudável* da empresa e da comunidade.

      *Assinaturas*
      
      #image("images/AssinaturasAta1.png")
      ])
    ])
    #label("Anexo1")

    #block(
    breakable: true,
    [
      #attachment(caption: "Ata da segunda reunião", align(left)[
      *Data de realização:* 4 de março de 2024
      
      *Hora de início:* 09:30h
      
      *Hora de término:* 12:00h

      *Contextualização*
      
      Ao quarto dia do mês de março de dois mil e vinte e quatro, com início às nove horas e trinta minutos da manhã, na sala de reuniões número cinco, localizada na sede da Lusium, realizou-se uma segunda reunião com os representantes da empresa, Ana Sofia, Maria Eduarda e João Guilherme, com o objetivo de idealizar os requisitos mandatórios, relacionados com a gestão dos funcionários e dos terrenos onde trabalham, para o correto funcionamento do sistema de gestão de base de dados.

      *Participantes*
      
      - Eduardo Faria - Membro da “Quatro em Linha”
      - Nuno Silva - Membro da “Quatro em Linha”
      - Ana Sofia - Representante da empresa
      - Maria Eduarda - Representante da empresa
      - João Guilherme - Representante da empresa

      *Tópicos abordados*
      
      No decorrer da reunião, foram esclarecidos quais os aspetos a ter em conta no domínio da gestão dos funcionários da empresa e dos terrenos de extração de minérios. Estes aspetos revelam-se cruciais e são dependentes de consistência e de uma boa ponderação.

      *Levantamentos*
      
      Com o desenrolar da reunião, foi possível recolher diversas propostas e sugestões relacionadas com o modelo de funcionamento dos funcionários e terrenos.
      
      Maria Eduarda, numa fase inicial, referiu que cada *funcionário* deveria ser *identificado de forma exclusiva*, acrescentando ainda que o *nome*, *data de nascimento*, *função*, *salário*, *números de identificação e números de telemóvel* seriam características importantes a associar ao mesmo. Além disso, mencionou que deveriam ter uma *fotografia* associada, ao passo que João Guilherme manifestou a ideia de que a fotografia deveria ser algo *opcional* e nunca de carácter obrigatório.
      
      A partir de uma primeira intervenção por parte da representante Ana Sofia, ficou definido que os funcionários deveriam ser designados para diferentes funções, como *operacional*, *detetive* ou *representante*, esclarecendo ainda que *nos terrenos* da empresa *trabalham vários operacionais* e que cada um destes pode estar atribuído a *mais do que um terreno*.
      
      Maria Eduarda, numa outra intervenção, destacou que cada *terreno* da empresa deveria ser *identificado de forma única*, tornando possível a distinção entre cada um deles. Complementarmente, os representantes reforçaram a ideia de que são levantadas suspeitas num terreno sempre que a quantidade de minério coletado não corresponde à quantidade prevista de minério a coletar no dia. Como resposta, Nuno Silva e Eduardo Faria propuseram a ideia de que um terreno deveria conter informações sobre o *minério previsto* e o *minério coletado*, ideia esta que foi diretamente aprovada pelos representantes. O minério previsto representaria a *quantidade estimada de minério* que se espera coletar *diariamente*, enquanto que o *minério coletado* refletiria a *quantidade real de minério coletada por dia*. Deste modo, todos os intervenientes chegaram à conclusão que seria importante monitorizar todos esses dados para, posteriormente, ser possível *calcular e listar o prejuízo* de cada terreno, o que ajudaria na tomada de decisões estratégicas e no planeamento futuro das operações.
  
      Ana Sofia, Maria Eduarda e João Guilherme, em conformidade, salientaram o facto de serem os únicos *responsáveis pela gestão dos funcionários operacionais*, coordenando todas as suas atividades e garantindo eficiência operacional. Assim sendo, por unanimidade de todos os participantes, chegou-se à conclusão que deveria ser possível fornecer permissões aos *representantes* na base de dados, de modo a que estes *consigam criar novos funcionários e, adicionalmente, terrenos*, bem como *modificar as informações adjacentes aos mesmos*. Em contrapartida, João Guilherme enfatizou o facto de que os *funcionários operacionais não devem ter acesso direto às informações sensíveis* desta base de dados, de forma a manter a correta gestão da mesma e, consequentemente, da empresa.

      Deste modo, após a formalização de todas estas condições, salientou-se a necessidade de agendar uma próxima reunião que garantisse, agora, a declaração das imprescindibilidades do modelo que abrange a gestão dos casos e dos suspeitos adjacentes. Esta nova reunião ficou marcada para o próximo dia 8 de março de 2024, às nove horas da manhã, da qual também fariam parte os detetives da B.E.L.O, visto serem os mais qualificados para descrever o modo como se deve correlacionar suspeitos e casos com funcionários e terrenos, perante o problema em questão.

      *Assinaturas*
      
      #image("images/AssinaturasAta2.png")
      ])
    ])
    #label("Anexo2")

    #block(
    breakable: true,
    [
      #attachment(caption: "Ata da terceira reunião", align(left)[
      Data de realização: 8 de março de 2024
      
      Hora de início: 09:04h
      
      Hora de término: 11:29h

      *Contextualização*
      
      Ao oitavo dia do mês de março de dois mil e vinte e quatro, com início às nove horas e quatro minutos da manhã, na sala de reuniões número sete, localizada no departamento B.E.L.O da Lusium, realizou-se uma terceira reunião com os detetives da empresa e um dos representantes da mesma, Ana Sofia. Nesta reunião, Ana, para além de trazer consigo ideias capazes de completar medidas estabelecidas na reunião anterior, teria, agora também, o cargo de autorizar os pedidos e decisões dos detetives, quando se apresentassem admissíveis. Deste modo, a reunião seguiria com o objetivo de elaborar os requisitos relacionados com a gestão dos casos e suspeitos adjacentes, necessários para um adequado desenvolvimento e consequente funcionamento do sistema de gestão de base de dados.

      *Participantes*
      
      - Pedro Pereira - Membro da “Quatro em Linha”
      - Hélder Gomes - Membro da “Quatro em Linha”
      - Ana Sofia - Representante da empresa
      - Filipe Sousa - Detetive da B.E.L.O.
      - Sandra Silva - Detetive da B.E.L.O.
      - João Silva - Detetive da B.E.L.O.
      - Américo Costa - Detetive da B.E.L.O.
      - Henrique Mendes - Detetive da B.E.L.O.
      - Lara Machado - Detetive da B.E.L.O.

     *Tópicos abordados*
     
      Ao longo desta reunião, foram desenvolvidos vários pontos que têm por base todo o funcionamento da gestão dos casos com que lida a agência, bem como os suspeitos envolvidos nos mesmos. Estes pontos devem ser bem definidos e alvos de uma forte especificação, visando assegurar uma abordagem sólida que garanta a eficácia e integridade da base de dados.

      *Levantamentos*
      
      Com o decorrer da reunião, uma pluralidade de propostas e sugestões foram apresentadas, todas elas orientadas para o modelo de funcionamento dos casos e dos suspeitos relacionados com os mesmos.
      
      O detetive Filipe Sousa fez a primeira intervenção na reunião, mencionando que um caso deveria ser *identificado de forma exclusiva* e, simultaneamente, incluir informações extra, como a sua *data de abertura, data de encerramento, se aplicável, o seu estado e a quantidade estimada de minério roubado*.
      
      A detetive Lara Machado acabou por reforçar a ideia de que cada *caso* estaria *somente ligado a um terreno*, porém, cada *terreno* da empresa poderia *contar com vários casos*. De forma a complementar a intervenção de Lara Machado, Hélder Gomes e Pedro Pereira questionaram os detetives sobre de que forma é que um caso deveria ser *classificado* quanto ao seu *estado*, ao que Américo Costa respondeu que apenas seria necessário classificar o mesmo como *"aberto" ou "fechado"*.
      
      Não deixando de parte o que foi referido na reunião anterior sobre o levantamento de suspeitas num terreno, a representante Ana Sofia incluiu agora que um *novo caso* deveria ser automaticamente *aberto* caso a *quantidade de minério coletada num terreno, num dado dia*, fosse *inferior à quantidade mínima prevista*. Consequentemente, *todos os funcionários* associados a esse terreno *tornar-se-iam suspeitos*, iniciando assim uma investigação para determinar qualquer possível atividade criminosa.
      
      Todos os *detetives* concordaram, de forma unânime, que deveriam ser os únicos com permissão para *criar casos* e *alterar algumas informações* dos mesmos na base de dados, o que foi aceite pela representante presente. Ficou também confirmado que deveriam ser os únicos autorizados a *atribuir suspeitos a um caso e atualizar o estado desses suspeitos* conforme necessário.
      
      Dentro do mesmo contexto, Sandra Silva achou por bem explicar que cada suspeito deveria ser bem caracterizado pelo seu *estado, nível de envolvimento e possíveis notas adicionais* sobre o mesmo. Esta aprimorou a sua intervenção esclarecendo que o *nível de envolvimento* deveria *variar de 1 a 10*, indicando o grau de participação do suspeito no caso, enquanto que o *estado* poderia variar entre *"inocente"* ou *"culpado"*, de forma a facilitar a análise de cada um deles.
      
      Todos os intervenientes concordaram que o acompanhamento da atividade dos casos seria algo imprescindível e, para tal, os dois membros da “Quatro em Linha” propuseram a ideia de se poder *verificar quando é que um funcionário se tornou suspeito* de um determinado caso, *visualizar os suspeitos de um caso específico* e verificar a *data do último caso associado a um funcionário*, o que foi aprovado por todos os integrantes. Complementarmente, os detetives também consideraram relevante haver a possibilidade de se fazer uma *listagem dos casos associados a um determinado funcionário*, bem como uma verificação do *dia em que mais casos foram abertos*, o que poderia fornecer esclarecimentos valiosos para a gestão de segurança e operações da empresa.
      
      Américo Costa, numa fase final, ainda salientou que deveria ser possível organizar os diferentes suspeitos com base na quantidade de casos a que se associam, visto ser um informação/dado que auxiliaria na priorização das investigações e na identificação de padrões de comportamentos suspeitos. Assim, de modo a simplificar o processo descrito, foi acordado que deveria haver a possibilidade de se fazer uma *listagem específica dos cinco suspeitos com mais casos* de roubo de minérios associados.
      
      Ao terminar a 3ª reunião, ficou acordado por Ana Sofia, que participou em nome de todos os representantes, e por todos os detetives presentes que seria pertinente agendar uma próxima reunião, que contaria com a informação referente à experiência dos trabalhadores da Lusium através de um inquérito estatístico de opinião. O propósito da mesma seria verificar a integridade de todas as ideias e sugestões recolhidas até ao momento, antes da implementação dos requisitos gerados pelas mesmas no sistema de gestão de base de dados.

      *Assinaturas*
      
      #image("images/AssinaturasAta3.png")
      ])
    ])
    #label("Anexo3")

    #block(
    breakable: true,
    [
      #attachment(caption: "Ata da quarta reunião", align(left)[
      *Data de realização:* 14 de março de 2024
      
      *Hora de início:* 09:11h
      
      *Hora de término:* 11:42h
      
      *Contextualização*
      
      Ao décimo quarto dia do mês de março de dois mil e vinte e quatro, com início às nove horas e onze minutos da manhã, na sala de reuniões número um, localizada no departamento B.E.L.O da Lusium, realizou-se uma quarta e última reunião com todos os detetives da empresa e todos os representantes da mesma, Ana Sofia, Maria Eduarda e João Guilherme. Nesta reunião, todos os requisitos anteriormente levantados foram reavaliados por todos os envolvidos com o intuito de os concluir.
      
      *Participantes*
      
      - Eduardo Faria - Membro da “Quatro em Linha”
      - Hélder Gomes - Membro da “Quatro em Linha”
      - Nuno Silva - Membro da “Quatro em Linha”
      - Pedro Pereira - Membro da “Quatro em Linha”
      - Ana Sofia - Representante da empresa
      - Maria Eduarda - Representante da empresa
      - João Guilherme - Representante da empresa
      - Filipe Sousa - Detetive da B.E.L.O
      - Sandra Silva - Detetive da B.E.L.O
      - João Silva - Detetive da B.E.L.O
      - Américo Costa - Detetive da B.E.L.O
      - Henrique Mendes - Detetive da B.E.L.O
      - Lara Machado - Detetive da B.E.L.O
      
      
      *Tópicos abordados*
      
      Durante o decorrer desta reunião, foram abordados todos os pontos anteriormente discutidos, para assim dar por concluída toda a base do funcionamento da base de dados. Estes pontos devem ser bem definidos e alvos de uma forte especificação, visando assegurar uma abordagem sólida que garanta a eficácia e integridade da base de dados.
            
      *Levantamentos*
      Hélder Gomes deu início à reunião pedindo alguns esclarecimentos sobre requisitos levantados anteriormente. A primeira elucidação abordaria o que foi referido, inicialmente, por Maria Eduarda, ao pedir que cada funcionário seja caracterizado por *números de identificação*, ao qual foi respondido que, depois de uma reunião onde apenas estiveram presentes os representantes, decidiram alterar esse pedido para apenas ter em conta o *número de identificação fiscal (NIF)*, dado o âmbito do projeto. As restantes características mantinham-se inalteradas, pelo que tanto os membros da “Quatro em Linha”, como da agência B.E.L.O concordaram.
      
      Eduardo Faria interpelou logo de seguida, pedindo aos detetives a confirmação sobre o funcionamento dos funcionários e como eles se relacionam com os terrenos, à qual Henrique Mendes e Lara Machado concordaram prontamente.
      
      De seguida, Pedro Pereira descreveu todas as características de um terreno, finalizando com um apelo à melhoria da eficiência da base de dados, sendo este a mudança da informação de *minério previsto* para *minério mínimo previsto*, ao qual João Guilherme respondeu que seria uma alteração possível, apenas teriam de comunicar essa alteração aos técnicos que iriam avaliar os terrenos. As restantes características foram aprovadas sem nenhum acréscimo.
      
      Quanto às permissões da base de dados, Nuno Silva expôs os pedidos feitos pelos representantes. Os detetives demonstraram compreensão e concordaram que essa logística é a ideal para a integridade dos dados.
      
      Pedro Pereira comunicou as características de um caso, sendo que, depois de uma pequena discussão entre representantes e detetives, decidiram manter como anteriormente definido.
      
      Maria Eduarda questionou se, caso o *minério coletado* fosse *igual* ao *minério mínimo* previsto, seria possível abrir um *caso para investigação*. Esse comentário proporcionou um momento de reflexão entre os presentes. Alguns expressaram a sua indignação de forma leve, mas a ponderação prevaleceu na decisão final. Ficou estabelecido que apenas o que for *coletado abaixo do mínimo estipulado será alvo de investigação*.
      
      Sandra Silva solicitou uma modificação num requisito previamente estabelecido. Essa solicitação surgiu após uma breve reunião informal entre os membros da agência, na qual se chegou unanimemente à conclusão de que classificar o estado de um suspeito apenas como *"inocente"* ou *"culpado"* seria *insuficiente*. Propôs-se então a *adição de um terceiro estado, "em investigação"*. Todos os presentes concordaram com essa decisão.
      
      No restante da reunião prevaleceu a *exposição dos requisitos* e a *aprovação* por parte de todos os presentes.
      
      A reunião foi encerrada pelas onze horas e quarenta e dois minutos com todos os envolvidos a demonstrarem, de forma não verbal, a gratificação pelo início da implementação do sistema de gestão de base de dados.

      *Assinaturas*
      
      #image("images/AssinaturasAta4.png")
      ])
    ])
    #label("Anexo4")
    
  #block(
    breakable: false,
    [
    #attachment(caption: "Logo da Universidade do Minho", image("images/uminho.png"))
  ])

  #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do diagrama de Gantt inicial.", image("images/Captura_GANTT_inicial.png"))
    ])

  #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do Relacionamento Funcionário - Funcionário.", image("images/[3] - 1.png"))
    ])
  #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do Relacionamento Funcionário - Função.", image("images/[3] - 2.png"))
    ])
    
  #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do Relacionamento Funcionário - Terreno.", image("images/[3] - 3.png"))
    ])
    
  #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do Relacionamento Funcionário - Caso.", image("images/[3] - 4.png"))
    ])
    
  #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do Relacionamento Terreno - Caso.", image("images/[3] - 5.png"))
    ])

  #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do diagrama ER produzido.", image("images/Captura_DiagramaER.png"))
    ])

  #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do modelo lógico produzido.", image("images/Captura_ModeloLógico.png"))
    ])
    
  #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do diagrama de Gantt real.", image("images/Captura_GANTT_real.png"))
    ])

    #block(
    breakable: false,
    [
      #attachment(caption: "Ilustração do Inquérito Estatistico de Opinião.", image("images/Formulário.png"))
    ])
    #label("Anexo15")
//aaaaaaaaaaaaaaaaaaa
    #block(
    breakable: false,
    [
      #attachment(caption: "Tabela lógica da Função.", image("images/FunçãoTabela.png", width: 20%))
    ])

    #block(
    breakable: false,
    [
      #attachment(caption: "Tabela lógica do Funcionário.", image("images/FuncionárioTabela.png", width: 20%))
    ])

    #block(
    breakable: false,
    [
      #attachment(caption: "Tabela lógica do Número de Telemóvel.", image("images/NumTelemóvelTabela.png", width: 20%))
    ])

    #block(
    breakable: false,
    [
      #attachment(caption: "Tabela lógica do Gere.", image("images/GereTabela.png", width: 20%))
    ])

    #block(
    breakable: false,
    [
      #attachment(caption: "Tabela lógica do Terreno.", image("images/TerrenoTabela.png", width: 20%))
    ])

    #block(
    breakable: false,
    [
      #attachment(caption: "Tabela lógica do Trabalha.", image("images/TrabalhaTabela.png", width: 20%))
    ])


    #block(
    breakable: false,
    [
      #attachment(caption: "Tabela lógica do Caso.", image("images/CasoTabela.png", width: 20%))
    ])

    #block(
    breakable: false,
    [
      #attachment(caption: "Tabela lógica do Suspeito.", image("images/SuspeitoTabela.png", width: 20%))
    ])

    
    #attachment(caption: "Script de criação da base de dados em SQL.",[])
              #block(
                fill: rgb("#f2f2eb"),
                inset: 8pt,
                breakable: true,
                ```sql
                CREATE DATABASE IF NOT EXISTS Lusium;
                
                USE Lusium;
                
                -- Criação da tabela Função
                CREATE TABLE Função (
                    Função_ID INT AUTO_INCREMENT NOT NULL,
                    Designação ENUM('Operacional', 'Detetive', 'Representante') NOT NULL,
                    PRIMARY KEY (Função_ID)
                );
                
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
                
                -- Criação da tabela Número de telemóvel
                CREATE TABLE Número_de_telemóvel (
                    Número_de_telemóvel_ID INT AUTO_INCREMENT NOT NULL,
                    Funcionário_ID INT NOT NULL,
                    PRIMARY KEY (Número_de_telemóvel_ID),
                    FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID)
                );
                
                -- Criação da tabela Gere
                CREATE TABLE Gere (
                    Funcionário_Gestor_ID INT NOT NULL,
                    Funcionário_ID INT NOT NULL,
                    PRIMARY KEY (Funcionário_Gestor_ID, Funcionário_ID),
                    FOREIGN KEY (Funcionário_Gestor_ID) REFERENCES Funcionário(Funcionário_ID),
                    FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID)
                );
                
                -- Criação da tabela Terreno
                CREATE TABLE Terreno (
                    Terreno_ID INT AUTO_INCREMENT NOT NULL,
                    Minério_previsto INT NOT NULL,
                    Minério_coletado INT NOT NULL,
                    PRIMARY KEY (Terreno_ID)
                );
                
                -- Criação da tabela Trabalha
                CREATE TABLE Trabalha (
                    Funcionário_ID INT NOT NULL,
                    Terreno_ID INT NOT NULL,
                    PRIMARY KEY (Funcionário_ID, Terreno_ID),
                    FOREIGN KEY (Funcionário_ID) REFERENCES Funcionário(Funcionário_ID),
                    FOREIGN KEY (Terreno_ID) REFERENCES Terreno(Terreno_ID)
                );
                
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

    #attachment(caption: "Script de povoamento da base de dados em SQL.",[])
              #block(
                fill: rgb("#f2f2eb"),
                inset: 8pt,
                breakable: true,
                ```sql
                -- Inserção de dados na tabela Função
                INSERT INTO Função (Designação) VALUES
                    ('Operacional'),
                    ('Detetive'),
                    ('Representante');
                    
                
                -- Inserção de dados na tabela Funcionário
                INSERT INTO Funcionário (Nome, Data_de_nascimento, Salário, NIF, Fotografia, Função_ID) VALUES
                    ('Miguel Silva', '1985-03-15', 1200, '123456789', 'foto_miguel.jpg', 1),
                    ('Ana Costa', '1990-07-21', 2800, '987654321', 'foto_ana.jpg', 2),
                    ('Pedro Santos', '1982-12-10', 3000, '456789123', 'foto_pedro.jpg', 3),
                    ('Sofia Pereira', '1988-05-02', 1000, '789123456', 'foto_sofia.jpg', 1),
                    ('Rui Oliveira', '1995-09-18', 2600, '321654987', 'foto_rui.jpg', 2),
                    ('Inês Rodrigues', '1980-11-30', 850, '654987321', 'foto_ines.jpg', 1),
                    ('Tiago Fernandes', '1993-04-25', 2900, '987321654', 'foto_tiago.jpg', 3);
                
                -- Inserção de dados na tabela Número_de_telemóvel
                INSERT INTO Número_de_telemóvel (Número_de_telemóvel_ID, Funcionário_ID) VALUES
                    (934678592, 1),
                    (966492873, 2),
                    (922245762, 3),
                    (936457856, 4),
                    (926486516, 5),
                    (964884547, 6),
                    (964554178, 7);
                
                -- Inserção de dados na tabela Gere
                INSERT INTO Gere (Funcionário_Gestor_ID, Funcionário_ID) VALUES
                    (3, 1),
                    (3, 2),
                    (3, 4),
                    (6, 5),
                    (6, 6),
                    (6, 7);
                
                -- Inserção de dados na tabela Terreno
                INSERT INTO Terreno (Minério_previsto, Minério_coletado) VALUES
                    (1000, 800),
                    (1500, 1200),
                    (800, 600),
                    (2000, 1800),
                    (1200, 1000),
                    (1800, 1600),
                    (900, 700);
                
                -- Inserção de dados na tabela Trabalha
                INSERT INTO Trabalha (Funcionário_ID, Terreno_ID) VALUES
                    (1, 1),
                    (2, 2),
                    (3, 3),
                    (4, 4),
                    (5, 5),
                    (6, 6),
                    (7, 7);
                
                -- Inserção de dados na tabela Caso
                INSERT INTO Caso (Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID) VALUES
                    ('2024-01-10', 'Aberto', 500, NULL, 1),
                    ('2024-02-15', 'Fechado', 1000, '2024-05-05', 2),
                    ('2024-03-20', 'Aberto', 700, NULL, 3),
                    ('2024-04-25', 'Aberto', 800, NULL, 4),
                    ('2024-05-01', 'Aberto', 300, NULL, 5),
                    ('2024-05-08', 'Aberto', 900, NULL, 6),
                    ('2024-05-10', 'Aberto', 600, NULL, 7);
                
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

    #attachment(caption: "Script de povoamento da base de dados em Pthon.",[])
              #block(
                fill: rgb("#f2f2eb"),
                inset: 8pt,
                breakable: true,
                ```python
                import mysql.connector
                from faker import Faker
                import random
                from datetime import timedelta
                
                # Solicita ao utilizador o nome de utilizador e a senha para se conectar ao MySQL
                user = input("Insira o nome de utilizador da base de dados MySQL: ")
                password = input("Insira a senha da base de dados MySQL: ")
                
                # Estabelece a conexão com a base de dados MySQL
                conn = mysql.connector.connect(
                    host="localhost",
                    user=user,
                    password=password,
                    database="Lusium"
                )
                
                # Verifica se a conexão foi bem-sucedida e imprime a versão do servidor
                if conn.is_connected():
                    print("Conectado ao MySQL Server versão ", conn.get_server_info())
                
                # Cria um cursor para executar comandos SQL
                cursor = conn.cursor()
                
                # Instancia o Faker configurado para gerar dados em português de Portugal
                fake = Faker('pt_PT')
                
                # Lista de funções para inserir na tabela Função
                funcoes = ['Operacional', 'Detetive', 'Representante']
                
                # Insere as 3 funções na tabela Função
                for i, funcao in enumerate(funcoes, start=1):
                    cursor.execute("INSERT INTO Função (Função_ID, Designação) VALUES (%s, %s)", (i, funcao))
                
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
                
                # Gera e insere 100 números de telefone sequenciais na tabela Número_de_telemóvel
                for i in range(1, 101):
                    num_telefone = 900000000 + i
                    funcionário_id = i
                    cursor.execute("INSERT INTO Número_de_telemóvel (Número_de_telemóvel_ID, Funcionário_ID) VALUES (%s, %s)", (num_telefone, funcionário_id))
                
                # Gera e insere 50 dados de gestão aleatória na tabela Gere
                for i in range(1, 51):
                    funcionário_gestor_id = i
                    funcionário_id = random.randint(1, 100)
                    cursor.execute("INSERT INTO Gere (Funcionário_Gestor_ID, Funcionário_ID) VALUES (%s, %s)", (funcionário_gestor_id, funcionário_id))
                
                # Gera e insere dados fictícios para 20 terrenos na tabela Terreno
                for i in range(1, 21):
                    minério_previsto = random.randint(1000, 10000)
                    minério_coletado = random.randint(0, minério_previsto)
                    cursor.execute("INSERT INTO Terreno (Terreno_ID, Minério_previsto, Minério_coletado) VALUES (%s, %s, %s)", (i, minério_previsto, minério_coletado))
                
                # Gera e insere 100 dados de trabalho na tabela Trabalha
                for i in range(1, 101):
                    funcionário_id = i
                    terreno_id = random.randint(1, 20)
                    cursor.execute("INSERT INTO Trabalha (Funcionário_ID, Terreno_ID) VALUES (%s, %s)", (funcionário_id, terreno_id))
                
                # Gera e insere dados fictícios para 50 casos na tabela Caso
                for i in range(1, 51):
                    data_abertura = fake.date_between(start_date='-1y', end_date='today')
                    estado = random.choice(['Aberto', 'Fechado'])
                    estimativa_roubo = random.randint(1000, 100000)
                    data_encerramento = data_abertura + timedelta(days=random.randint(10, 365)) if estado == 'Fechado' else None
                    terreno_id = random.randint(1, 20)
                    cursor.execute("INSERT INTO Caso (Caso_ID, Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID) VALUES (%s, %s, %s, %s, %s, %s)",
                                   (i, data_abertura, estado, estimativa_roubo, data_encerramento, terreno_id))
                
                # Gera e insere dados fictícios de 100 suspeitos na tabela Suspeito
                for i in range(1, 101):
                    funcionário_id = i
                    caso_id = random.randint(1, 50)
                    estado = random.choice(['Inocente', 'Em investigação', 'Culpado'])
                    envolvimento = random.randint(1, 10)
                    notas = fake.text()
                    cursor.execute("INSERT INTO Suspeito (Funcionário_ID, Caso_ID, Estado, Envolvimento, Notas) VALUES (%s, %s, %s, %s, %s)",
                                   (funcionário_id, caso_id, estado, envolvimento, notas))
                
                # Imprime a mensagem de sucesso
                print("Dados inseridos com sucesso!")
                
                # Confirma todas as transações e fecha a conexão com a base de dados
                conn.commit()
                conn.close()
                ```
              )

    #attachment(caption: "Script de procedimentos, funções e gatilhos da base de dados em SQL.",[])
              #block(
                fill: rgb("#f2f2eb"),
                inset: 8pt,
                breakable: true,
                ```sql
                -- Trigger: Atualizar Data de Encerramento do Caso ao Fechar
                DELIMITER $$
                CREATE TRIGGER AtualizarDataEncerramento
                BEFORE UPDATE ON Caso
                FOR EACH ROW
                BEGIN
                    IF NEW.Estado = 'Fechado' AND OLD.Estado != 'Fechado' THEN
                        SET NEW.Data_de_encerramento = CURDATE();
                    END IF;
                END $$
                DELIMITER ;
                
                -- Function:  Calcular Média Salarial por Função
                DELIMITER $$
                
                CREATE FUNCTION MediaSalarialPorFuncao(p_Função_ID INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
                BEGIN
                    DECLARE media_salarial DECIMAL(10, 2);
                    
                    SELECT AVG(Salário) INTO media_salarial
                    FROM Funcionário
                    WHERE Função_ID = p_Função_ID;
                    
                    RETURN media_salarial;
                END $$
                
                DELIMITER ;
                
                DELIMITER $$
                
                CREATE FUNCTION CalcularIdade(Data_de_nascimento DATE) 
                RETURNS INT DETERMINISTIC
                BEGIN
                    DECLARE idade INT;
                    
                    -- Calcula a idade considerando apenas o ano
                    SET idade = YEAR(CURDATE()) - YEAR(Data_de_nascimento);
                    
                    -- Ajusta a idade se o aniversário ainda não ocorreu este ano
                    IF (MONTH(CURDATE()) < MONTH(Data_de_nascimento)) OR 
                       (MONTH(CURDATE()) = MONTH(Data_de_nascimento) AND DAY(CURDATE()) < DAY(Data_de_nascimento)) THEN
                        SET idade = idade - 1;
                    END IF;
                
                    RETURN idade;
                END $$
                
                DELIMITER ;
                
                DELIMITER $$
                CREATE FUNCTION CalcularEstimativaDeRoubo(p_Terreno_ID INT) 
                RETURNS INT
                DETERMINISTIC
                BEGIN
                    DECLARE v_Estimativa_De_Roubo INT;
                
                    -- Obter o minério previsto e coletado para o terreno especificado
                    SELECT (Minério_previsto - Minério_coletado) INTO v_Estimativa_De_Roubo
                    FROM Terreno WHERE Terreno_ID = p_Terreno_ID;
                
                    RETURN v_Estimativa_De_Roubo;
                END $$
                DELIMITER ;
                
                -- CALL CriarCasoETornarSuspeitos(TERRENO_ID, CURDATE());
                DELIMITER $$
                CREATE PROCEDURE CriarCasoETornarSuspeitos(
                    IN p_Terreno_ID INT,
                    IN p_Data_de_abertura DATE
                )
                BEGIN
                    DECLARE v_Caso_ID INT;
                    DECLARE EXIT HANDLER FOR SQLEXCEPTION
                    BEGIN
                         -- Em caso de erro, reverter todas as operações	
                         ROLLBACK;
                    END;
                    
                    START TRANSACTION;
                    
                    -- Insere um novo caso
                    INSERT INTO Caso (Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID)
                    VALUES (p_Data_de_abertura, 'Aberto', CalcularEstimativaDeRoubo(p_Terreno_ID), NULL, p_Terreno_ID);
                    
                    -- Obter o último ID do caso inserido
                    SET v_Caso_ID = LAST_INSERT_ID();
                
                    -- Seleciona todos os funcionários que trabalham no terreno especificado
                    INSERT INTO Suspeito (Funcionário_ID, Caso_ID, Estado, Envolvimento, Notas)
                    SELECT t.Funcionário_ID, v_Caso_ID, 'Em Investigação', 3, 'Funcionário estava presente no terreno no dia do roubo'
                    FROM Trabalha t
                    WHERE t.Terreno_ID = p_Terreno_ID;
                
                    COMMIT;
                END $$
                
                DELIMITER ;
                ```
              )

    #attachment(caption: "Script de índices em SQL.",[])
              #block(
                fill: rgb("#f2f2eb"),
                inset: 8pt,
                breakable: true,
                ```sql
                -- Criação de um índice para a coluna Terreno_ID na tabela Caso
                CREATE INDEX index_caso_terreno_id ON Caso(Terreno_ID);
                
                -- Criação de um índice para a coluna Caso_ID na tabela Suspeito
                CREATE INDEX idx_suspeito_caso_id ON Suspeito(Caso_ID);
                
                -- Criação de um índice para a coluna Funcionário_ID na tabela Suspeito
                CREATE INDEX idx_suspeito_funcionario_id ON Suspeito(Funcionário_ID);
                ```
              )

    #attachment(caption: "Script de vistas da base de dados em SQL.",[])
              #block(
                fill: rgb("#f2f2eb"),
                inset: 8pt,
                breakable: true,
                ```sql
                -- View das informações dos funcionários e dos casos associados.
                CREATE VIEW FuncionariosEmCasos AS
                SELECT
                    Funcionário.Nome,
                    Número_de_telemóvel.Número_de_telemóvel_ID,
                    Caso.Caso_ID,
                    Caso.Data_de_abertura,
                    Caso.Estado,
                    Caso.Estimativa_de_roubo,
                    Caso.Data_de_encerramento,
                    Caso.Terreno_ID
                FROM
                    Funcionário
                INNER JOIN
                    Suspeito ON Funcionário.Funcionário_ID = Suspeito.Funcionário_ID
                INNER JOIN
                    Caso ON Suspeito.Caso_ID = Caso.Caso_ID
                LEFT JOIN
                    Número_de_telemóvel ON Funcionário.Funcionário_ID = Número_de_telemóvel.Funcionário_ID;
                
                -- View das informações dos funcionários e dos terrenos associados.
                CREATE VIEW FuncionariosEmTerrenos AS
                SELECT
                	Funcionário.Nome,
                    Função.Designação,
                	Número_de_telemóvel.Número_de_telemóvel_ID,
                	CalcularIdade(Funcionário.Data_de_nascimento) AS Idade,
                	Funcionário.Salário,
                	Terreno.Terreno_ID,
                	Terreno.Minério_previsto,
                	Terreno.Minério_coletado
                FROM
                	Funcionário
                INNER JOIN
                	Trabalha ON Funcionário.Funcionário_ID = Trabalha.Funcionário_ID
                INNER JOIN
                	Terreno ON Trabalha.Terreno_ID = Terreno.Terreno_ID
                INNER JOIN
                	Função ON Funcionário.Função_ID = Função.Função_ID
                LEFT JOIN
                	Número_de_telemóvel ON Funcionário.Funcionário_ID = Número_de_telemóvel.Funcionário_ID;
                ```
              )

    #attachment(caption: "Script de interrogações da base de dados em SQL.",[])
              #block(
                fill: rgb("#f2f2eb"),
                inset: 8pt,
                breakable: true,
                ```sql
                -- Definir variáveis para utilizar nas queries
                SET @Funcionario_ID = 3;
                SET @Caso_ID = 3;
                SET @Terreno_ID = 1;
                
                -- Listar o prejuízo de um terreno
                SELECT 
                    Terreno_ID, 
                    (Minério_previsto - Minério_coletado) AS Prejuízo
                FROM 
                    Terreno
                WHERE Terreno_ID = @Terreno_ID;
                
                -- Ver quando é que um funcionário se tornou suspeito de um determinado caso
                SELECT 
                    s.Funcionário_ID, 
                    s.Caso_ID, 
                    c.Data_de_abertura
                FROM 
                    Suspeito s
                INNER JOIN 
                    Caso c ON s.Caso_ID = c.Caso_ID
                WHERE 
                    s.Funcionário_ID = @Funcionario_ID 
                    AND s.Caso_ID = @Caso_ID;
                
                -- Listar os suspeitos de um determinado caso
                SELECT 
                    s.Funcionário_ID, 
                    f.Nome, 
                    s.Estado, 
                    s.Envolvimento, 
                    s.Notas
                FROM 
                    Suspeito s
                INNER JOIN 
                    Funcionário f ON s.Funcionário_ID = f.Funcionário_ID
                WHERE 
                    s.Caso_ID = @Caso_ID;
                
                -- Ver a data do último caso de um determinado funcionário
                SELECT 
                    c.Caso_ID, 
                    c.Data_de_abertura
                FROM 
                    Caso c
                INNER JOIN 
                    Suspeito s ON c.Caso_ID = s.Caso_ID
                WHERE 
                    s.Funcionário_ID = @Funcionario_ID
                ORDER BY 
                    c.Data_de_abertura DESC
                LIMIT 1;
                
                -- Listar os casos a que um determinado funcionário está associado
                SELECT 
                    c.Caso_ID, 
                    c.Data_de_abertura, 
                    c.Estado, 
                    c.Estimativa_de_roubo, 
                    c.Data_de_encerramento, 
                    c.Terreno_ID
                FROM 
                    Caso c
                INNER JOIN 
                    Suspeito s ON c.Caso_ID = s.Caso_ID
                WHERE 
                    s.Funcionário_ID = @Funcionario_ID;
                
                -- Ver o dia em que mais casos foram abertos
                SELECT 
                    Data_de_abertura, 
                    COUNT(*) AS Total_de_Casos
                FROM 
                    Caso
                GROUP BY 
                    Data_de_abertura
                ORDER BY 
                    Total_de_Casos DESC
                LIMIT 1;
                
                -- Listar os top 5 funcionários por quantidade de casos
                SELECT 
                    s.Funcionário_ID, 
                    f.Nome, 
                    COUNT(s.Caso_ID) AS Total_de_Casos
                FROM 
                    Suspeito s
                INNER JOIN 
                    Funcionário f ON s.Funcionário_ID = f.Funcionário_ID
                GROUP BY 
                    s.Funcionário_ID, f.Nome
                ORDER BY 
                    Total_de_Casos DESC
                LIMIT 5;
                ```
              )

]
