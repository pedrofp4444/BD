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

# Insere as funções na tabela Função
for i, funcao in enumerate(funcoes, start=1):
    cursor.execute("INSERT INTO Função (Função_ID, Designação) VALUES (%s, %s)", (i, funcao))

# Gera e insere dados fictícios para 100 funcionários na tabela Funcionario
for i in range(1, 101):
    nome = fake.name()
    data_nascimento = fake.date_of_birth(minimum_age=18, maximum_age=65)
    salario = random.randint(1000, 5000)
    nif = fake.random_number(digits=9)
    fotografia = fake.image_url()
    funcao_id = random.randint(1, len(funcoes))
    cursor.execute("INSERT INTO Funcionario (Funcionario_ID, Nome, Data_de_nascimento, Salário, NIF, Fotografia, Função_ID) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                   (i, nome, data_nascimento, salario, nif, fotografia, funcao_id))

# Gera e insere números de telefone sequenciais na tabela Número_de_telemoveL
for i in range(1, 101):
    num_telefone = 900000000 + i
    funcionario_id = i
    cursor.execute("INSERT INTO Número_de_telemoveL (Número_de_telemoveL_ID, Funcionario_ID) VALUES (%s, %s)", (num_telefone, funcionario_id))

# Gera e insere dados de gestão aleatória na tabela Gere
for i in range(1, 51):
    funcionario_gestor_id = i
    funcionario_id = random.randint(1, 100)
    cursor.execute("INSERT INTO Gere (Funcionario_Gestor_ID, Funcionario_ID) VALUES (%s, %s)", (funcionario_gestor_id, funcionario_id))

# Gera e insere dados fictícios para 20 terrenos na tabela Terreno
for i in range(1, 21):
    minério_previsto = random.randint(1000, 10000)
    minério_coletado = random.randint(0, minério_previsto)
    cursor.execute("INSERT INTO Terreno (Terreno_ID, Minério_previsto, Minério_coletado) VALUES (%s, %s, %s)", (i, minério_previsto, minério_coletado))

# Gera e insere dados de trabalho na tabela Trabalha
for i in range(1, 101):
    funcionario_id = i
    terreno_id = random.randint(1, 20)
    cursor.execute("INSERT INTO Trabalha (Funcionario_ID, Terreno_ID) VALUES (%s, %s)", (funcionario_id, terreno_id))

# Gera e insere dados fictícios para 50 casos na tabela Caso
for i in range(1, 51):
    data_abertura = fake.date_between(start_date='-1y', end_date='today')
    estado = random.choice(['Aberto', 'Fechado'])
    estimativa_roubo = random.randint(1000, 100000)
    data_encerramento = data_abertura + timedelta(days=random.randint(10, 365)) if estado == 'Fechado' else None
    terreno_id = random.randint(1, 20)
    cursor.execute("INSERT INTO Caso (Caso_ID, Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID) VALUES (%s, %s, %s, %s, %s, %s)",
                   (i, data_abertura, estado, estimativa_roubo, data_encerramento, terreno_id))

# Gera e insere dados fictícios de suspeitos na tabela Suspeito
for i in range(1, 101):
    funcionario_id = i
    caso_id = random.randint(1, 50)
    estado = random.choice(['Inocente', 'Em investigação', 'Culpado'])
    envolvimento = random.randint(1, 10)
    notas = fake.text()
    cursor.execute("INSERT INTO Suspeito (Funcionario_ID, Caso_ID, Estado, Envolvimento, Notas) VALUES (%s, %s, %s, %s, %s)",
                   (funcionario_id, caso_id, estado, envolvimento, notas))

# Confirma todas as transações e fecha a conexão com a base de dados
conn.commit()
conn.close()