CREATE TABLE transcrito_referencia
(
    id_transc_ref SERIAL PRIMARY KEY,
    gene_ref_id INTEGER,
    nome VARCHAR(256),
    id_banco INTEGER,

    FOREIGN KEY (id_banco) REFERENCES banco_de_anotacao (id_banco)
    FOREIGN KEY (gene_ref_id) REFERENCES gene_referencia (gene_ref_id)
);

CREATE TABLE transcrito_alias
(
    id_transc_alias SERIAL PRIMARY KEY,
    id_gene_ref INTEGER,
    nome VARCHAR(256),
    id_banco INTEGER,

    FOREIGN KEY (id_transc_ref) REFERENCES transcrito_referencia (id_transc_ref),
    FOREIGN KEY (id_banco) REFERENCES banco_de_anotacao (id_banco)
);

