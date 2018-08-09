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
#	1			3			4		2
#[MIRBASE, GENE SYMBOL, ENSEMBL, HGNC]
prioridade_bancos = [4, 3, 1, 2]
# Primeiro ID da tabela de genes de referencia
gene_referencia_id = 1
gene_alias_id = 1

#CHAVE AQUI VAI SER O NOME DO GENE - VALOR SERA A TUPLA [NOME, BANCO_ID, GENE_ID (no novo banco)]
dict_referencia = {}
dict_alias = {}

# FLAG PRA DETERMINAR OS PRINTS DO SCRIPT
debug_lvl = 0

################################
### LIDA COM CADA COORDENADA ###
################################
list_queries = []
for coordenada in coordenadas:
	id_coord = coordenada[0]

	#busca todos os 'join' entre cada coordenada e os vários nomes de gene
	cursor.execute("""SELECT DISTINCT g.*, gnc.id_coordenada FROM gene g, gene_nomeia_coordenada gnc WHERE g.id_gene = gnc.id_gene AND gnc.id_coordenada = {}""".format(id_coord))
	genes_coord = cursor.fetchall()
	gene_ref = None
	gene_alias = []

	# Dado uma coordenada, avaliar cada linha do join entre gene e gene_nomeia_coordenada
	################################
	for gene_coord in genes_coord:
		id_gene_original = gene_coord[0]
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
			gene_ref = [nome, id_banco, id_gene_original]
			if (debug_lvl > 2):
				print ("\t\t++++Guardando a ref:\tnome: {}\tbanco: {} id: {}".format(nome, id_banco, id_gene_original))
		else:
			# Demais coordenadas, selecionando gene de ref a partir da prioridade de anotação do banco
			# Se o gene é "mais prioritário", substituir o antigo e joga o antigo para o alias
			if prioridade_bancos.index(id_banco) < prioridade_bancos.index(gene_ref[1]):
				if (debug_lvl > 2):
					print ("\t\t\t----Trocando a ref:\t{}\tpor\t{}\t{}".format(gene_ref[1], id_banco, id_gene_original))
				gene_alias.append(gene_ref)
				gene_ref = [nome, id_banco, id_gene_original]
			else:
				if (debug_lvl > 2):
					print ("\t\t\tAdicionando alias: {}\t{}\t{}".format(nome, id_banco,id_gene_original))
				gene_alias.append([nome, id_banco, id_gene_original])

	#####################################
	### AJUSTE DE REFERENCIA E ALIAS ###
	#####################################
	# Estrutura do dict_referencia:
	# [  [nome, bco_id, id_gene_original, gene_ref_id],  [nome, bco_id, id_gene_original, gene_ref_id], ... ]
	#
	# Estrutura do dict_alias:
	#
	# [  [nome, bco_id, id_gene_original, gene_alias_id, ref_id, ref_nome, ref_id_gene_original],  ...  ]
	gene_ref_tbl = "gene_referencia"
	gene_alias_tbl = "gene_alias"

	gref_idbanco = gene_ref[1]
	gref_nome = gene_ref[0]
	gref_id_original = gene_ref[2]
	"""referencia da coord atual é alias de alguma outra coord (caso 5, 6)"""
	if gref_nome in dict_alias:
		print("\t##CASO 5, 6 [coord {}]".format(id_coord))
		ref_existente_nome = dict_alias[gref_nome][5]
		ref_existente_bco_id = dict_referencia[ref_existente_nome][1]
		ref_existente_id_gene_original = dict_alias[gref_nome][2]
		gene_ref[0] = ref_existente_nome
		gene_ref[1] = ref_existente_bco_id
		gene_ref[2] = ref_existente_id_gene_original
	elif gref_nome not in dict_referencia:
		for ind, coord_alias in enumerate(gene_alias):
			nome_alias_atual = coord_alias[0]
			"""o ref nao existe ainda e um dos alias é referencia (caso 4)"""
			if nome_alias_atual in dict_referencia:
				print("\t##CASO 4 [coord {}]".format(id_coord))
				grefold_id = dict_referencia[nome_alias_atual][3]
				dict_referencia.pop(nome_alias_atual)
				dict_referencia[gref_nome] = [gref_nome, gref_idbanco, gref_id_original, grefold_id]
				for al in dict_alias: #[nome, bco_id, id_gene_original, gene_alias_id, ref_id, ref_nome, ref_id_gene_original]
					if dict_alias[al][5] == nome_alias_atual:
						dict_alias[al][5] = gref_nome
						dict_alias[al][6] = gref_id_original
				list_queries.append("UPDATE {} SET nome = '{}', id_banco = {}, old_id = {} WHERE id_gene_ref = {};".format(gene_ref_tbl, gref_nome, gref_idbanco, gref_id_original, grefold_id))
				#substitui os dados do "coord_alias", que foram incluidos na tabela de referencia, com os dados do gene_ref
				"""o alias já existe, mas a referência ainda não (casos 7 e 8)"""
				"""PRECISAMOS LEVAR EM CONTA CASOS ONDE EXISTEM IDS DE BANCO IGUAIS -> USAR NUM_MONTAGEM PRA DESEMPATE"""
			elif nome_alias_atual in dict_alias:#[nome, bco_id, id_gene_original, gene_alias_id, ref_id, ref_nome, ref_id_gene_original]
				print("\t##CASOS 7, 8 [coord {}]".format(id_coord))
				#nome da ref antiga
				grefold_nome = dict_alias[nome_alias_atual][5]
				grefold_id = dict_alias[nome_alias_atual][4]
				grefold_gene_original_id = dict_alias[nome_alias_atual][6]
				grefold_idbanco = dict_referencia[grefold_nome][1]

				#index menor -> maior prioridade!!
				if prioridade_bancos.index(gref_idbanco) <= prioridade_bancos.index(grefold_idbanco) and grefold_nome != gref_nome:
					#se o Gref ganhou(ou empate), SALVA O GrefOld NOS ALIAS PRA SER INCLUIDO MAIS TARDE
					gene_alias.append([grefold_nome, grefold_idbanco, grefold_gene_original_id])
					dict_referencia.pop(grefold_nome)
					for al in dict_alias: #[nome, bco_id, id_gene_original, gene_alias_id, ref_id, ref_nome, ref_id_gene_original]
						if dict_alias[al][5] == grefold_nome:
							dict_alias[al][5] = gref_nome
							dict_alias[al][6] = gref_id_original
					# ATUALIZA OS DADOS DO BANCO COM AS INFOS DO gene_ref
					list_queries.append("UPDATE {} SET nome = '{}', id_banco = {}, old_id = {} WHERE id_gene_ref = {};".format(gene_ref_tbl, gref_nome, gref_idbanco, gref_id_original, grefold_id))
					dict_referencia[gref_nome] = [gref_nome, gref_idbanco, gref_id_original, grefold_id]
				elif prioridade_bancos.index(gref_idbanco) > prioridade_bancos.index(grefold_idbanco):
					#se o GrefOld ganhou, Gref PASSA A SER ALIAS E É INCLUSO NO DICT
					gene_alias.append([gref_nome, gref_idbanco, gref_id_original])
					# GENE REF PASSA A SER O OLD
					gene_ref = [grefold_nome, grefold_idbanco, grefold_gene_original_id]
					# dict_referencia[grefold_nome] = [grefold_nome, grefold_idbanco, grefold_id]
	##########################################
	### VERIFICA CONFLITOS E MONTA QUERIES ###
	##########################################
	# list_queries = []

	if gene_ref[0] not in dict_referencia:
		gene_ref.append(gene_referencia_id) #[nome, bco_id, id_gene_original, gene_ref_id]
		dict_referencia[gene_ref[0]] = gene_ref
		list_queries.append("INSERT INTO {} (id_gene_ref, nome, id_banco, old_id) VALUES ({},  '{}', {}, {});".format(gene_ref_tbl, gene_referencia_id, gene_ref[0], gene_ref[1], gene_ref[2]))
		ref_id_da_coordenada = gene_referencia_id
		gene_referencia_id += 1
		nome_ref = gene_ref[0]
		ref_id_gene_original = gene_ref[2]
	else:
		ref_id_da_coordenada = dict_referencia[gene_ref[0]][3]#[nome, bco_id, id_gene_original, gene_ref_id]
		nome_ref = dict_referencia[gene_ref[0]][0]
		ref_id_gene_original = dict_referencia[gene_ref[0]][2]

	list_queries.append("UPDATE coordenada_gene SET id_gene_ref = {} WHERE coordenada_gene.id_coordenada = {};".format(ref_id_da_coordenada, id_coord))

	for alias in gene_alias:
		if alias[0] not in dict_alias:
			alias.append(gene_alias_id)
			alias.append(ref_id_da_coordenada)
			alias.append(nome_ref)
			alias.append(ref_id_gene_original)
			dict_alias[alias[0]] = alias #[nome, bco_id, id_gene_original, gene_alias_id, ref_id, ref_nome, ref_id_gene_original]
			list_queries.append("INSERT INTO {} (id_gene_alias, id_gene_ref, nome, id_banco, old_id) VALUES ({}, {}, '{}', {}, {});".format(gene_alias_tbl, gene_alias_id, ref_id_da_coordenada, alias[0], alias[1], alias[2]))
			gene_alias_id += 1

	if (debug_lvl > 0):
		print("QUERIES GERADAS PELO SCRIPT PARA COORDENADA "+str(id_coord))
		print("Numero de genes ref: {}".format(len(dict_referencia)))
		print("##########################################################")
		print('\n');
	if (debug_lvl > 1):
		print ("--------> Final ref:\t {}\n--------> Final alias:\t{}".format(gene_ref, gene_alias))
	if id_coord %1000 == 0:
		print("[COORDENADA {}]".format(id_coord))



print("\t\t##### RODANDO QUERIES #####")
for ind, qry in enumerate(list_queries):
	cursor.execute(qry)
	if ind%100 == 0:
		conn.commit()
conn.commit()
print("\t\t##### FIM #####")
