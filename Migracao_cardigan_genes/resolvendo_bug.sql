select g.*, c. from gene g, coordenada_gene c, gene_nomeia_coordenada n 
    --where nome_no_banco = 'HNRNPCP5' 
    where c.id_coordenada in (587, 64262)
    and g.id_gene = n.id_gene 
    and c.id_coordenada = n.id_coordenada
;

id_gene
118353

id_coordenada
587


\copy (select distinct(n.*) from gene g, coordenada_gene c, gene_nomeia_coordenada n  where c.id_coordenada in (587, 64262)     and g.id_gene = n.id_gene      and c.id_coordenada = n.id_coordenada ) to /home/ester/bugbox_nomeia_coordenadas.tsv csv delimiter e'\t'
\copy (select distinct(c.*) from gene g, coordenada_gene c, gene_nomeia_coordenada n  where c.id_coordenada in (587, 64262)     and g.id_gene = n.id_gene      and c.id_coordenada = n.id_coordenada ) to /home/ester/bugbox_nomeia_coordenadas.tsv csv delimiter e'\t'
\copy (select distinct(g.*) from gene g, coordenada_gene c, gene_nomeia_coordenada n  where c.id_coordenada in (587, 64262)     and g.id_gene = n.id_gene      and c.id_coordenada = n.id_coordenada ) to /home/ester/bugbox_nomeia_coordenadas.tsv csv delimiter e'\t'
