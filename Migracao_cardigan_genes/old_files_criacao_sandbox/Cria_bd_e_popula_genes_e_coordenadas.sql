\c <USUARIO>
DROP DATABASE <NOME_DO_BD>;
CREATE DATABASE <NOME_DO_BD>;
\c <NOME_DO_BD>;

\i <PATH_PARA_ESTRUTURA_BD_CARDIGAN> --/home/ester/GDrive/BD/artigo_CaRDIGAn/sandbox/backup_sandbox_2018.05.03_estrutura.sql

\c <USUARIO>
\c <NOME_DO_BD>;

-- Populando as tabelas BASE (MODELOS GENICOS)
\copy gene from dados_totais_para_dump/gene_total.tsv
\copy coordenada_gene from dados_totais_para_dump/coordenada_gene_total.tsv
\copy gene_nomeia_coordenada from dados_totais_para_dump/gene_nomeia_coordenada_total.tsv
-- Populando as tabelas "CLINICAS"
\copy paciente FROM dados_totais_para_dump/popula_paciente_total.tsv
\copy especime FROM dados_totais_para_dump/popula_especime_total.tsv
\copy amostra FROM dados_totais_para_dump/popula_amostra_total.tsv
-- Populando as tabelas DE EXPERIMENTOS DE MUTAÇÃO (APENAS PARCIAL - MTO GRANDES)
\copy experimento_de_mutacao_somatica FROM old_files_popular_sandbox/popula_experimento_de_mutacao_somatica_200_coords_TOTAL.tsv
\copy mutacao_simples_avalia_gene_em_amostra FROM old_files_popular_sandbox/popula_mutacao_simples_avalia_gene_em_amostra_200_coords.tsv
-- Populando as tabelas DE EXPERIMENTOS DE EXPRESSÃO (APENAS PARCIAL - MTO GRANDES)
\copy experimento_de_expressao_genica FROM popula_experimento_de_expressao_genica.tsv
\copy sequenciamento_avalia_gene_em_amostra FROM popula_sequenciamento_avalia_gene_em_amostra_50genes.tsv
