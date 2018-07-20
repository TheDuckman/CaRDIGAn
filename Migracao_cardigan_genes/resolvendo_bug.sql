select * from gene g, coordenada_gene c, gene_nomeia_coordenada n 
    where nome_no_banco = 'HNRNPCP5' 
    and g.id_gene = n.id_gene 
    and c.id_coordenada = n.id_coordenada
;

id_gene
118353

id_coordenada
587
