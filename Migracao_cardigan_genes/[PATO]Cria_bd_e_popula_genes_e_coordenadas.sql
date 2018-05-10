\c pato
DROP DATABASE sandbox;
CREATE DATABASE sandbox;
\c sandbox;

\i /home/pato/Documents/MESTRADO/80-artigo_Cardigan/Migracao_cardigan_genes/Estrutura_cardigan_2018-05-03.sql

\c pato
\c sandbox;

-- Populando as tabelas gene, coordenada_gene e gene_nomeia_coordenada com dados para teste
\copy gene from popula_gene_200_coords.tsv
\copy coordenada_gene from popula_coordenada_gene_200_coords.tsv
\copy gene_nomeia_coordenada from popula_gene_nomeia_coordenada_200_coords.tsv
