import mysql.connector
from faker import Faker
import random
from datetime import datetime, timedelta

host = input("Insira o endereço do host da base de dados MySQL (geralmente 'localhost'): ")
user = input("Insira o nome de utilizador da base de dados MySQL: ")
password = input("Insira a senha da base de dados MySQL: ")

conn = mysql.connector.connect(
    host=host,
    user=user,
    password=password,
    database="Lusium"
)
cursor = conn.cursor()

fake = Faker('pt_PT')

funcoes = ['Operacional', 'Detetive', 'Representante']

for i, funcao in enumerate(funcoes, start=1):
    cursor.execute("INSERT INTO Função (Função_ID, Designação) VALUES (%s, %s)", (i, funcao))

for i in range(1, 101):
    nome = fake.name()
    data_nascimento = fake.date_of_birth(minimum_age=18, maximum_age=65)
    salario = random.randint(1000, 5000)
    nif = fake.random_number(digits=9)
    fotografia = fake.image_url()
    funcao_id = random.randint(1, len(funcoes))
    cursor.execute("INSERT INTO Funcionario (Funcionario_ID, Nome, Data_de_nascimento, Salário, NIF, Fotografia, Função_ID) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                   (i, nome, data_nascimento, salario, nif, fotografia, funcao_id))

for i in range(1, 101):
    num_telefone = fake.phone_number()
    funcionario_id = random.randint(1, 100)
    cursor.execute("INSERT INTO Número_de_telemoveL (Número_de_telemoveL_ID, Funcionario_ID) VALUES (%s, %s)", (num_telefone, funcionario_id))

for i in range(1, 51):
    funcionario_gestor_id = i
    funcionario_id = random.randint(1, 100)
    cursor.execute("INSERT INTO Gere (Funcionario_Gestor_ID, Funcionario_ID) VALUES (%s, %s)", (funcionario_gestor_id, funcionario_id))

for i in range(1, 21):
    minério_previsto = random.randint(1000, 10000)
    minério_coletado = random.randint(0, minério_previsto)
    cursor.execute("INSERT INTO Terreno (Terreno_ID, Minério_previsto, Minério_coletado) VALUES (%s, %s, %s)", (i, minério_previsto, minério_coletado))

for i in range(1, 101):
    funcionario_id = i
    terreno_id = random.randint(1, 20)
    cursor.execute("INSERT INTO Trabalha (Funcionario_ID, Terreno_ID) VALUES (%s, %s)", (funcionario_id, terreno_id))

for i in range(1, 51):
    data_abertura = fake.date_between(start_date='-1y', end_date='today')
    estado = random.choice(['Aberto', 'Fechado'])
    estimativa_roubo = random.randint(1000, 100000)
    data_encerramento = data_abertura + timedelta(days=random.randint(10, 365)) if estado == 'Fechado' else None
    terreno_id = random.randint(1, 20)
    cursor.execute("INSERT INTO Caso (Caso_ID, Data_de_abertura, Estado, Estimativa_de_roubo, Data_de_encerramento, Terreno_ID) VALUES (%s, %s, %s, %s, %s, %s)",
                   (i, data_abertura, estado, estimativa_roubo, data_encerramento, terreno_id))

for i in range(1, 101):
    funcionario_id = i
    caso_id = random.randint(1, 50)
    estado = random.choice(['Inocente', 'Em investigação', 'Culpado'])
    envolvimento = random.randint(1, 10)
    notas = fake.text()
    cursor.execute("INSERT INTO Suspeito (Funcionario_ID, Caso_ID, Estado, Envolvimento, Notas) VALUES (%s, %s, %s, %s, %s)",
                   (funcionario_id, caso_id, estado, envolvimento, notas))

conn.commit()
conn.close()