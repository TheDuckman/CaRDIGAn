\c <USUARIO>
DROP DATABASE <NOME_DO_BD>;
CREATE DATABASE <NOME_DO_BD>;
\c <NOME_DO_BD>;

\i <PATH_PARA_ESTRUTURA_BD_CARDIGAN> --/home/ester/GDrive/BD/artigo_CaRDIGAn/sandbox/backup_sandbox_2018.05.03_estrutura.sql

\c <USUARIO>
\c <NOME_DO_BD>;

-- Populando as tabelas gene, coordenada_gene e gene_nomeia_coordenada com dados para teste
\copy gene from popula_gene_200_coords.tsv
\copy coordenada_gene from popula_coordenada_gene_200_coords.tsv
\copy gene_nomeia_coordenada from popula_gene_nomeia_coordenada_200_coords.tsv

\copy paciente FROM popula_paciente_200_coords_TOTAL.tsv
\copy especime FROM popula_especime_200_coords_TOTAL.tsv
\copy amostra FROM popula_amostra_200_coords_TOTAL.tsv

\copy experimento_de_mutacao_somatica FROM popula_experimento_de_mutacao_somatica_200_coords_TOTAL.tsv
\copy mutacao_simples_avalia_gene_em_amostra FROM popula_mutacao_simples_avalia_gene_em_amostra_200_coords.tsv



