-- Index das tabelas com nomes de genes
create index id_gene_ref_idx on gene_referencia (id_gene_ref);
create index old_id_idx on gene_referencia (old_id);

create index old_id_idx on gene_alias (old_id);
create index id_gene_ref_idx on gene_alias (id_gene_ref);

-- Sequenciamento
ALTER TABLE sequenciamento_avalia_gene_em_amostra 
    --ADD COLUMN id_gene_ref INTEGER,
    ADD COLUMN chave_serial BIGSERIAL;

-- Criando os Indexes das colunas de dados de Sequenciamento que serão utilizadas
create index chave_serial_idx on sequenciamento_avalia_gene_em_amostra (chave_serial);
create index id_gene_idx on sequenciamento_avalia_gene_em_amostra (id_gene);

-- "UPDATE sequenciamento_avalia_gene_em_amostra s SET id_gene_ref = (select gr.id_gene_ref FROM gene_referencia gr WHERE gr.old_id = s.id_gene) WHERE chave_serial >= 9000 AND chave_serial < 10000 ;" 
\i Migracao_cardigan_genes/updates_gene_ref_sequenciamento_avalia_gene_em_amostra.sql

UPDATE sequenciamento_avalia_gene_em_amostra SET id_gene_ref = ga.id_gene_ref
FROM gene_alias ga, sequenciamento_avalia_gene_em_amostra s
WHERE ga.old_id = s.id_gene;

ALTER TABLE sequenciamento_avalia_gene_em_amostra ADD FOREIGN KEY(id_gene_ref) REFERENCES gene_referencia(id_gene_ref);
ALTER TABLE sequenciamento_avalia_gene_em_amostra DROP CONSTRAINT sequenciamento_avalia_gene_em_amostra_id_gene_fkey;

---- Mutação
--ALTER TABLE mutacao_simples_avalia_gene_em_amostra 
--    ADD COLUMN id_gene_ref INTEGER,
--    ADD COLUMN chave_serial BIGSERIAL;
--
---- Criando os Indexes das colunas que serão utilizadas
--create index chave_serial_idx on mutacao_simples_avalia_gene_em_amostra (chave_serial);
--create index id_gene_idx on mutacao_simples_avalia_gene_em_amostra (id_gene);
--
--UPDATE mutacao_simples_avalia_gene_em_amostra SET id_gene_ref = gr.id_gene_ref
--FROM gene_referencia gr, mutacao_simples_avalia_gene_em_amostra m
--WHERE gr.old_id = m.id_gene;
--
--UPDATE mutacao_simples_avalia_gene_em_amostra SET id_gene_ref = ga.id_gene_ref
--FROM gene_alias ga, mutacao_simples_avalia_gene_em_amostra m
--WHERE ga.old_id = m.id_gene;
--
--ALTER TABLE mutacao_simples_avalia_gene_em_amostra ADD FOREIGN KEY(id_gene_ref) REFERENCES gene_referencia(id_gene_ref);
--ALTER TABLE mutacao_simples_avalia_gene_em_amostra DROP CONSTRAINT mutacao_simples_avalia_gene_em_amostra_id_gene_fkey;
