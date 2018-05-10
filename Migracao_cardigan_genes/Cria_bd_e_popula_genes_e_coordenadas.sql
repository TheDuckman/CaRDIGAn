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
