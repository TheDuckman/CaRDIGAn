--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: alcohol_history; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.alcohol_history AS ENUM (
    'yes',
    'no',
    'Don''t know/Not sure',
    ''
);


ALTER TYPE public.alcohol_history OWNER TO pato;

--
-- Name: annotation_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.annotation_type AS ENUM (
    'CTX',
    'DEL/ITX',
    'DUP/INS/ITX',
    'INV/ITX',
    'ITX',
    'DEL',
    'DUP',
    'INV',
    'TRA',
    ''
);


ALTER TYPE public.annotation_type OWNER TO pato;

--
-- Name: assembly_version; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.assembly_version AS ENUM (
    'GRCh37',
    ''
);


ALTER TYPE public.assembly_version OWNER TO pato;

--
-- Name: biological_validation_status; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.biological_validation_status AS ENUM (
    'not tested',
    'tested and valid',
    'tested and not valid',
    'tested and inconclusive',
    'tested and verified',
    'tested and verified to be false',
    ''
);


ALTER TYPE public.biological_validation_status OWNER TO pato;

--
-- Name: biomarker_positive; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.biomarker_positive AS ENUM (
    'ambiguous',
    'absent',
    'present',
    ''
);


ALTER TYPE public.biomarker_positive OWNER TO pato;

--
-- Name: cancer_history_first_degree_relative; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.cancer_history_first_degree_relative AS ENUM (
    'no',
    'unknown',
    'yes',
    ''
);


ALTER TYPE public.cancer_history_first_degree_relative OWNER TO pato;

--
-- Name: cellularity; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.cellularity AS ENUM (
    '1-20%',
    '21-40%',
    '41-60%',
    '61-80%',
    '>81%',
    ''
);


ALTER TYPE public.cellularity OWNER TO pato;

--
-- Name: chromosome; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.chromosome AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    'X',
    'Y',
    'MT',
    ''
);


ALTER TYPE public.chromosome OWNER TO pato;

--
-- Name: chromosome_strand; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.chromosome_strand AS ENUM (
    '-1',
    '1',
    ''
);


ALTER TYPE public.chromosome_strand OWNER TO pato;

--
-- Name: consequence_type_value; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.consequence_type_value AS ENUM (
    '3_prime_UTR_variant',
    '5_prime_UTR_premature_start_codon_gain_variant',
    '5_prime_UTR_variant',
    'disruptive_inframe_deletion',
    'disruptive_inframe_insertion',
    'downstream_gene_variant',
    'exon_loss_variant',
    'exon_variant',
    'frameshift_variant',
    'inframe_deletion',
    'inframe_insertion',
    'initiator_codon_variant',
    'intergenic_region',
    'intragenic_variant',
    'intron_variant',
    'missense_variant',
    'splice_acceptor_variant',
    'splice_donor_variant',
    'splice_region_variant',
    'start_lost',
    'stop_gained',
    'stop_lost',
    'stop_retained_variant',
    'synonymous_variant',
    'upstream_gene_variant',
    'coding_sequence_variant',
    ''
);


ALTER TYPE public.consequence_type_value OWNER TO pato;

--
-- Name: disease_followup_status; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.disease_followup_status AS ENUM (
    'complete remission',
    'partial remission',
    'progression',
    'relapse',
    'stable',
    'no evidence of disease',
    ''
);


ALTER TYPE public.disease_followup_status OWNER TO pato;

--
-- Name: donor_has_relative_with_cancer_history; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.donor_has_relative_with_cancer_history AS ENUM (
    'no',
    'unknown',
    'yes',
    ''
);


ALTER TYPE public.donor_has_relative_with_cancer_history OWNER TO pato;

--
-- Name: donor_relapse_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.donor_relapse_type AS ENUM (
    'local recurrence',
    'distant recurrence/metastasis',
    'progression (liquid tumours)',
    'local recurrence and distant metastasis',
    ''
);


ALTER TYPE public.donor_relapse_type OWNER TO pato;

--
-- Name: donor_sex; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.donor_sex AS ENUM (
    'male',
    'female',
    'unknown',
    ''
);


ALTER TYPE public.donor_sex OWNER TO pato;

--
-- Name: donor_vital_status; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.donor_vital_status AS ENUM (
    'alive',
    'deceased',
    ''
);


ALTER TYPE public.donor_vital_status OWNER TO pato;

--
-- Name: experimento_de_expressao; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.experimento_de_expressao AS ENUM (
    'RNAseq',
    'Microarray',
    'miRNAseq'
);


ALTER TYPE public.experimento_de_expressao OWNER TO pato;

--
-- Name: experimento_de_mutacao; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.experimento_de_mutacao AS ENUM (
    'estrutural',
    'variacao_de_copias',
    'simples'
);


ALTER TYPE public.experimento_de_mutacao OWNER TO pato;

--
-- Name: fita; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.fita AS ENUM (
    '-1',
    '1'
);


ALTER TYPE public.fita OWNER TO pato;

--
-- Name: gene_db; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.gene_db AS ENUM (
    'Ensembl',
    'GAF',
    'RefSeq',
    ''
);


ALTER TYPE public.gene_db OWNER TO pato;

--
-- Name: icgc_zygosity; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.icgc_zygosity AS ENUM (
    'homozygous',
    'heterozygous',
    'hemizygous',
    'nullizygous',
    ''
);


ALTER TYPE public.icgc_zygosity OWNER TO pato;

--
-- Name: is_annotated; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.is_annotated AS ENUM (
    'not annotated',
    'annotated',
    ''
);


ALTER TYPE public.is_annotated OWNER TO pato;

--
-- Name: is_isomir; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.is_isomir AS ENUM (
    'yes',
    'no',
    'unknown',
    ''
);


ALTER TYPE public.is_isomir OWNER TO pato;

--
-- Name: junction_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.junction_type AS ENUM (
    'canonical',
    'non-canonical',
    'U12',
    ''
);


ALTER TYPE public.junction_type OWNER TO pato;

--
-- Name: mirna_db; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.mirna_db AS ENUM (
    'miRBase',
    ''
);


ALTER TYPE public.mirna_db OWNER TO pato;

--
-- Name: mutation_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.mutation_type AS ENUM (
    'gain',
    'loss',
    'copy neutral LOH',
    'copy neutral',
    'hemizygous del LOH',
    'amp LOH',
    'undetermined',
    ''
);


ALTER TYPE public.mutation_type OWNER TO pato;

--
-- Name: mutation_type_simple; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.mutation_type_simple AS ENUM (
    'single base substitution',
    'insertion of <=200bp',
    'deletion of <=200bp',
    'multiple base substitution (>=2bp and <=200bp)',
    ''
);


ALTER TYPE public.mutation_type_simple OWNER TO pato;

--
-- Name: platform; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.platform AS ENUM (
    'PCR',
    'qPCR',
    'capillary sequencing',
    'SOLiD sequencing',
    'Illumina GA sequencing',
    '454 sequencing',
    'Helicos sequencing',
    'Affymetrix Genome-Wide Human SNP Array 6.0',
    'Affymetrix Genome-Wide Human SNP Array 5.0',
    'Affymetrix Mapping 100K Array Set',
    'Affymetrix Mapping 500K Array Set',
    'Affymetrix Mapping 10K 2.0 Array Set',
    'Affymetrix EMET Plus Premier Pack',
    'Agilent Whole Human Genome Oligo Microarray Kit',
    'Agilent Human Genome 244A',
    'Agilent Human Genome 105A',
    'Agilent Human CNV Association 2x105K',
    'Agilent Human Genome 44K',
    'Agilent Human CGH 1x1M',
    'Agilent Human CGH 2x400K',
    'Agilent Human CGH 4x180K',
    'Agilent Human CGH 8x60K',
    'Agilent Human CNV 2x400K',
    'Agilent Human miRNA Microarray Kit (v2)',
    'Agilent Human CpG Island Microarray Kit',
    'Agilent Human Promoter ChIP-on-chip Microarray Set',
    'Agilent Human SpliceArray',
    'Illumina human1m-duo',
    'Illumina human660w-quad',
    'Illumina humancytosnp-12',
    'Illumina human510s-duo',
    'Illumina humanmethylation27',
    'Illumina goldengate methylation',
    'Illumina HumanHT-12 v4.0 beadchip',
    'Illumina HumanWG-6 v3.0 beadchip',
    'Illumina HumanRef-8 v3.0 beadchip',
    'Illumina microRNA Expression Profiling Panel',
    'Illumina humanht-16',
    'Illumina humanht-17',
    'Nimblegen Human CGH 3x720 Whole-Genome v3.0 Array',
    'Nimblegen Human CGH 2.1M Whole-Genome v2.0D Array',
    'Nimblegen Gene Expression 385K',
    'Nimblegen Gene Expression 4x72K',
    'Nimblegen Gene Expression 12x135K',
    'Nimblegen Human Methylation 2.1M Whole-Genome sets',
    'Nimblegen Human Methylation 385K Whole-Genome sets',
    'Nimblegen CGS',
    'Illumina Human1M OmniQuad chip',
    'PCR and capillary sequencing',
    'Custom-designed gene expression array',
    'Affymetrix HT Human Genome U133A Array Plate Set',
    'Agilent 244K Custom Gene Expression G4502A-07-1',
    'Agilent 244K Custom Gene Expression G4502A-07-2',
    'Agilent 244K Custom Gene Expression G4502A-07-3',
    'Agilent Human Genome CGH Custom Microaary 2x415K',
    'Affymetrix Human U133 Plus PM',
    'Affymetrix Human U133 Plus 2.0',
    'Affymetrix Human Exon 1.0 ST',
    'Almac Human CRC',
    'Illumina HiSeq',
    'Affymetrix Human MIP 330K',
    'Affymetrix Human Gene 1.0 ST',
    'Illumina Human Omni1-Quad beadchip',
    'Sequenom MassARRAY',
    'Custom-designed cDNA array',
    'Illumina HumanHap550',
    'Ion Torrent PGM',
    'Illumina GoldenGate Methylation Cancer Panel I',
    'Illumina Infinium HumanMethylation450',
    'Agilent 8 x 15K Human miRNA-specific microarray',
    'M.D. Anderson Reverse Phase Protein Array Core',
    'Microsatellite Instability Analysis',
    'Agilent 244K Custom Gene Expression G4502A-07',
    'Illumina HumanCNV370-Duo v1.0 BeadChip',
    'Illumina HumanOmniExpress BeadChip',
    'PacBio RS sequencing',
    'Affymetrix OncoScan FFPE Express 2.0',
    'Illumina MiSeq Personal Sequencer',
    'Affymetrix Human Genome U219 Array Plate',
    'HumanOmni2.5-8 BeadChip Kit',
    'Complete Genomics',
    'nanoString',
    'Ion Torrent Proton',
    'Illumina HiSeq X Ten',
    'Affymetrix OncoScan FFPE Express 3.0',
    ''
);


ALTER TYPE public.platform OWNER TO pato;

--
-- Name: prior_malignancy; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.prior_malignancy AS ENUM (
    'yes',
    'no',
    'unknown',
    ''
);


ALTER TYPE public.prior_malignancy OWNER TO pato;

--
-- Name: procedure_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.procedure_type AS ENUM (
    'surgical resection of primary',
    'surgical resection of local recurrence',
    'surgical resection of distant recurrence (metastasis)',
    'lymph node dissection at time of resection of primary.',
    'biopsy of primary',
    'biopsy of local recurrence',
    'biopsy of distant recurrence',
    'other',
    ''
);


ALTER TYPE public.procedure_type OWNER TO pato;

--
-- Name: raw_data_repository; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.raw_data_repository AS ENUM (
    'EGA',
    'dbSNP',
    'TCGA',
    'CGHub',
    'GEO',
    'TARGET',
    'ArrayExpress',
    ''
);


ALTER TYPE public.raw_data_repository OWNER TO pato;

--
-- Name: reference_sample_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.reference_sample_type AS ENUM (
    'matched normal',
    'unrelated normal',
    'cell line derived from matched normal',
    'pooled samples',
    'other',
    ''
);


ALTER TYPE public.reference_sample_type OWNER TO pato;

--
-- Name: relationship_sex; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.relationship_sex AS ENUM (
    'male',
    'female',
    'unknown',
    ''
);


ALTER TYPE public.relationship_sex OWNER TO pato;

--
-- Name: relationship_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.relationship_type AS ENUM (
    'cousin',
    'grandparent',
    'other',
    'parent',
    'sibling',
    'uncle/aunt',
    'unknown',
    ''
);


ALTER TYPE public.relationship_type OWNER TO pato;

--
-- Name: resection_status; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.resection_status AS ENUM (
    'R0 - no apparent residual disease',
    'R1 - microscopic residual disease.',
    'R2 - gross residual disease.',
    ''
);


ALTER TYPE public.resection_status OWNER TO pato;

--
-- Name: sequencing_strategies; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.sequencing_strategies AS ENUM (
    'non-NGS',
    'WGS',
    ''
);


ALTER TYPE public.sequencing_strategies OWNER TO pato;

--
-- Name: sequencing_strategy; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.sequencing_strategy AS ENUM (
    'WGS',
    'WGA',
    'WXS',
    'RNA-Seq',
    'miRNA-Seq',
    'ncRNA-Seq',
    'WCS',
    'CLONE',
    'POOLCLONE',
    'AMPLICON',
    'CLONEEND',
    'FINISHING',
    'ChIP-Seq',
    'MNase-Seq',
    'DNase-Hypersensitivity',
    'Bisulfite-Seq',
    'EST',
    'FL-cDNA',
    'CTS',
    'MRE-Seq',
    'MeDIP-Seq',
    'MBD-Seq',
    'Tn-Seq',
    'VALIDATION',
    'FAIRE-seq',
    'SELEX',
    'RIP-Seq',
    'ChIA-PET',
    'OTHER',
    'non-NGS',
    ''
);


ALTER TYPE public.sequencing_strategy OWNER TO pato;

--
-- Name: specimen_donor_treatment_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.specimen_donor_treatment_type AS ENUM (
    'no treatment',
    'chemotherapy',
    'radiation therapy',
    'combined chemo+radiation therapy',
    'immunotherapy',
    'combined chemo+immunotherapy',
    'surgery',
    'other therapy',
    'bone marrow transplant',
    'stem cell transplant',
    'monoclonal antibodies (for liquid tumours)',
    ''
);


ALTER TYPE public.specimen_donor_treatment_type OWNER TO pato;

--
-- Name: specimen_processing; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.specimen_processing AS ENUM (
    'cryopreservation in liquid nitrogen (dead tissue)',
    'cryopreservation in dry ice (dead tissue)',
    'cryopreservation of live cells in liquid nitrogen',
    'cryopreservation',
    'other',
    'unbuffered',
    'formalin fixed',
    'buffered',
    'formalin fixed & paraffin embedded',
    'fresh',
    'other technique',
    'formalin fixed, unbuffered',
    'cryopreservation, other',
    ''
);


ALTER TYPE public.specimen_processing OWNER TO pato;

--
-- Name: specimen_storage; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.specimen_storage AS ENUM (
    'frozen, liquid nitrogen',
    'frozen, -70 freezer',
    'frozen, vapor phase',
    'RNA later frozen',
    'paraffin block',
    'cut slide',
    'other',
    ''
);


ALTER TYPE public.specimen_storage OWNER TO pato;

--
-- Name: specimen_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.specimen_type AS ENUM (
    'Normal - solid tissue',
    'Normal - blood derived',
    'Normal - bone marrow',
    'Normal - tissue adjacent to primary',
    'Normal - buccal cell',
    'Normal - EBV immortalized',
    'Normal - lymph node',
    'Normal - other',
    'Primary tumour - solid tissue',
    'Primary tumour - blood derived (peripheral blood)',
    'Primary tumour - blood derived (bone marrow)',
    'Primary tumour - additional new primary',
    'Primary tumour - other',
    'Recurrent tumour - solid tissue',
    'Recurrent tumour - blood derived (peripheral blood)',
    'Recurrent tumour - blood derived (bone marrow)',
    'Recurrent tumour - other',
    'Metastatic tumour - NOS',
    'Metastatic tumour - lymph node',
    'Metastatic tumour - metastatsis local to lymph node',
    'Metastatic tumour - metastatsis to distant location',
    'Metastatic tumour - metastasis to distant location',
    'Metastatic tumour - additional metastatic',
    'Xenograft - derived from primary tumour',
    'Xenograft - derived from tumour cell line',
    'Cell line - derived from tumour',
    'Primary tumour - lymph node',
    'Metastatic tumour - other',
    'Cell line - derived from xenograft tumour',
    'Metastatic tumour - metastasis local to lymph node',
    ''
);


ALTER TYPE public.specimen_type OWNER TO pato;

--
-- Name: therapeutic_intent; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.therapeutic_intent AS ENUM (
    'not applicable',
    'adjuvant',
    'curative',
    'palliative',
    ''
);


ALTER TYPE public.therapeutic_intent OWNER TO pato;

--
-- Name: therapy_response; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.therapy_response AS ENUM (
    'complete response',
    'disease progression',
    'partial response',
    'stable disease',
    'unknown',
    ''
);


ALTER TYPE public.therapy_response OWNER TO pato;

--
-- Name: therapy_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.therapy_type AS ENUM (
    'no treatment',
    'chemotherapy',
    'radiation therapy',
    'combined chemo+radiation therapy',
    'immunotherapy',
    'combined chemo+immunotherapy',
    'surgery',
    'other therapy',
    'bone marrow transplant',
    'stem cell transplant',
    'monoclonal antibodies (for liquid tumours)',
    ''
);


ALTER TYPE public.therapy_type OWNER TO pato;

--
-- Name: tipo_amostra; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.tipo_amostra AS ENUM (
    'tumor',
    'controle'
);


ALTER TYPE public.tipo_amostra OWNER TO pato;

--
-- Name: variant_type; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.variant_type AS ENUM (
    'deletion',
    'tandem duplication',
    'inversion',
    'inverted duplication - head-to-head',
    'inverted duplication - tail-to-tail',
    'insertion',
    'intrachromosomal rearrangement with inverted orientation',
    'intrachromosomal rearrangement with non-inverted orientation',
    'fold-back inversion',
    'complex intrachromosomal rearrangement',
    'reciprocal translocation',
    'unbalanced translocation',
    'interchromosomal insertion',
    'interchromosomal rearrangement - unknown type',
    'complex interchromosomal rearrangement',
    'intrachromosomal amplicon-to-amplicon',
    'intrachromosomal amplicon-to-nonamplified dna',
    'interchromosomal amplicon-to-amplicon',
    'interchromosomal amplicon-to-nonamplified dna',
    'extrachromosomal',
    ''
);


ALTER TYPE public.variant_type OWNER TO pato;

--
-- Name: yes_no; Type: TYPE; Schema: public; Owner: pato
--

CREATE TYPE public.yes_no AS ENUM (
    'yes',
    'no',
    ''
);


ALTER TYPE public.yes_no OWNER TO pato;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.amostra (
    id_amostra integer NOT NULL,
    id_paciente integer,
    id_especime integer,
    sample_id_banco_de_origem text,
    submitted_sample_id_banco_de_origem text,
    specimen_id_banco_de_origem text,
    submitted_specimen_id_banco_de_origem text,
    analyzed_sample_interval text,
    percentage_cellularity text,
    level_of_cellularity text
);


ALTER TABLE public.amostra OWNER TO pato;

--
-- Name: amostra_id_amostra_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.amostra_id_amostra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amostra_id_amostra_seq OWNER TO pato;

--
-- Name: amostra_id_amostra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.amostra_id_amostra_seq OWNED BY public.amostra.id_amostra;


--
-- Name: banco_de_anotacao; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.banco_de_anotacao (
    id_banco integer NOT NULL,
    nome character varying(50),
    alias_banco character varying(50)
);


ALTER TABLE public.banco_de_anotacao OWNER TO pato;

--
-- Name: banco_de_anotacao_id_banco_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.banco_de_anotacao_id_banco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banco_de_anotacao_id_banco_seq OWNER TO pato;

--
-- Name: banco_de_anotacao_id_banco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.banco_de_anotacao_id_banco_seq OWNED BY public.banco_de_anotacao.id_banco;


--
-- Name: coordenada_exon; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.coordenada_exon (
    versao_montagem text NOT NULL,
    fonte_montagem text NOT NULL,
    cromossomo text NOT NULL,
    inicio integer NOT NULL,
    fim integer NOT NULL,
    fita text NOT NULL
);


ALTER TABLE public.coordenada_exon OWNER TO pato;

--
-- Name: coordenada_gene; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.coordenada_gene (
    id_coordenada integer NOT NULL,
    cromossomo text,
    inicio text,
    fim text,
    fita public.fita,
    referencia text,
    montagem text,
    source text,
    status text,
    version text,
    gene_biotype text,
    id_gene_ref integer
);


ALTER TABLE public.coordenada_gene OWNER TO pato;

--
-- Name: coordenada_gene_id_coordenada_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.coordenada_gene_id_coordenada_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coordenada_gene_id_coordenada_seq OWNER TO pato;

--
-- Name: coordenada_gene_id_coordenada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.coordenada_gene_id_coordenada_seq OWNED BY public.coordenada_gene.id_coordenada;


--
-- Name: coordenada_transcrito; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.coordenada_transcrito (
    id_coordenada integer NOT NULL,
    cromossomo text,
    inicio text,
    fim text,
    fita public.fita,
    banda_cromossomo text,
    referencia text,
    montagem text,
    transcription_start_site integer,
    comprimento integer,
    source text,
    status text,
    version text,
    transcript_biotype text
);


ALTER TABLE public.coordenada_transcrito OWNER TO pato;

--
-- Name: coordenada_transcrito_id_coordenada_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.coordenada_transcrito_id_coordenada_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coordenada_transcrito_id_coordenada_seq OWNER TO pato;

--
-- Name: coordenada_transcrito_id_coordenada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.coordenada_transcrito_id_coordenada_seq OWNED BY public.coordenada_transcrito.id_coordenada;


--
-- Name: diagnostico; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.diagnostico (
    id_diagnostico integer NOT NULL,
    id_paciente integer,
    id_especime integer,
    donor_id_banco_de_origem text,
    tumour_confirmed text,
    tumour_histological_type text,
    tumour_grading_system text,
    tumour_grade text,
    tumour_grade_supplemental text,
    tumour_stage_system text,
    tumour_stage text,
    tumour_stage_supplemental text
);


ALTER TABLE public.diagnostico OWNER TO pato;

--
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.diagnostico_id_diagnostico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diagnostico_id_diagnostico_seq OWNER TO pato;

--
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.diagnostico_id_diagnostico_seq OWNED BY public.diagnostico.id_diagnostico;


--
-- Name: especime; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.especime (
    id_especime integer NOT NULL,
    id_paciente integer,
    id_banco_de_origem text,
    study_specimen_involved_in text,
    submitted_specimen_id_banco_de_origem text,
    specimen_type text,
    specimen_type_other text,
    specimen_interval text,
    specimen_donor_treatment_type text,
    specimen_donor_treatment_type_other text,
    specimen_processing text,
    specimen_processing_other text,
    specimen_storage text,
    specimen_storage_other text,
    tumour_confirmed text,
    specimen_biobank text,
    specimen_biobank_id text,
    specimen_available text,
    tumour_histological_type text,
    tumour_grading_system text,
    tumour_grade text,
    tumour_grade_supplemental text,
    tumour_stage_system text,
    tumour_stage text,
    tumour_stage_supplemental text,
    digital_image_of_stained_section text,
    percentage_cellularity_string text,
    level_of_cellularity text,
    responsavel_coleta text
);


ALTER TABLE public.especime OWNER TO pato;

--
-- Name: especime_id_especime_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.especime_id_especime_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.especime_id_especime_seq OWNER TO pato;

--
-- Name: especime_id_especime_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.especime_id_especime_seq OWNED BY public.especime.id_especime;


--
-- Name: exon; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.exon (
    id_exon integer NOT NULL,
    id_transcrito integer,
    id_gene integer,
    banco text,
    nome_no_banco text
);


ALTER TABLE public.exon OWNER TO pato;

--
-- Name: exon_id_exon_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.exon_id_exon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exon_id_exon_seq OWNER TO pato;

--
-- Name: exon_id_exon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.exon_id_exon_seq OWNED BY public.exon.id_exon;


--
-- Name: experim_express_genica_utiliza_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experim_express_genica_utiliza_amostra (
    id_exp_genica integer NOT NULL,
    id_amostra integer NOT NULL,
    tipo_experimento public.experimento_de_expressao,
    analysis_id_amostra_banco_de_origem text,
    raw_data_repository text,
    raw_data_accession text,
    tipo_amostra public.tipo_amostra
);


ALTER TABLE public.experim_express_genica_utiliza_amostra OWNER TO pato;

--
-- Name: experim_express_proteica_utiliza_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experim_express_proteica_utiliza_amostra (
    id_amostra integer,
    id_exp_proteica integer
);


ALTER TABLE public.experim_express_proteica_utiliza_amostra OWNER TO pato;

--
-- Name: experim_mutacao_utiliza_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experim_mutacao_utiliza_amostra (
    id_exp_mut_somatica integer,
    id_amostra integer,
    tipo_experimento public.experimento_de_mutacao,
    analysis_id_amostra_banco_de_origem text,
    raw_data_repository text,
    raw_data_accession text,
    seq_coverage double precision,
    tipo_amostra public.tipo_amostra
);


ALTER TABLE public.experim_mutacao_utiliza_amostra OWNER TO pato;

--
-- Name: experim_redes_genicas_analisa_gene; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experim_redes_genicas_analisa_gene (
    id_gene integer,
    id_experimento_redes_genicas integer,
    conectividade double precision,
    cor text
);


ALTER TABLE public.experim_redes_genicas_analisa_gene OWNER TO pato;

--
-- Name: experim_redes_genicas_utiliza_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experim_redes_genicas_utiliza_amostra (
    id_experimento_redes_genicas integer,
    id_amostra integer
);


ALTER TABLE public.experim_redes_genicas_utiliza_amostra OWNER TO pato;

--
-- Name: experim_variacao_de_splicing_analisa_transcrito_em_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experim_variacao_de_splicing_analisa_transcrito_em_amostra (
    id_transcrito integer,
    id_experim_variacao_splicing integer,
    junction_id text,
    assembly_version text,
    second_gene_stable_id text,
    exon1_chromosome text,
    exon1_number_bases integer,
    exon1_end bigint,
    exon1_strand text,
    exon2_chromosome text,
    exon2_number_bases bigint,
    exon2_start bigint,
    exon2_strand text,
    is_fusion_gene text,
    is_novel_splice_form text,
    junction_seq text,
    junction_type text,
    junction_read_count double precision,
    quality_score text,
    probability text,
    verification_status text,
    verification_platform text
);


ALTER TABLE public.experim_variacao_de_splicing_analisa_transcrito_em_amostra OWNER TO pato;

--
-- Name: experim_variacao_de_splicing_utiliza_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experim_variacao_de_splicing_utiliza_amostra (
    id_experim_variacao_splicing integer NOT NULL,
    id_amostra integer
);


ALTER TABLE public.experim_variacao_de_splicing_utiliza_amostra OWNER TO pato;

--
-- Name: experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq OWNER TO pato;

--
-- Name: experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq OWNED BY public.experim_variacao_de_splicing_utiliza_amostra.id_experim_variacao_splicing;


--
-- Name: experimento_de_expressao_genica; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experimento_de_expressao_genica (
    id_exp_genica integer NOT NULL,
    projeto_de_origem text,
    experimento_expressao_genica text,
    comparacao_realizada text,
    data_do_experimento date,
    data_da_analise date,
    pessoa_responsavel text,
    tipo_de_fold_change text,
    analysis_id_experimento_banco_de_origem text,
    assembly_version text,
    total_read_count integer,
    platform text,
    experimental_protocol text,
    alignment_algorithm text,
    normalization_algorithm text,
    other_analysis_algorithm text,
    sequencing_strategy text,
    raw_data_repository text,
    raw_data_accession text,
    reference_sample_type text,
    banco_de_origem text,
    versao_do_banco_de_origem text
);


ALTER TABLE public.experimento_de_expressao_genica OWNER TO pato;

--
-- Name: experimento_de_expressao_genica_id_exp_genica_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.experimento_de_expressao_genica_id_exp_genica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experimento_de_expressao_genica_id_exp_genica_seq OWNER TO pato;

--
-- Name: experimento_de_expressao_genica_id_exp_genica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.experimento_de_expressao_genica_id_exp_genica_seq OWNED BY public.experimento_de_expressao_genica.id_exp_genica;


--
-- Name: experimento_de_mutacao_somatica; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experimento_de_mutacao_somatica (
    id_exp_mut_somatica integer NOT NULL,
    tipo_experimento public.experimento_de_mutacao,
    projeto_de_origem text,
    comparacao_realizada text,
    data_do_experimento date,
    data_da_analise date,
    pessoa_responsavel text,
    analysis_id_experimento_banco_de_origem text,
    assembly_version text,
    gene_build_version text,
    platform text,
    experimental_protocol text,
    sequencing_strategy text,
    base_calling_algorithm text,
    alignment_algorithm text,
    variation_calling_algorithm text,
    other_analysis_algorithm text,
    raw_data_repository text,
    raw_data_accession text,
    initial_data_release_date text,
    estudo_de_origem text,
    banco_de_origem text,
    versao_do_banco_de_origem text
);


ALTER TABLE public.experimento_de_mutacao_somatica OWNER TO pato;

--
-- Name: experimento_de_mutacao_somatica_id_exp_mut_somatica_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.experimento_de_mutacao_somatica_id_exp_mut_somatica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experimento_de_mutacao_somatica_id_exp_mut_somatica_seq OWNER TO pato;

--
-- Name: experimento_de_mutacao_somatica_id_exp_mut_somatica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.experimento_de_mutacao_somatica_id_exp_mut_somatica_seq OWNED BY public.experimento_de_mutacao_somatica.id_exp_mut_somatica;


--
-- Name: experimento_de_redes_genicas; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experimento_de_redes_genicas (
    id_experimento_redes_genicas integer NOT NULL,
    comparacao_realizada text,
    data_do_experimento date,
    data_da_analise date,
    pessoa_responsavel text
);


ALTER TABLE public.experimento_de_redes_genicas OWNER TO pato;

--
-- Name: experimento_de_redes_genicas_id_experimento_redes_genicas_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.experimento_de_redes_genicas_id_experimento_redes_genicas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experimento_de_redes_genicas_id_experimento_redes_genicas_seq OWNER TO pato;

--
-- Name: experimento_de_redes_genicas_id_experimento_redes_genicas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.experimento_de_redes_genicas_id_experimento_redes_genicas_seq OWNED BY public.experimento_de_redes_genicas.id_experimento_redes_genicas;


--
-- Name: experimento_de_variacao_de_splicing; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.experimento_de_variacao_de_splicing (
    id_experim_variacao_splicing integer NOT NULL,
    projeto_de_origem text,
    analysis_id text,
    assembly_version text,
    gene_build_version text,
    platform text,
    experimental_protocol text,
    base_calling_algorithm text,
    alignment_algorithm text,
    normalization_algorithm text,
    other_analysis_algorithm text,
    sequencing_strategy text,
    seq_coverage text,
    raw_data_repository text,
    raw_data_accession text,
    banco_de_origem text,
    versao_do_banco_de_origem text
);


ALTER TABLE public.experimento_de_variacao_de_splicing OWNER TO pato;

--
-- Name: experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq OWNER TO pato;

--
-- Name: experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq OWNED BY public.experimento_de_variacao_de_splicing.id_experim_variacao_splicing;


--
-- Name: exposicao; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.exposicao (
    id_exposicao integer NOT NULL,
    id_paciente integer,
    donor_id_banco_de_origem text,
    exposure_type text,
    exposure_intensity text,
    tobacco_smoking_history_indicator text,
    tobacco_smoking_intensity text,
    alcohol_history text,
    alcohol_history_intensity text
);


ALTER TABLE public.exposicao OWNER TO pato;

--
-- Name: exposicao_id_exposicao_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.exposicao_id_exposicao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exposicao_id_exposicao_seq OWNER TO pato;

--
-- Name: exposicao_id_exposicao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.exposicao_id_exposicao_seq OWNED BY public.exposicao.id_exposicao;


--
-- Name: expressao_microarray_avalia_gene_em_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.expressao_microarray_avalia_gene_em_amostra (
    id_gene integer,
    id_exp_genica integer,
    normalized_expression_value double precision,
    fold_change double precision
);


ALTER TABLE public.expressao_microarray_avalia_gene_em_amostra OWNER TO pato;

--
-- Name: expressao_proteica; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.expressao_proteica (
    id_exp_proteica integer NOT NULL,
    id_amostra integer,
    comparacao_realizada text,
    data_do_experimento date,
    data_da_analise date,
    pessoa_responsavel text,
    gene_build_version text,
    analysis_id integer,
    platform text,
    experimental_protocol text,
    raw_data_repository text,
    raw_data_accession text,
    banco_de_origem text,
    versao_do_banco_de_origem text
);


ALTER TABLE public.expressao_proteica OWNER TO pato;

--
-- Name: expressao_proteica_diz_respeito_a_gene_em_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.expressao_proteica_diz_respeito_a_gene_em_amostra (
    id_amostra integer,
    id_gene integer,
    id_exp_proteica integer,
    antibody_id text,
    normalized_expression_level text,
    verification_status text,
    verification_platform text
);


ALTER TABLE public.expressao_proteica_diz_respeito_a_gene_em_amostra OWNER TO pato;

--
-- Name: expressao_proteica_id_exp_proteica_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.expressao_proteica_id_exp_proteica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expressao_proteica_id_exp_proteica_seq OWNER TO pato;

--
-- Name: expressao_proteica_id_exp_proteica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.expressao_proteica_id_exp_proteica_seq OWNED BY public.expressao_proteica.id_exp_proteica;


--
-- Name: familiar; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.familiar (
    id_paciente integer,
    id_paciente_banco_de_origem text,
    relationship_type text,
    relationship_type_other text,
    relationship_sex text,
    relationship_age_string text,
    relationship_disease_icd10 text,
    relationship_disease text
);


ALTER TABLE public.familiar OWNER TO pato;

--
-- Name: gene; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.gene (
    id_gene integer NOT NULL,
    nome_no_banco text,
    id_banco integer
);


ALTER TABLE public.gene OWNER TO pato;

--
-- Name: gene_alias; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.gene_alias (
    id_gene_alias integer NOT NULL,
    id_gene_ref integer,
    id_banco integer,
    old_id integer,
    nome character varying(256)
);


ALTER TABLE public.gene_alias OWNER TO pato;

--
-- Name: gene_alias_id_gene_alias_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.gene_alias_id_gene_alias_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gene_alias_id_gene_alias_seq OWNER TO pato;

--
-- Name: gene_alias_id_gene_alias_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.gene_alias_id_gene_alias_seq OWNED BY public.gene_alias.id_gene_alias;


--
-- Name: gene_id_gene_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.gene_id_gene_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gene_id_gene_seq OWNER TO pato;

--
-- Name: gene_id_gene_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.gene_id_gene_seq OWNED BY public.gene.id_gene;


--
-- Name: gene_nomeia_coordenada; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.gene_nomeia_coordenada (
    id_coordenada integer,
    id_gene integer
);


ALTER TABLE public.gene_nomeia_coordenada OWNER TO pato;

--
-- Name: gene_referencia; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.gene_referencia (
    id_gene_ref integer NOT NULL,
    nome character varying(256),
    id_banco integer,
    old_id integer
);


ALTER TABLE public.gene_referencia OWNER TO pato;

--
-- Name: gene_referencia_id_gene_ref_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.gene_referencia_id_gene_ref_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gene_referencia_id_gene_ref_seq OWNER TO pato;

--
-- Name: gene_referencia_id_gene_ref_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.gene_referencia_id_gene_ref_seq OWNED BY public.gene_referencia.id_gene_ref;


--
-- Name: genes_v37; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.genes_v37 (
    ensembl_gene_id text,
    hgnc_id text,
    external_gene_name text,
    mirbase_id text,
    chromosome_name text,
    start_position text,
    end_position text,
    strand text,
    source text,
    status text,
    version text,
    gene_biotype text,
    montagem integer,
    referencia text
);


ALTER TABLE public.genes_v37 OWNER TO pato;

--
-- Name: genes_v38; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.genes_v38 (
    ensembl_gene_id text,
    hgnc_id_str text,
    external_gene_name text,
    mirbase_id text,
    chromosome_name text,
    start_position text,
    end_position text,
    strand text,
    source text,
    status text,
    version text,
    gene_biotype text,
    montagem integer,
    referencia text,
    hgnc_id text
);


ALTER TABLE public.genes_v38 OWNER TO pato;

--
-- Name: icgc_donor; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.icgc_donor (
    icgc_donor_id text NOT NULL,
    project_code text,
    study_donor_involved_in text,
    submitted_donor_id text,
    donor_sex public.donor_sex,
    donor_vital_status public.donor_vital_status,
    disease_status_last_followup public.disease_followup_status,
    donor_relapse_type public.donor_relapse_type,
    donor_age_at_diagnosis_string text,
    donor_age_at_enrollment_string text,
    donor_age_at_last_followup_string text,
    donor_relapse_interval_string text,
    donor_diagnosis_icd10 text,
    donor_tumour_staging_system_at_diagnosis text,
    donor_tumour_stage_at_diagnosis text,
    donor_tumour_stage_at_diagnosis_supplemental text,
    donor_survival_time_string text,
    donor_interval_of_last_followup_string text,
    prior_malignancy public.prior_malignancy,
    cancer_type_prior_malignancy text,
    cancer_history_first_degree_relative public.cancer_history_first_degree_relative,
    donor_age_at_diagnosis integer,
    donor_age_at_enrollment integer,
    donor_age_at_last_followup integer,
    donor_relapse_interval integer,
    donor_survival_time integer,
    donor_interval_of_last_followup integer,
    banco_de_origem text,
    versao_do_banco text
);


ALTER TABLE public.icgc_donor OWNER TO pato;

--
-- Name: icgc_donor_exposure; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.icgc_donor_exposure (
    icgc_donor_id text,
    project_code text,
    submitted_donor_id text,
    exposure_type text,
    exposure_intensity text,
    tobacco_smoking_history_indicator text,
    tobacco_smoking_intensity_string text,
    alcohol_history public.alcohol_history,
    alcohol_history_intensity text,
    tobacco_smoking_intensity integer
);


ALTER TABLE public.icgc_donor_exposure OWNER TO pato;

--
-- Name: icgc_donor_family; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.icgc_donor_family (
    icgc_donor_id text,
    project_code text,
    submitted_donor_id text,
    donor_has_relative_with_cancer_history public.donor_has_relative_with_cancer_history,
    relationship_type public.relationship_type,
    relationship_type_other text,
    relationship_sex public.relationship_sex,
    relationship_age_string text,
    relationship_disease_icd10 text,
    relationship_disease text,
    relationship_age integer
);


ALTER TABLE public.icgc_donor_family OWNER TO pato;

--
-- Name: icgc_donor_therapy; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.icgc_donor_therapy (
    icgc_donor_id text,
    project_code text,
    submitted_donor_id text,
    first_therapy_type public.therapy_type,
    first_therapy_therapeutic_intent public.therapeutic_intent,
    first_therapy_start_interval_string text,
    first_therapy_duration_string text,
    first_therapy_response public.therapy_response,
    second_therapy_type public.therapy_type,
    second_therapy_therapeutic_intent public.therapeutic_intent,
    second_therapy_start_interval_string text,
    second_therapy_duration_string text,
    second_therapy_response public.therapy_response,
    other_therapy text,
    other_therapy_response text,
    first_therapy_start_interval integer,
    first_therapy_duration integer,
    second_therapy_start_interval integer,
    second_therapy_duration integer
);


ALTER TABLE public.icgc_donor_therapy OWNER TO pato;

--
-- Name: icgc_exp_seq; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.icgc_exp_seq (
    icgc_donor_id text NOT NULL,
    project_code text,
    icgc_specimen_id text,
    icgc_sample_id text,
    submitted_sample_id text,
    analysis_id text,
    gene_model public.gene_db,
    gene_id text,
    normalized_read_count_string text,
    raw_read_count_string text,
    fold_change_string text,
    assembly_version public.assembly_version,
    platform public.platform,
    total_read_count_string text,
    experimental_protocol text,
    alignment_algorithm text,
    normalization_algorithm text,
    other_analysis_algorithm text,
    sequencing_strategy public.sequencing_strategy,
    raw_data_repository public.raw_data_repository,
    raw_data_accession text,
    reference_sample_type text,
    normalized_read_count double precision,
    raw_read_count bigint,
    fold_change double precision,
    total_read_count bigint
);


ALTER TABLE public.icgc_exp_seq OWNER TO pato;

--
-- Name: icgc_protein_expression; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.icgc_protein_expression (
    icgc_donor_id text,
    project_code text,
    icgc_specimen_id text,
    icgc_sample_id text NOT NULL,
    submitted_sample_id text,
    analysis_id integer NOT NULL,
    antibody_id text NOT NULL,
    gene_name text,
    gene_stable_id text,
    gene_build_version text,
    normalized_expression_level text NOT NULL,
    verification_status public.biological_validation_status,
    verification_platform public.platform,
    platform public.platform,
    experimental_protocol text,
    raw_data_repository public.raw_data_repository,
    raw_data_accession text
);


ALTER TABLE public.icgc_protein_expression OWNER TO pato;

--
-- Name: icgc_sample; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.icgc_sample (
    icgc_sample_id text NOT NULL,
    project_code text,
    submitted_sample_id text,
    icgc_specimen_id text,
    submitted_specimen_id text,
    icgc_donor_id text,
    submitted_donor_id text,
    analyzed_sample_interval text,
    percentage_cellularity text,
    level_of_cellularity public.cellularity,
    study text
);


ALTER TABLE public.icgc_sample OWNER TO pato;

--
-- Name: icgc_simple_somatic_mutation; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.icgc_simple_somatic_mutation (
    icgc_mutation_id text,
    icgc_donor_id text,
    project_code text,
    icgc_specimen_id text,
    icgc_sample_id text,
    matched_icgc_sample_id text,
    submitted_sample_id text,
    submitted_matched_sample_id text,
    chromosome public.chromosome,
    chromosome_start integer,
    chromosome_end integer,
    chromosome_strand public.chromosome_strand,
    assembly_version public.assembly_version,
    mutation_type public.mutation_type_simple,
    reference_genome_allele text,
    mutated_from_allele text,
    mutated_to_allele text,
    quality_score text,
    probability text,
    total_read_count_string text,
    mutant_allele_read_count text,
    verification_status public.biological_validation_status,
    verification_platform public.platform,
    biological_validation_status public.biological_validation_status,
    biological_validation_platform public.platform,
    consequence_type public.consequence_type_value,
    aa_mutation text,
    cds_mutation text,
    gene_affected text,
    transcript_affected text,
    gene_build_version text,
    platform public.platform,
    experimental_protocol text,
    sequencing_strategy public.sequencing_strategy,
    base_calling_algorithm text,
    alignment_algorithm text,
    variation_calling_algorithm text,
    other_analysis_algorithm text,
    seq_coverage_string text,
    raw_data_repository public.raw_data_repository,
    raw_data_accession text,
    initial_data_release_date text,
    total_read_count integer,
    seq_coverage double precision,
    id_gene integer,
    id_exp_mut_somatica integer,
    id_amostra_experimental integer,
    id_amostra_controle integer,
    chave_serial bigint NOT NULL
);


ALTER TABLE public.icgc_simple_somatic_mutation OWNER TO pato;

--
-- Name: icgc_simple_somatic_mutation_chave_serial_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.icgc_simple_somatic_mutation_chave_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.icgc_simple_somatic_mutation_chave_serial_seq OWNER TO pato;

--
-- Name: icgc_simple_somatic_mutation_chave_serial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.icgc_simple_somatic_mutation_chave_serial_seq OWNED BY public.icgc_simple_somatic_mutation.chave_serial;


--
-- Name: icgc_specimen; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.icgc_specimen (
    icgc_specimen_id text,
    project_code text NOT NULL,
    study_specimen_involved_in text,
    submitted_specimen_id text NOT NULL,
    icgc_donor_id text,
    submitted_donor_id text,
    specimen_type public.specimen_type,
    specimen_type_other text,
    specimen_interval_string text,
    specimen_donor_treatment_type public.specimen_donor_treatment_type,
    specimen_donor_treatment_type_other text,
    specimen_processing public.specimen_processing,
    specimen_processing_other text,
    specimen_storage text,
    specimen_storage_other text,
    tumour_confirmed public.yes_no,
    specimen_biobank text,
    specimen_biobank_id text,
    specimen_available public.yes_no,
    tumour_histological_type text,
    tumour_grading_system text,
    tumour_grade text,
    tumour_grade_supplemental text,
    tumour_stage_system text,
    tumour_stage text,
    tumour_stage_supplemental text,
    digital_image_of_stained_section text,
    percentage_cellularity_string text,
    level_of_cellularity public.cellularity,
    specimen_interval integer,
    percentage_cellularity integer
);


ALTER TABLE public.icgc_specimen OWNER TO pato;

--
-- Name: marcador; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.marcador (
    id_marcador integer NOT NULL,
    nome_marcador text,
    unidade_de_medida text
);


ALTER TABLE public.marcador OWNER TO pato;

--
-- Name: marcador_auxilia_diagnóstico; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public."marcador_auxilia_diagnóstico" (
    id_marcador integer NOT NULL,
    id_amostra integer NOT NULL,
    unidade text,
    valor_medido text,
    tecido_de_origem text
);


ALTER TABLE public."marcador_auxilia_diagnóstico" OWNER TO pato;

--
-- Name: marcador_id_marcador_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.marcador_id_marcador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marcador_id_marcador_seq OWNER TO pato;

--
-- Name: marcador_id_marcador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.marcador_id_marcador_seq OWNED BY public.marcador.id_marcador;


--
-- Name: mirnas; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.mirnas (
    ensembl_gene_id text,
    hgnc_id text,
    external_gene_name text,
    mirbase_id text,
    chromosome_name text,
    start_position text,
    end_position text,
    strand text,
    source text,
    status text,
    version text,
    gene_biotype text,
    montagem integer,
    referencia text
);


ALTER TABLE public.mirnas OWNER TO pato;

--
-- Name: mutacao_estrutural_to_from_gene_em_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.mutacao_estrutural_to_from_gene_em_amostra (
    id_exp_mut_somatica integer,
    id_gene_from integer,
    id_gene_to integer,
    id_amostra_controle integer,
    id_amostra_experimental integer,
    variant_type text,
    sv_id text,
    placement text,
    annotation text,
    interpreted_annotation text,
    chr_from_bkpt integer,
    chr_from_range integer,
    chr_from_flanking_seq text,
    chr_to_bkpt integer,
    chr_to_range integer,
    chr_to_flanking_seq text,
    microhomology_sequence text,
    non_templated_sequence text,
    evidence text,
    quality_score text,
    probability text,
    zygosity text,
    verification_status text,
    verification_platform text,
    bkpt_from_context text,
    bkpt_to_context text
);


ALTER TABLE public.mutacao_estrutural_to_from_gene_em_amostra OWNER TO pato;

--
-- Name: mutacao_simples_avalia_gene_em_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.mutacao_simples_avalia_gene_em_amostra (
    id_amostra_experimental integer,
    id_amostra_controle integer,
    id_gene integer,
    id_exp_mut_somatica integer,
    chromossomo text,
    chromossomo_inicio integer,
    chromossomo_fim integer,
    fita text,
    mutation_type text,
    reference_genome_allele text,
    mutated_from_allele text,
    mutated_to_allele text,
    quality_score text,
    probability text,
    total_read_count integer,
    mutant_allele_read_count text,
    verification_status text,
    verification_platform text,
    biological_validation_status text,
    biological_validation_platform text,
    consequence_type text,
    aa_mutation text,
    cds_mutation text,
    id_gene_ref integer
);


ALTER TABLE public.mutacao_simples_avalia_gene_em_amostra OWNER TO pato;

--
-- Name: mutacao_var_copias_afeta_gene_em_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.mutacao_var_copias_afeta_gene_em_amostra (
    id_exp_mut_somatica integer,
    id_gene integer,
    identificador_no_banco_de_origem text,
    mutation_type text,
    copy_number text,
    segment_mean text,
    segment_median text,
    chromosome_start integer,
    chromosome_end integer,
    chromosome_start_range text,
    chromosome_end_range text,
    start_probe_id text,
    end_probe_id text,
    minor_allele integer,
    quality_score text,
    probability text,
    is_annotated text,
    verification_status text,
    verification_platform text
);


ALTER TABLE public.mutacao_var_copias_afeta_gene_em_amostra OWNER TO pato;

--
-- Name: paciente; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.paciente (
    id_paciente integer NOT NULL,
    banco_de_origem text,
    versao_do_banco_de_origem text,
    donor_id_banco_de_origem text,
    project_code text,
    study_donor_involved_in text,
    submitted_donor_id text,
    donor_sex text,
    donor_vital_status text,
    disease_status_last_followup text,
    donor_relapse_type text,
    donor_age_at_diagnosis_inicial text,
    donor_age_at_enrollment integer,
    donor_age_at_last_followup integer,
    donor_relapse_interval integer,
    donor_diagnosis_icd10_inicial text,
    donor_tumour_staging_system_at_diagnosis_inicial text,
    donor_tumour_stage_at_diagnosis_inicial text,
    donor_tumour_stage_at_diagnosis_supplemental_inicial text,
    donor_survival_time integer,
    donor_interval_of_last_followup integer,
    prior_malignancy text,
    cancer_type_prior_malignancy text,
    cancer_history_first_degree_relative text
);


ALTER TABLE public.paciente OWNER TO pato;

--
-- Name: paciente_id_paciente_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.paciente_id_paciente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paciente_id_paciente_seq OWNER TO pato;

--
-- Name: paciente_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.paciente_id_paciente_seq OWNED BY public.paciente.id_paciente;


--
-- Name: sequenciamento_avalia_gene_em_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.sequenciamento_avalia_gene_em_amostra (
    id_gene integer,
    id_amostra integer,
    id_exp_genica integer,
    normalized_read_count double precision,
    raw_read_count integer,
    fold_change double precision,
    base_mean double precision,
    pvalue double precision,
    p_adjusted double precision,
    lfcse double precision,
    stat double precision,
    is_isomir text,
    log2foldchange double precision,
    id_gene_ref integer
);


ALTER TABLE public.sequenciamento_avalia_gene_em_amostra OWNER TO pato;

--
-- Name: sequenciamento_avalia_transcrito_em_amostra; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.sequenciamento_avalia_transcrito_em_amostra (
    id_transcrito integer,
    id_exp_genica integer,
    normalized_read_count double precision,
    raw_read_count integer,
    fold_change double precision,
    base_mean double precision,
    pvalue double precision,
    p_adjusted double precision,
    lfcse double precision,
    stat double precision
);


ALTER TABLE public.sequenciamento_avalia_transcrito_em_amostra OWNER TO pato;

--
-- Name: transcrito; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.transcrito (
    id_transcrito integer NOT NULL,
    id_gene integer,
    banco text,
    nome_no_banco text
);


ALTER TABLE public.transcrito OWNER TO pato;

--
-- Name: transcrito_id_transcrito_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.transcrito_id_transcrito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transcrito_id_transcrito_seq OWNER TO pato;

--
-- Name: transcrito_id_transcrito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.transcrito_id_transcrito_seq OWNED BY public.transcrito.id_transcrito;


--
-- Name: transcrito_nomeia_coordenada; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.transcrito_nomeia_coordenada (
    id_coordenada integer,
    id_transcrito integer
);


ALTER TABLE public.transcrito_nomeia_coordenada OWNER TO pato;

--
-- Name: transcritos_v37; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.transcritos_v37 (
    ensembl_gene_id text,
    ensembl_transcript_id text,
    chromosome_name text,
    start_position text,
    end_position text,
    strand text,
    band text,
    transcript_start integer,
    transcript_end integer,
    transcription_start_site integer,
    transcript_length integer,
    transcript_biotype text,
    transcript_source text,
    transcript_status text,
    transcript_version text,
    mirbase_trans_name text,
    refseq_mrna text,
    refseq_ncrna text,
    montagem integer,
    referencia text
);


ALTER TABLE public.transcritos_v37 OWNER TO pato;

--
-- Name: transcritos_v38; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.transcritos_v38 (
    ensembl_gene_id text,
    ensembl_transcript_id text,
    chromosome_name text,
    start_position text,
    end_position text,
    strand text,
    band text,
    transcript_start integer,
    transcript_end integer,
    transcription_start_site integer,
    transcript_length integer,
    transcript_biotype text,
    transcript_source text,
    transcript_status text,
    transcript_version text,
    mirbase_trans_name text,
    refseq_mrna text,
    refseq_ncrna text,
    montagem integer,
    referencia text
);


ALTER TABLE public.transcritos_v38 OWNER TO pato;

--
-- Name: tratamento; Type: TABLE; Schema: public; Owner: pato
--

CREATE TABLE public.tratamento (
    id_tratamento integer NOT NULL,
    id_paciente integer,
    donor_id_banco_de_origem text,
    data_do_primeiro_tratamento date,
    first_therapy_type text,
    first_therapy_therapeutic_intent text,
    first_therapy_start_interval text,
    first_therapy_duration text,
    first_therapy_response text,
    data_do_segundo_tratamento date,
    second_therapy_type text,
    second_therapy_therapeutic_intent text,
    second_therapy_start_interval text,
    second_therapy_duration text,
    second_therapy_response text,
    other_therapy text,
    other_therapy_response text
);


ALTER TABLE public.tratamento OWNER TO pato;

--
-- Name: tratamento_id_tratamento_seq; Type: SEQUENCE; Schema: public; Owner: pato
--

CREATE SEQUENCE public.tratamento_id_tratamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tratamento_id_tratamento_seq OWNER TO pato;

--
-- Name: tratamento_id_tratamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pato
--

ALTER SEQUENCE public.tratamento_id_tratamento_seq OWNED BY public.tratamento.id_tratamento;


--
-- Name: id_amostra; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.amostra ALTER COLUMN id_amostra SET DEFAULT nextval('public.amostra_id_amostra_seq'::regclass);


--
-- Name: id_banco; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.banco_de_anotacao ALTER COLUMN id_banco SET DEFAULT nextval('public.banco_de_anotacao_id_banco_seq'::regclass);


--
-- Name: id_coordenada; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.coordenada_gene ALTER COLUMN id_coordenada SET DEFAULT nextval('public.coordenada_gene_id_coordenada_seq'::regclass);


--
-- Name: id_coordenada; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.coordenada_transcrito ALTER COLUMN id_coordenada SET DEFAULT nextval('public.coordenada_transcrito_id_coordenada_seq'::regclass);


--
-- Name: id_diagnostico; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.diagnostico ALTER COLUMN id_diagnostico SET DEFAULT nextval('public.diagnostico_id_diagnostico_seq'::regclass);


--
-- Name: id_especime; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.especime ALTER COLUMN id_especime SET DEFAULT nextval('public.especime_id_especime_seq'::regclass);


--
-- Name: id_exon; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.exon ALTER COLUMN id_exon SET DEFAULT nextval('public.exon_id_exon_seq'::regclass);


--
-- Name: id_experim_variacao_splicing; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_utiliza_amostra ALTER COLUMN id_experim_variacao_splicing SET DEFAULT nextval('public.experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq'::regclass);


--
-- Name: id_exp_genica; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experimento_de_expressao_genica ALTER COLUMN id_exp_genica SET DEFAULT nextval('public.experimento_de_expressao_genica_id_exp_genica_seq'::regclass);


--
-- Name: id_exp_mut_somatica; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experimento_de_mutacao_somatica ALTER COLUMN id_exp_mut_somatica SET DEFAULT nextval('public.experimento_de_mutacao_somatica_id_exp_mut_somatica_seq'::regclass);


--
-- Name: id_experimento_redes_genicas; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experimento_de_redes_genicas ALTER COLUMN id_experimento_redes_genicas SET DEFAULT nextval('public.experimento_de_redes_genicas_id_experimento_redes_genicas_seq'::regclass);


--
-- Name: id_experim_variacao_splicing; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experimento_de_variacao_de_splicing ALTER COLUMN id_experim_variacao_splicing SET DEFAULT nextval('public.experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq'::regclass);


--
-- Name: id_exposicao; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.exposicao ALTER COLUMN id_exposicao SET DEFAULT nextval('public.exposicao_id_exposicao_seq'::regclass);


--
-- Name: id_exp_proteica; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.expressao_proteica ALTER COLUMN id_exp_proteica SET DEFAULT nextval('public.expressao_proteica_id_exp_proteica_seq'::regclass);


--
-- Name: id_gene; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene ALTER COLUMN id_gene SET DEFAULT nextval('public.gene_id_gene_seq'::regclass);


--
-- Name: id_gene_alias; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene_alias ALTER COLUMN id_gene_alias SET DEFAULT nextval('public.gene_alias_id_gene_alias_seq'::regclass);


--
-- Name: id_gene_ref; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene_referencia ALTER COLUMN id_gene_ref SET DEFAULT nextval('public.gene_referencia_id_gene_ref_seq'::regclass);


--
-- Name: chave_serial; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.icgc_simple_somatic_mutation ALTER COLUMN chave_serial SET DEFAULT nextval('public.icgc_simple_somatic_mutation_chave_serial_seq'::regclass);


--
-- Name: id_marcador; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.marcador ALTER COLUMN id_marcador SET DEFAULT nextval('public.marcador_id_marcador_seq'::regclass);


--
-- Name: id_paciente; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('public.paciente_id_paciente_seq'::regclass);


--
-- Name: id_transcrito; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.transcrito ALTER COLUMN id_transcrito SET DEFAULT nextval('public.transcrito_id_transcrito_seq'::regclass);


--
-- Name: id_tratamento; Type: DEFAULT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.tratamento ALTER COLUMN id_tratamento SET DEFAULT nextval('public.tratamento_id_tratamento_seq'::regclass);


--
-- Name: amostra_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.amostra
    ADD CONSTRAINT amostra_pkey PRIMARY KEY (id_amostra);


--
-- Name: banco_de_anotacao_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.banco_de_anotacao
    ADD CONSTRAINT banco_de_anotacao_pkey PRIMARY KEY (id_banco);


--
-- Name: coordenada_gene_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.coordenada_gene
    ADD CONSTRAINT coordenada_gene_pkey PRIMARY KEY (id_coordenada);


--
-- Name: coordenada_transcrito_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.coordenada_transcrito
    ADD CONSTRAINT coordenada_transcrito_pkey PRIMARY KEY (id_coordenada);


--
-- Name: diagnostico_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico);


--
-- Name: especime_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.especime
    ADD CONSTRAINT especime_pkey PRIMARY KEY (id_especime);


--
-- Name: exon_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.exon
    ADD CONSTRAINT exon_pkey PRIMARY KEY (id_exon);


--
-- Name: exp_expressao_genica_utiliza_amostra; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_express_genica_utiliza_amostra
    ADD CONSTRAINT exp_expressao_genica_utiliza_amostra PRIMARY KEY (id_exp_genica, id_amostra);


--
-- Name: experim_variacao_de_splicing_utiliza_amostra_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_utiliza_amostra
    ADD CONSTRAINT experim_variacao_de_splicing_utiliza_amostra_pkey PRIMARY KEY (id_experim_variacao_splicing);


--
-- Name: experimento_de_expressao_genica_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experimento_de_expressao_genica
    ADD CONSTRAINT experimento_de_expressao_genica_pkey PRIMARY KEY (id_exp_genica);


--
-- Name: experimento_de_mutacao_somatica_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experimento_de_mutacao_somatica
    ADD CONSTRAINT experimento_de_mutacao_somatica_pkey PRIMARY KEY (id_exp_mut_somatica);


--
-- Name: experimento_de_redes_genicas_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experimento_de_redes_genicas
    ADD CONSTRAINT experimento_de_redes_genicas_pkey PRIMARY KEY (id_experimento_redes_genicas);


--
-- Name: experimento_de_variacao_de_splicing_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experimento_de_variacao_de_splicing
    ADD CONSTRAINT experimento_de_variacao_de_splicing_pkey PRIMARY KEY (id_experim_variacao_splicing);


--
-- Name: exposicao_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.exposicao
    ADD CONSTRAINT exposicao_pkey PRIMARY KEY (id_exposicao);


--
-- Name: expressao_proteica_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.expressao_proteica
    ADD CONSTRAINT expressao_proteica_pkey PRIMARY KEY (id_exp_proteica);


--
-- Name: gene_alias_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene_alias
    ADD CONSTRAINT gene_alias_pkey PRIMARY KEY (id_gene_alias);


--
-- Name: gene_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene
    ADD CONSTRAINT gene_pkey PRIMARY KEY (id_gene);


--
-- Name: gene_referencia_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene_referencia
    ADD CONSTRAINT gene_referencia_pkey PRIMARY KEY (id_gene_ref);


--
-- Name: icgc_donor_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.icgc_donor
    ADD CONSTRAINT icgc_donor_pkey PRIMARY KEY (icgc_donor_id);


--
-- Name: icgc_protein_expression_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.icgc_protein_expression
    ADD CONSTRAINT icgc_protein_expression_pkey PRIMARY KEY (icgc_sample_id, normalized_expression_level, analysis_id, antibody_id);


--
-- Name: icgc_sample_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.icgc_sample
    ADD CONSTRAINT icgc_sample_pkey PRIMARY KEY (icgc_sample_id);


--
-- Name: icgc_specimen_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.icgc_specimen
    ADD CONSTRAINT icgc_specimen_pkey PRIMARY KEY (submitted_specimen_id, project_code);


--
-- Name: marcador_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.marcador
    ADD CONSTRAINT marcador_pkey PRIMARY KEY (id_marcador);


--
-- Name: paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente);


--
-- Name: pk_coordenada_exon; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.coordenada_exon
    ADD CONSTRAINT pk_coordenada_exon PRIMARY KEY (versao_montagem, fonte_montagem, cromossomo, inicio, fim, fita);


--
-- Name: pk_marcador_auxilia_diagnóstico; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public."marcador_auxilia_diagnóstico"
    ADD CONSTRAINT "pk_marcador_auxilia_diagnóstico" PRIMARY KEY (id_marcador, id_amostra);


--
-- Name: transcrito_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.transcrito
    ADD CONSTRAINT transcrito_pkey PRIMARY KEY (id_transcrito);


--
-- Name: tratamento_pkey; Type: CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.tratamento
    ADD CONSTRAINT tratamento_pkey PRIMARY KEY (id_tratamento);


--
-- Name: amostra_id_especime_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.amostra
    ADD CONSTRAINT amostra_id_especime_fkey FOREIGN KEY (id_especime) REFERENCES public.especime(id_especime);


--
-- Name: amostra_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.amostra
    ADD CONSTRAINT amostra_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- Name: coordenada_gene_id_gene_ref_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.coordenada_gene
    ADD CONSTRAINT coordenada_gene_id_gene_ref_fkey FOREIGN KEY (id_gene_ref) REFERENCES public.gene_referencia(id_gene_ref);


--
-- Name: diagnostico_id_especime_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_id_especime_fkey FOREIGN KEY (id_especime) REFERENCES public.especime(id_especime);


--
-- Name: diagnostico_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- Name: especime_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.especime
    ADD CONSTRAINT especime_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- Name: exon_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.exon
    ADD CONSTRAINT exon_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- Name: exon_id_transcrito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.exon
    ADD CONSTRAINT exon_id_transcrito_fkey FOREIGN KEY (id_transcrito) REFERENCES public.transcrito(id_transcrito);


--
-- Name: experim_express_genica_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_express_genica_utiliza_amostra
    ADD CONSTRAINT experim_express_genica_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- Name: experim_express_genica_utiliza_amostra_id_exp_genica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_express_genica_utiliza_amostra
    ADD CONSTRAINT experim_express_genica_utiliza_amostra_id_exp_genica_fkey FOREIGN KEY (id_exp_genica) REFERENCES public.experimento_de_expressao_genica(id_exp_genica);


--
-- Name: experim_express_proteica_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_express_proteica_utiliza_amostra
    ADD CONSTRAINT experim_express_proteica_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- Name: experim_express_proteica_utiliza_amostra_id_exp_proteica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_express_proteica_utiliza_amostra
    ADD CONSTRAINT experim_express_proteica_utiliza_amostra_id_exp_proteica_fkey FOREIGN KEY (id_exp_proteica) REFERENCES public.expressao_proteica(id_exp_proteica);


--
-- Name: experim_mutacao_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_mutacao_utiliza_amostra
    ADD CONSTRAINT experim_mutacao_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- Name: experim_mutacao_utiliza_amostra_id_exp_mut_somatica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_mutacao_utiliza_amostra
    ADD CONSTRAINT experim_mutacao_utiliza_amostra_id_exp_mut_somatica_fkey FOREIGN KEY (id_exp_mut_somatica) REFERENCES public.experimento_de_mutacao_somatica(id_exp_mut_somatica);


--
-- Name: experim_redes_genicas_analisa_gene_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_redes_genicas_analisa_gene
    ADD CONSTRAINT experim_redes_genicas_analisa_gene_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- Name: experim_redes_genicas_analisa_id_experimento_redes_genicas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_redes_genicas_analisa_gene
    ADD CONSTRAINT experim_redes_genicas_analisa_id_experimento_redes_genicas_fkey FOREIGN KEY (id_experimento_redes_genicas) REFERENCES public.experimento_de_redes_genicas(id_experimento_redes_genicas);


--
-- Name: experim_redes_genicas_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_redes_genicas_utiliza_amostra
    ADD CONSTRAINT experim_redes_genicas_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- Name: experim_redes_genicas_utiliza_id_experimento_redes_genicas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_redes_genicas_utiliza_amostra
    ADD CONSTRAINT experim_redes_genicas_utiliza_id_experimento_redes_genicas_fkey FOREIGN KEY (id_experimento_redes_genicas) REFERENCES public.experimento_de_redes_genicas(id_experimento_redes_genicas);


--
-- Name: experim_variacao_de_splicing__id_experim_variacao_splicing_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_utiliza_amostra
    ADD CONSTRAINT experim_variacao_de_splicing__id_experim_variacao_splicing_fkey FOREIGN KEY (id_experim_variacao_splicing) REFERENCES public.experimento_de_variacao_de_splicing(id_experim_variacao_splicing);


--
-- Name: experim_variacao_de_splicing_analisa_transcr_id_transcrito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_analisa_transcrito_em_amostra
    ADD CONSTRAINT experim_variacao_de_splicing_analisa_transcr_id_transcrito_fkey FOREIGN KEY (id_transcrito) REFERENCES public.transcrito(id_transcrito);


--
-- Name: experim_variacao_de_splicing_id_experim_variacao_splicing_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_analisa_transcrito_em_amostra
    ADD CONSTRAINT experim_variacao_de_splicing_id_experim_variacao_splicing_fkey1 FOREIGN KEY (id_experim_variacao_splicing) REFERENCES public.experimento_de_variacao_de_splicing(id_experim_variacao_splicing);


--
-- Name: experim_variacao_de_splicing_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_utiliza_amostra
    ADD CONSTRAINT experim_variacao_de_splicing_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- Name: exposicao_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.exposicao
    ADD CONSTRAINT exposicao_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- Name: expressao_microarray_avalia_gene_em_amostra_id_exp_genica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.expressao_microarray_avalia_gene_em_amostra
    ADD CONSTRAINT expressao_microarray_avalia_gene_em_amostra_id_exp_genica_fkey FOREIGN KEY (id_exp_genica) REFERENCES public.experimento_de_expressao_genica(id_exp_genica);


--
-- Name: expressao_microarray_avalia_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.expressao_microarray_avalia_gene_em_amostra
    ADD CONSTRAINT expressao_microarray_avalia_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- Name: expressao_proteica_diz_respeito_a_gene_em__id_exp_proteica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.expressao_proteica_diz_respeito_a_gene_em_amostra
    ADD CONSTRAINT expressao_proteica_diz_respeito_a_gene_em__id_exp_proteica_fkey FOREIGN KEY (id_exp_proteica) REFERENCES public.expressao_proteica(id_exp_proteica);


--
-- Name: expressao_proteica_diz_respeito_a_gene_em_amost_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.expressao_proteica_diz_respeito_a_gene_em_amostra
    ADD CONSTRAINT expressao_proteica_diz_respeito_a_gene_em_amost_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- Name: expressao_proteica_diz_respeito_a_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.expressao_proteica_diz_respeito_a_gene_em_amostra
    ADD CONSTRAINT expressao_proteica_diz_respeito_a_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- Name: expressao_proteica_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.expressao_proteica
    ADD CONSTRAINT expressao_proteica_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- Name: familiar_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.familiar
    ADD CONSTRAINT familiar_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- Name: gene_alias_id_banco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene_alias
    ADD CONSTRAINT gene_alias_id_banco_fkey FOREIGN KEY (id_banco) REFERENCES public.banco_de_anotacao(id_banco);


--
-- Name: gene_alias_id_gene_ref_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene_alias
    ADD CONSTRAINT gene_alias_id_gene_ref_fkey FOREIGN KEY (id_gene_ref) REFERENCES public.gene_referencia(id_gene_ref);


--
-- Name: gene_id_banco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene
    ADD CONSTRAINT gene_id_banco_fkey FOREIGN KEY (id_banco) REFERENCES public.banco_de_anotacao(id_banco);


--
-- Name: gene_nomeia_coordenada_id_coordenada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene_nomeia_coordenada
    ADD CONSTRAINT gene_nomeia_coordenada_id_coordenada_fkey FOREIGN KEY (id_coordenada) REFERENCES public.coordenada_gene(id_coordenada);


--
-- Name: gene_nomeia_coordenada_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene_nomeia_coordenada
    ADD CONSTRAINT gene_nomeia_coordenada_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- Name: gene_referencia_id_banco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.gene_referencia
    ADD CONSTRAINT gene_referencia_id_banco_fkey FOREIGN KEY (id_banco) REFERENCES public.banco_de_anotacao(id_banco);


--
-- Name: marcador_auxilia_diagnóstico_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public."marcador_auxilia_diagnóstico"
    ADD CONSTRAINT "marcador_auxilia_diagnóstico_id_amostra_fkey" FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- Name: marcador_auxilia_diagnóstico_id_marcador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public."marcador_auxilia_diagnóstico"
    ADD CONSTRAINT "marcador_auxilia_diagnóstico_id_marcador_fkey" FOREIGN KEY (id_marcador) REFERENCES public.marcador(id_marcador);


--
-- Name: mutacao_estrutural_to_from_gene_em_amo_id_amostra_controle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_amo_id_amostra_controle_fkey FOREIGN KEY (id_amostra_controle) REFERENCES public.amostra(id_amostra);


--
-- Name: mutacao_estrutural_to_from_gene_em_amo_id_exp_mut_somatica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_amo_id_exp_mut_somatica_fkey FOREIGN KEY (id_exp_mut_somatica) REFERENCES public.experimento_de_mutacao_somatica(id_exp_mut_somatica);


--
-- Name: mutacao_estrutural_to_from_gene_em_amostra_id_gene_from_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_amostra_id_gene_from_fkey FOREIGN KEY (id_gene_from) REFERENCES public.gene(id_gene);


--
-- Name: mutacao_estrutural_to_from_gene_em_amostra_id_gene_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_amostra_id_gene_to_fkey FOREIGN KEY (id_gene_to) REFERENCES public.gene(id_gene);


--
-- Name: mutacao_estrutural_to_from_gene_em_id_amostra_experimental_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_id_amostra_experimental_fkey FOREIGN KEY (id_amostra_experimental) REFERENCES public.amostra(id_amostra);


--
-- Name: mutacao_simples_avalia_gene_em_amo_id_amostra_experimental_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_simples_avalia_gene_em_amostra
    ADD CONSTRAINT mutacao_simples_avalia_gene_em_amo_id_amostra_experimental_fkey FOREIGN KEY (id_amostra_experimental) REFERENCES public.amostra(id_amostra);


--
-- Name: mutacao_simples_avalia_gene_em_amostra_id_amostra_controle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_simples_avalia_gene_em_amostra
    ADD CONSTRAINT mutacao_simples_avalia_gene_em_amostra_id_amostra_controle_fkey FOREIGN KEY (id_amostra_controle) REFERENCES public.amostra(id_amostra);


--
-- Name: mutacao_simples_avalia_gene_em_amostra_id_exp_mut_somatica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_simples_avalia_gene_em_amostra
    ADD CONSTRAINT mutacao_simples_avalia_gene_em_amostra_id_exp_mut_somatica_fkey FOREIGN KEY (id_exp_mut_somatica) REFERENCES public.experimento_de_mutacao_somatica(id_exp_mut_somatica);


--
-- Name: mutacao_simples_avalia_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_simples_avalia_gene_em_amostra
    ADD CONSTRAINT mutacao_simples_avalia_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- Name: mutacao_var_copias_afeta_gene_em_amost_id_exp_mut_somatica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_var_copias_afeta_gene_em_amostra
    ADD CONSTRAINT mutacao_var_copias_afeta_gene_em_amost_id_exp_mut_somatica_fkey FOREIGN KEY (id_exp_mut_somatica) REFERENCES public.experimento_de_mutacao_somatica(id_exp_mut_somatica);


--
-- Name: mutacao_var_copias_afeta_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.mutacao_var_copias_afeta_gene_em_amostra
    ADD CONSTRAINT mutacao_var_copias_afeta_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- Name: sequenciamento_avalia_gene_em_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.sequenciamento_avalia_gene_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_gene_em_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- Name: sequenciamento_avalia_gene_em_amostra_id_exp_genica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.sequenciamento_avalia_gene_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_gene_em_amostra_id_exp_genica_fkey FOREIGN KEY (id_exp_genica) REFERENCES public.experimento_de_expressao_genica(id_exp_genica);


--
-- Name: sequenciamento_avalia_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.sequenciamento_avalia_gene_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- Name: sequenciamento_avalia_transcrito_em_amostra_id_exp_genica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.sequenciamento_avalia_transcrito_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_transcrito_em_amostra_id_exp_genica_fkey FOREIGN KEY (id_exp_genica) REFERENCES public.experimento_de_expressao_genica(id_exp_genica);


--
-- Name: sequenciamento_avalia_transcrito_em_amostra_id_transcrito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.sequenciamento_avalia_transcrito_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_transcrito_em_amostra_id_transcrito_fkey FOREIGN KEY (id_transcrito) REFERENCES public.transcrito(id_transcrito);


--
-- Name: transcrito_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.transcrito
    ADD CONSTRAINT transcrito_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- Name: transcrito_nomeia_coordenada_id_coordenada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.transcrito_nomeia_coordenada
    ADD CONSTRAINT transcrito_nomeia_coordenada_id_coordenada_fkey FOREIGN KEY (id_coordenada) REFERENCES public.coordenada_transcrito(id_coordenada);


--
-- Name: transcrito_nomeia_coordenada_id_transcrito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.transcrito_nomeia_coordenada
    ADD CONSTRAINT transcrito_nomeia_coordenada_id_transcrito_fkey FOREIGN KEY (id_transcrito) REFERENCES public.transcrito(id_transcrito);


--
-- Name: tratamento_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pato
--

ALTER TABLE ONLY public.tratamento
    ADD CONSTRAINT tratamento_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

