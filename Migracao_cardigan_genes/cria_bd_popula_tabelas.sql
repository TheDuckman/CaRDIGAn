CREATE DATABASE auxiliar;
\c auxiliar
DROP DATABASE cdg;
CREATE DATABASE cdg;
\c cdg;
DROP DATABASE auxiliar;

\i Migracao_cardigan_genes/arquivos_de_dump_total/dump_SCHEMA_cardigan.sql
\i Migracao_cardigan_genes/arquivos_de_dump_total/dump_DADOS_banco_de_anotacao.sql
\i Migracao_cardigan_genes/arquivos_de_dump_total/dump_DADOS_gene_ref.sql
\i Migracao_cardigan_genes/arquivos_de_dump_total/dump_DADOS_gene_alias.sql
\i Migracao_cardigan_genes/arquivos_de_dump_total/dump_DADOS_coordenada_gene.sql


-- Populando as tabelas "CLINICAS"
\copy paciente FROM Migracao_cardigan_genes/arquivos_de_dump_total/popula_paciente_total.tsv
\copy especime FROM Migracao_cardigan_genes/arquivos_de_dump_total/popula_especime_total.tsv
\copy amostra FROM Migracao_cardigan_genes/arquivos_de_dump_total/popula_amostra_total.tsv

-- Populando as tabelas DE EXPERIMENTOS DE MUTAÇÃO TOTAL
\copy experimento_de_mutacao_somatica FROM Migracao_cardigan_genes/arquivos_de_dump_total/popula_experimento_de_mutacao_somatica_total.tsv
-- Populando as tabelas DE EXPERIMENTOS DE MUTAÇÃO (APENAS PARCIAL - MTO GRANDES)
\copy mutacao_simples_avalia_gene_em_amostra FROM Migracao_cardigan_genes/arquivos_de_dump_parcial/popula_mutacao_simples_avalia_gene_em_amostra_200_coords.tsv

-- Populando as tabelas DE EXPERIMENTOS DE EXPRESSÃO TOTAL
\copy experimento_de_expressao_genica FROM Migracao_cardigan_genes/arquivos_de_dump_total/popula_experimento_de_expressao_genica_total.tsv
-- Populando as tabelas DE EXPERIMENTOS DE EXPRESSÃO (APENAS PARCIAL - MTO GRANDES)
\copy sequenciamento_avalia_gene_em_amostra FROM Migracao_cardigan_genes/arquivos_de_dump_parcial/popula_sequenciamento_avalia_gene_em_amostra_50genes.tsv

-- SCRIPT PARA ALTERAÇÃO DE ESTRUTURA DAS TABELAS DE EXPERIMENTO - ADAPTAÇÃO AO NOVO SISTEMA DE GENE REFERENCIA
\i Migracao_cardigan_genes/atualizacao_gene_id_tabelas_de_experimento.sql
