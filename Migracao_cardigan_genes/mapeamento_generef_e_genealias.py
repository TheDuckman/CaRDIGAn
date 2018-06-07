import psycopg2

try:
	connect_str = "dbname='cardigan' user='pato' host='localhost' password='pato'"
	# use our connection values to establish a connection
	conn = psycopg2.connect(connect_str)
	# create a psycopg2 cursor that can execute queries
	cursor = conn.cursor()
except Exception as e:
	print("Uh oh, can't connect. Invalid dbname, user or password?")
	print(e)


# Busca todas as coordenadas_gene do BD
cursor.execute("""SELECT * from coordenada_gene""")
coordenadas = cursor.fetchall()

# Lista com ids dos bancos ordenados de acordo com critério de prioridade para seleção
#do nome referência para os genes
prioridade_bancos = [4, 3, 1, 2]
# Primeiro ID da tabela de genes de referencia
gene_referencia_id = 1

# FLAG PRA DETERMINAR OS PRINTS DO SCRIPT
debug_lvl = 1

for coordenada in coordenadas:
	id_coord = coordenada[0]

	#busca todos os 'join' entre cada coordenada e os vários nomes de gene
	cursor.execute("""SELECT g.*, gnc.id_coordenada FROM gene g, gene_nomeia_coordenada gnc WHERE g.id_gene = gnc.id_gene AND gnc.id_coordenada = {}""".format(id_coord))
	genes_coord = cursor.fetchall()
	gene_ref = None
	gene_alias = []

	# Dado uma coordenada, avaliar cada linha do join entre gene e gene_nomeia_coordenada
	#print ("Lista de tuplas:\t{}".format(genes_coord))
	for gene_coord in genes_coord:
		id_gene = gene_coord[0]
		nome = gene_coord[1]
		id_banco = gene_coord[2]
		id_c = gene_coord[3]
		if (debug_lvl > 1):
			print ("\tTupla:\t{}".format(gene_coord))

		if not nome:
			# se o nome do gene estiver vazio, nao inclui
			if (debug_lvl > 2):
				print ("\t###EXCLUINDO!###")
			continue
		if not gene_ref:
			# caso seja o primeiro nome de gene para a coordenada
			gene_ref = [nome, id_banco]
			if (debug_lvl > 2):
				print ("\t\t++++Guardando a ref:\tnome: {}\tbanco: {}".format(nome, id_banco))
		else:
			# Demais coordenadas, selecionando gene de ref a partir da prioridade de anotação do banco
			# Se o gene é "mais prioritário", substituir o antigo e joga o antigo para o alias
			if prioridade_bancos.index(id_banco) < prioridade_bancos.index(gene_ref[1]):
				if (debug_lvl > 2):
					print ("\t\t\t----Trocando a ref:\t{}\tpor\t{}".format(gene_ref[1], id_banco))
				gene_alias.append(gene_ref)
				gene_ref = [nome, id_banco]
			else:
				if (debug_lvl > 2):
					print ("\t\t\tAdicionando alias: {}\t{}".format(nome, id_banco))
				gene_alias.append([nome, id_banco])
		# QUERIES PRA INSERIR OS DADOS NAS NOVAS TABELAS
		gene_ref_tbl = "gene_referencia"
		gene_alias_tbl = "gene_alias"
		#insere novo gene referencia
		qry_1 = "INSERT INTO "+ gene_ref_tbl +" (nome, id_banco) VALUES ('"+gene_ref[0]+"', "+str(gene_ref[1])+");"
		#seta o id do gene referencia na tabela de coordenadas
		qry_2 = "UPDATE coordenada_gene SET id_gene_ref = "+str(gene_referencia_id)+" WHERE coordenada_gene.id_coordenada = "+str(id_coord)+";"
		#cria entradas dos alias na tabela de alias dos genes
		qry_3 = ""
		for alias in gene_alias:
			qry_3 = qry_3+"INSERT INTO "+ gene_alias_tbl +" (id_gene_ref, nome, id_banco) VALUES ("+str(gene_referencia_id)+", '"+alias[0]+"', "+str(alias[1])+");\n"
		gene_referencia_id += 1
		# cursor.execute(qry_1)
		#conn.commit()
		# cursor.execute(qry_2)
		#conn.commit()
		# if (qry_3):
			# cursor.execute(qry_3)
		# conn.commit()
	if (debug_lvl > 0):
		print("QUERIES GERADAS PELO SCRIPT PARA COORDENADA "+str(id_coord))
		print("##########################################################")
		print(qry_1)
		print(qry_2)
		print(qry_3)
		print('\n');
		input("PRESS KEY...")
	if (debug_lvl > 1):
		print ("--------> Final ref:\t {}\n--------> Final alias:\t{}".format(gene_ref, gene_alias))
