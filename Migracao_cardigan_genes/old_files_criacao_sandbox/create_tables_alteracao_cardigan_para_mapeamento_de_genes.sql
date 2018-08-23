-- Arquivo para alterar a estrutura atual do CaRDIGAn para a nova modelagem de mapeamento
-- de genes e coordenadas

DROP TABLE IF EXISTS banco_de_anotacao;

CREATE TABLE banco_de_anotacao
(
    id_banco SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    alias_banco VARCHAR(50)
);

INSERT INTO banco_de_anotacao (
    nome,
    alias_banco
)
SELECT DISTINCT
    banco,
    banco_alias
from gene;

-----------------------------------------
-- Inserir coluna id_banco na tabela gene para facilitar o mapeamento

-- ALTER TABLE gene DROP COLUMN id_banco;
ALTER TABLE gene
    ADD COLUMN id_banco INTEGER,
    ADD FOREIGN KEY (id_banco) REFERENCES banco_de_anotacao (id_banco);

UPDATE gene g SET id_banco = b.id_banco
FROM banco_de_anotacao b
WHERE g.banco = b.nome;

ALTER TABLE gene DROP COLUMN banco,
    DROP COLUMN banco_alias ;

----------------------------------------
-- Criando tabelas que guardam info de nomes de genes

CREATE TABLE gene_referencia
(
    id_gene_ref SERIAL PRIMARY KEY,
    nome VARCHAR(256),
    id_banco INTEGER,
    old_id INTEGER,

    FOREIGN KEY (id_banco) REFERENCES banco_de_anotacao (id_banco)
);

CREATE TABLE gene_alias
(
    id_gene_alias SERIAL PRIMARY KEY,
    id_gene_ref INTEGER,
    id_banco INTEGER,
    old_id INTEGER,
    nome VARCHAR(256),

    FOREIGN KEY (id_gene_ref) REFERENCES gene_referencia (id_gene_ref),
    FOREIGN KEY (id_banco) REFERENCES banco_de_anotacao (id_banco)
);

-------------------------------------------
-- Acrescentando coluna de id_gene_ref em coordenada_gene (mapeamento)

ALTER TABLE coordenada_gene
    ADD COLUMN id_gene_ref INTEGER,
    ADD FOREIGN KEY (id_gene_ref) REFERENCES gene_referencia (id_gene_ref);


-------------------------------------------
-- COLOCANDO COLUNAS PARA SANDBOX DE MIGRAÇÃO DE DADOS DE EXPERIMENTOS
-- Sequenciamento
ALTER TABLE sequenciamento_avalia_gene_em_amostra ADD COLUMN id_gene_ref INTEGER;

-- Mutação
ALTER TABLE mutacao_simples_avalia_gene_em_amostra ADD COLUMN id_gene_ref INTEGER;

