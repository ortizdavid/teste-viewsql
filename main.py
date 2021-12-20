from funcoes import *


funcionarios = listar_funcionarios()
print("===== TODOS OS FUNCIONÁRIOS =========================================================================================")
print("ID\tNome\t\tSexo\t\t\tIdentificação\t\tContactos\t\tCargo")
print("=====================================================================================================================")
for fun in funcionarios:
    print("{}\t{}\t\t{}\t\t{}\t\t{}\t\t{}".format(fun[0], fun[1], fun[2], fun[3], fun[4], fun[6]))
print('\n\n')

id = 2
fun = obter_funcionario(id)
print("===== OBTER FUNCIONÁRIO COM id {} ===================================================================================".format(id))
print("ID\tNome\t\tSexo\t\t\tIdentificação\t\tContactos\t\tCargo")
print("=====================================================================================================================")
print("{}\t{}\t\t{}\t\t{}\t\t{}\t\t{}".format(fun[0], fun[1], fun[2], fun[3], fun[4], fun[6]))
print('\n\n')

param = "An"
funcionarios = buscar_funcionarios(param)
print("===== BUSCA DE FUNCIONÁRIOS com '{}' ================================================================================".format(param))
print("ID\tNome\t\tSexo\t\t\tIdentificação\t\tContactos\t\tCargo")
print("=====================================================================================================================")
for fun in funcionarios:
    print("{}\t{}\t\t{}\t\t{}\t\t{}\t\t{}".format(fun[0], fun[1], fun[2], fun[3], fun[4], fun[6]))
