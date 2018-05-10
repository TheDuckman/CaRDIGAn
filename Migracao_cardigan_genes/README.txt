##################################################
PROCEDIMENTO PARA MIGRAÇÃO DE DADOS DO BD CARDIGAN
##################################################

1)	Criação do banco no PostgreSQL
----------------------------------
	- O primeiro passo é criar o banco de dados usando o script "Cria_bd_e_popula_genes_e_coordenadas.sql" que contem os comandos para criação das tabelas. É necessário substituir os parâmetros <USUARIO> pelo nome do usuario que está logado no PostgreSQL, <NOME_DO_BD> pelo nome que se pretende dar ao banco e <PATH_PARA_ESTRUTURA_BD_CARDIGAN> pelo caminho até o arquivo nomeado "Estrutura_cardigan_2018-05-03.sql". 
	- A seguir, basta executar o arquivo "Cria_bd_e_popula_genes_e_coordenadas.sql" dentro do PostgreSQL.
	
		$ \i <PATH>/Cria_bd_e_popula_genes_e_coordenadas.sql

	- Além de criar o banco, as tabelas 'gene', 'gene_nomeia_coordenada' e 'coordenada_gene' serão populadas com alguns dados a partir de 3 arquivos: "popula_gene_200_coords.tsv", "popula_coordenada_gene_200_coords.tsv" e "popula_gene_nomeia_coordenada_200_coords.tsv". Os dados incluidos são referentes a 200 coordenadas de genes, 100 de cada montagem disponível (37 e 38).
	
2)	Criando tabelas novas
-------------------------
	- O arquivo "create_tables_alteracao_cardigan_para_mapeamento_de_genes.sql" coontem comandos para ajustes das tabelas antigas e criação das tabelas novas.
	- Basta executá-lo dentro do PostgreSQL no banco criado no item 1.
	
	
2)	Migrando estrutura antiga dos genes e coordenadas para nova versão
----------------------------------------------------------------------
	- Usando python3 e a lib psycopg2 para conexão com o PostgreSQL, o script "mapeamento_generef_e_genealias.py" mapeia os dados da estrutura antiga para as novas tabelas criadas no item 2).
	- No inicio do script, o nome do usuário e nome do banco devem ser substituídos corretamente para que seja feita a conexão.
