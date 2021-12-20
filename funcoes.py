import mysql.connector

db = mysql.connector.connect(
    host="localhost", 
    user="root", 
    password="003334743LA032",
    database="teste_views"
)
stmt = db.cursor()

# função para listar todos os funcionários
def listar_funcionarios():
   sql = "SELECT * FROM view_dados_funcionario ORDER BY nome;"
   stmt.execute(sql)
   return stmt.fetchall()

#função para obter todos os dados de um funcionário
def obter_funcionario(id):
    sql = "SELECT * FROM view_dados_funcionario WHERE id = {}".format(id)
    stmt.execute(sql)
    return stmt.fetchone()

#função para buscar funcionários de acordo ao parámetro (nome, identficação, telefone ou email)
def buscar_funcionarios(param):
    sql = "SELECT * FROM view_dados_funcionario "\
          "WHERE nome LIKE '%{}%' "\
            "OR num_identificacao LIKE '%{}%' "\
            "OR telefone LIKE '%{}%' ".format(param, param, param)
    stmt.execute(sql)
    return stmt.fetchall()
