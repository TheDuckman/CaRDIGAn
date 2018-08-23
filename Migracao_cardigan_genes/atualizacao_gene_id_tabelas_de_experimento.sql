-- Sequenciamento
ALTER TABLE sequenciamento_avalia_gene_em_amostra
  ADD COLUMN id_gene_ref INTEGER,
  ADD FOREIGN KEY(id_gene_ref) REFERENCES gene_referencia(id_gene_ref);

-- UPDATE sequenciamento_avalia_gene_em_amostra SET id_gene_ref = gr.id_gene_ref
-- FROM gene_referencia gr, sequenciamento_avalia_gene_em_amostra s
-- WHERE gr.old_id = s.id_gene
-- ;

-- UPDATE sequenciamento_avalia_gene_em_amostra SET id_gene_ref = ga.id_gene_ref
-- FROM gene_alias ga, sequenciamento_avalia_gene_em_amostra s
-- WHERE ga.old_id = s.id_gene
-- ;

-- Mutação
ALTER TABLE mutacao_simples_avalia_gene_em_amostra
  ADD COLUMN id_gene_ref INTEGER,
  ADD FOREIGN KEY(id_gene_ref) REFERENCES gene_referencia(id_gene_ref);

-- UPDATE mutacao_simples_avalia_gene_em_amostra SET id_gene_ref = gr.id_gene_ref
-- FROM gene_referencia gr, mutacao_simples_avalia_gene_em_amostra m
-- WHERE gr.old_id = m.id_gene
-- ;

-- UPDATE mutacao_simples_avalia_gene_em_amostra SET id_gene_ref = ga.id_gene_ref
-- FROM gene_alias ga, mutacao_simples_avalia_gene_em_amostra m
-- WHERE ga.old_id = m.id_gene
-- ;
