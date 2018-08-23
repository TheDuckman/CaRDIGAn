--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

-- Started on 2018-05-03 15:59:09 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2675 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 779 (class 1247 OID 16973)
-- Name: alcohol_history; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.alcohol_history AS ENUM (
    'yes',
    'no',
    'Don''t know/Not sure',
    ''
);


--
-- TOC entry 782 (class 1247 OID 16982)
-- Name: annotation_type; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 785 (class 1247 OID 17004)
-- Name: assembly_version; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.assembly_version AS ENUM (
    'GRCh37',
    ''
);


--
-- TOC entry 788 (class 1247 OID 17010)
-- Name: biological_validation_status; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 791 (class 1247 OID 17026)
-- Name: biomarker_positive; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.biomarker_positive AS ENUM (
    'ambiguous',
    'absent',
    'present',
    ''
);


--
-- TOC entry 794 (class 1247 OID 17036)
-- Name: cancer_history_first_degree_relative; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.cancer_history_first_degree_relative AS ENUM (
    'no',
    'unknown',
    'yes',
    ''
);


--
-- TOC entry 797 (class 1247 OID 17046)
-- Name: cellularity; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.cellularity AS ENUM (
    '1-20%',
    '21-40%',
    '41-60%',
    '61-80%',
    '>81%',
    ''
);


--
-- TOC entry 800 (class 1247 OID 17060)
-- Name: chromosome; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 803 (class 1247 OID 17114)
-- Name: chromosome_strand; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.chromosome_strand AS ENUM (
    '-1',
    '1',
    ''
);


--
-- TOC entry 806 (class 1247 OID 17122)
-- Name: consequence_type_value; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 809 (class 1247 OID 17178)
-- Name: disease_followup_status; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 812 (class 1247 OID 17194)
-- Name: donor_has_relative_with_cancer_history; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.donor_has_relative_with_cancer_history AS ENUM (
    'no',
    'unknown',
    'yes',
    ''
);


--
-- TOC entry 815 (class 1247 OID 17204)
-- Name: donor_relapse_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.donor_relapse_type AS ENUM (
    'local recurrence',
    'distant recurrence/metastasis',
    'progression (liquid tumours)',
    'local recurrence and distant metastasis',
    ''
);


--
-- TOC entry 818 (class 1247 OID 17216)
-- Name: donor_sex; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.donor_sex AS ENUM (
    'male',
    'female',
    'unknown',
    ''
);


--
-- TOC entry 821 (class 1247 OID 17226)
-- Name: donor_vital_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.donor_vital_status AS ENUM (
    'alive',
    'deceased',
    ''
);


--
-- TOC entry 619 (class 1247 OID 16396)
-- Name: experimento_de_expressao; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.experimento_de_expressao AS ENUM (
    'RNAseq',
    'Microarray',
    'miRNAseq'
);


--
-- TOC entry 616 (class 1247 OID 16389)
-- Name: experimento_de_mutacao; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.experimento_de_mutacao AS ENUM (
    'estrutural',
    'variacao_de_copias',
    'simples'
);


--
-- TOC entry 622 (class 1247 OID 16404)
-- Name: fita; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.fita AS ENUM (
    '-1',
    '1'
);


--
-- TOC entry 824 (class 1247 OID 17234)
-- Name: gene_db; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.gene_db AS ENUM (
    'Ensembl',
    'GAF',
    'RefSeq',
    ''
);


--
-- TOC entry 902 (class 1247 OID 17896)
-- Name: icgc_zygosity; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.icgc_zygosity AS ENUM (
    'homozygous',
    'heterozygous',
    'hemizygous',
    'nullizygous',
    ''
);


--
-- TOC entry 827 (class 1247 OID 17244)
-- Name: is_annotated; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.is_annotated AS ENUM (
    'not annotated',
    'annotated',
    ''
);


--
-- TOC entry 830 (class 1247 OID 17252)
-- Name: is_isomir; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.is_isomir AS ENUM (
    'yes',
    'no',
    'unknown',
    ''
);


--
-- TOC entry 833 (class 1247 OID 17262)
-- Name: junction_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.junction_type AS ENUM (
    'canonical',
    'non-canonical',
    'U12',
    ''
);


--
-- TOC entry 836 (class 1247 OID 17272)
-- Name: mirna_db; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.mirna_db AS ENUM (
    'miRBase',
    ''
);


--
-- TOC entry 839 (class 1247 OID 17278)
-- Name: mutation_type; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 842 (class 1247 OID 17296)
-- Name: mutation_type_simple; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.mutation_type_simple AS ENUM (
    'single base substitution',
    'insertion of <=200bp',
    'deletion of <=200bp',
    'multiple base substitution (>=2bp and <=200bp)',
    ''
);


--
-- TOC entry 845 (class 1247 OID 17308)
-- Name: platform; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 848 (class 1247 OID 17482)
-- Name: prior_malignancy; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.prior_malignancy AS ENUM (
    'yes',
    'no',
    'unknown',
    ''
);


--
-- TOC entry 851 (class 1247 OID 17492)
-- Name: procedure_type; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 854 (class 1247 OID 17512)
-- Name: raw_data_repository; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 857 (class 1247 OID 17530)
-- Name: reference_sample_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.reference_sample_type AS ENUM (
    'matched normal',
    'unrelated normal',
    'cell line derived from matched normal',
    'pooled samples',
    'other',
    ''
);


--
-- TOC entry 860 (class 1247 OID 17544)
-- Name: relationship_sex; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.relationship_sex AS ENUM (
    'male',
    'female',
    'unknown',
    ''
);


--
-- TOC entry 863 (class 1247 OID 17554)
-- Name: relationship_type; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 866 (class 1247 OID 17572)
-- Name: resection_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.resection_status AS ENUM (
    'R0 - no apparent residual disease',
    'R1 - microscopic residual disease.',
    'R2 - gross residual disease.',
    ''
);


--
-- TOC entry 869 (class 1247 OID 17582)
-- Name: sequencing_strategies; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.sequencing_strategies AS ENUM (
    'non-NGS',
    'WGS',
    ''
);


--
-- TOC entry 872 (class 1247 OID 17590)
-- Name: sequencing_strategy; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 875 (class 1247 OID 17654)
-- Name: specimen_donor_treatment_type; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 878 (class 1247 OID 17680)
-- Name: specimen_processing; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 881 (class 1247 OID 17710)
-- Name: specimen_storage; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 884 (class 1247 OID 17728)
-- Name: specimen_type; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 887 (class 1247 OID 17792)
-- Name: therapeutic_intent; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.therapeutic_intent AS ENUM (
    'not applicable',
    'adjuvant',
    'curative',
    'palliative',
    ''
);


--
-- TOC entry 890 (class 1247 OID 17804)
-- Name: therapy_response; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.therapy_response AS ENUM (
    'complete response',
    'disease progression',
    'partial response',
    'stable disease',
    'unknown',
    ''
);


--
-- TOC entry 893 (class 1247 OID 17818)
-- Name: therapy_type; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 625 (class 1247 OID 16410)
-- Name: tipo_amostra; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.tipo_amostra AS ENUM (
    'tumor',
    'controle'
);


--
-- TOC entry 896 (class 1247 OID 17844)
-- Name: variant_type; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 899 (class 1247 OID 17888)
-- Name: yes_no; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.yes_no AS ENUM (
    'yes',
    'no',
    ''
);


SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 16548)
-- Name: amostra; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 198 (class 1259 OID 16546)
-- Name: amostra_id_amostra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.amostra_id_amostra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2676 (class 0 OID 0)
-- Dependencies: 198
-- Name: amostra_id_amostra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.amostra_id_amostra_seq OWNED BY public.amostra.id_amostra;


--
-- TOC entry 193 (class 1259 OID 16511)
-- Name: coordenada_exon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coordenada_exon (
    versao_montagem text NOT NULL,
    fonte_montagem text NOT NULL,
    cromossomo text NOT NULL,
    inicio integer NOT NULL,
    fim integer NOT NULL,
    fita text NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 16428)
-- Name: coordenada_gene; Type: TABLE; Schema: public; Owner: -
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
    gene_biotype text
);


--
-- TOC entry 183 (class 1259 OID 16426)
-- Name: coordenada_gene_id_coordenada_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.coordenada_gene_id_coordenada_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2677 (class 0 OID 0)
-- Dependencies: 183
-- Name: coordenada_gene_id_coordenada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.coordenada_gene_id_coordenada_seq OWNED BY public.coordenada_gene.id_coordenada;


--
-- TOC entry 189 (class 1259 OID 16468)
-- Name: coordenada_transcrito; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 188 (class 1259 OID 16466)
-- Name: coordenada_transcrito_id_coordenada_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.coordenada_transcrito_id_coordenada_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2678 (class 0 OID 0)
-- Dependencies: 188
-- Name: coordenada_transcrito_id_coordenada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.coordenada_transcrito_id_coordenada_seq OWNED BY public.coordenada_transcrito.id_coordenada;


--
-- TOC entry 201 (class 1259 OID 16569)
-- Name: diagnostico; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 200 (class 1259 OID 16567)
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diagnostico_id_diagnostico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2679 (class 0 OID 0)
-- Dependencies: 200
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diagnostico_id_diagnostico_seq OWNED BY public.diagnostico.id_diagnostico;


--
-- TOC entry 197 (class 1259 OID 16532)
-- Name: especime; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 196 (class 1259 OID 16530)
-- Name: especime_id_especime_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.especime_id_especime_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 196
-- Name: especime_id_especime_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.especime_id_especime_seq OWNED BY public.especime.id_especime;


--
-- TOC entry 192 (class 1259 OID 16492)
-- Name: exon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exon (
    id_exon integer NOT NULL,
    id_transcrito integer,
    id_gene integer,
    banco text,
    nome_no_banco text
);


--
-- TOC entry 191 (class 1259 OID 16490)
-- Name: exon_id_exon_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exon_id_exon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 191
-- Name: exon_id_exon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exon_id_exon_seq OWNED BY public.exon.id_exon;


--
-- TOC entry 217 (class 1259 OID 16771)
-- Name: experim_express_genica_utiliza_amostra; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 233 (class 1259 OID 16958)
-- Name: experim_express_proteica_utiliza_amostra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experim_express_proteica_utiliza_amostra (
    id_amostra integer,
    id_exp_proteica integer
);


--
-- TOC entry 212 (class 1259 OID 16671)
-- Name: experim_mutacao_utiliza_amostra; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 232 (class 1259 OID 16942)
-- Name: experim_redes_genicas_analisa_gene; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experim_redes_genicas_analisa_gene (
    id_gene integer,
    id_experimento_redes_genicas integer,
    conectividade double precision,
    cor text
);


--
-- TOC entry 231 (class 1259 OID 16929)
-- Name: experim_redes_genicas_utiliza_amostra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experim_redes_genicas_utiliza_amostra (
    id_experimento_redes_genicas integer,
    id_amostra integer
);


--
-- TOC entry 228 (class 1259 OID 16902)
-- Name: experim_variacao_de_splicing_analisa_transcrito_em_amostra; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 227 (class 1259 OID 16886)
-- Name: experim_variacao_de_splicing_utiliza_amostra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experim_variacao_de_splicing_utiliza_amostra (
    id_experim_variacao_splicing integer NOT NULL,
    id_amostra integer
);


--
-- TOC entry 226 (class 1259 OID 16884)
-- Name: experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 226
-- Name: experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq OWNED BY public.experim_variacao_de_splicing_utiliza_amostra.id_experim_variacao_splicing;


--
-- TOC entry 216 (class 1259 OID 16762)
-- Name: experimento_de_expressao_genica; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 215 (class 1259 OID 16760)
-- Name: experimento_de_expressao_genica_id_exp_genica_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.experimento_de_expressao_genica_id_exp_genica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2683 (class 0 OID 0)
-- Dependencies: 215
-- Name: experimento_de_expressao_genica_id_exp_genica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.experimento_de_expressao_genica_id_exp_genica_seq OWNED BY public.experimento_de_expressao_genica.id_exp_genica;


--
-- TOC entry 211 (class 1259 OID 16662)
-- Name: experimento_de_mutacao_somatica; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 210 (class 1259 OID 16660)
-- Name: experimento_de_mutacao_somatica_id_exp_mut_somatica_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.experimento_de_mutacao_somatica_id_exp_mut_somatica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2684 (class 0 OID 0)
-- Dependencies: 210
-- Name: experimento_de_mutacao_somatica_id_exp_mut_somatica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.experimento_de_mutacao_somatica_id_exp_mut_somatica_seq OWNED BY public.experimento_de_mutacao_somatica.id_exp_mut_somatica;


--
-- TOC entry 230 (class 1259 OID 16920)
-- Name: experimento_de_redes_genicas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experimento_de_redes_genicas (
    id_experimento_redes_genicas integer NOT NULL,
    comparacao_realizada text,
    data_do_experimento date,
    data_da_analise date,
    pessoa_responsavel text
);


--
-- TOC entry 229 (class 1259 OID 16918)
-- Name: experimento_de_redes_genicas_id_experimento_redes_genicas_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.experimento_de_redes_genicas_id_experimento_redes_genicas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 229
-- Name: experimento_de_redes_genicas_id_experimento_redes_genicas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.experimento_de_redes_genicas_id_experimento_redes_genicas_seq OWNED BY public.experimento_de_redes_genicas.id_experimento_redes_genicas;


--
-- TOC entry 225 (class 1259 OID 16875)
-- Name: experimento_de_variacao_de_splicing; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 224 (class 1259 OID 16873)
-- Name: experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 224
-- Name: experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq OWNED BY public.experimento_de_variacao_de_splicing.id_experim_variacao_splicing;


--
-- TOC entry 209 (class 1259 OID 16646)
-- Name: exposicao; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 208 (class 1259 OID 16644)
-- Name: exposicao_id_exposicao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exposicao_id_exposicao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 208
-- Name: exposicao_id_exposicao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exposicao_id_exposicao_seq OWNED BY public.exposicao.id_exposicao;


--
-- TOC entry 223 (class 1259 OID 16860)
-- Name: expressao_microarray_avalia_gene_em_amostra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expressao_microarray_avalia_gene_em_amostra (
    id_gene integer,
    id_exp_genica integer,
    normalized_expression_value double precision,
    fold_change double precision
);


--
-- TOC entry 219 (class 1259 OID 16791)
-- Name: expressao_proteica; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 220 (class 1259 OID 16805)
-- Name: expressao_proteica_diz_respeito_a_gene_em_amostra; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 218 (class 1259 OID 16789)
-- Name: expressao_proteica_id_exp_proteica_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.expressao_proteica_id_exp_proteica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 218
-- Name: expressao_proteica_id_exp_proteica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.expressao_proteica_id_exp_proteica_seq OWNED BY public.expressao_proteica.id_exp_proteica;


--
-- TOC entry 205 (class 1259 OID 16617)
-- Name: familiar; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 182 (class 1259 OID 16417)
-- Name: gene; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gene (
    id_gene integer NOT NULL,
    banco text,
    nome_no_banco text,
    banco_alias text
);


--
-- TOC entry 181 (class 1259 OID 16415)
-- Name: gene_id_gene_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gene_id_gene_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 181
-- Name: gene_id_gene_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gene_id_gene_seq OWNED BY public.gene.id_gene;


--
-- TOC entry 185 (class 1259 OID 16437)
-- Name: gene_nomeia_coordenada; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gene_nomeia_coordenada (
    id_coordenada integer,
    id_gene integer
);


--
-- TOC entry 246 (class 1259 OID 18070)
-- Name: genes_v37; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 247 (class 1259 OID 18076)
-- Name: genes_v38; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 234 (class 1259 OID 17907)
-- Name: icgc_donor; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 235 (class 1259 OID 17915)
-- Name: icgc_donor_exposure; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 236 (class 1259 OID 17921)
-- Name: icgc_donor_family; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 237 (class 1259 OID 17927)
-- Name: icgc_donor_therapy; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 239 (class 1259 OID 17953)
-- Name: icgc_exp_seq; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 240 (class 1259 OID 17965)
-- Name: icgc_protein_expression; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 238 (class 1259 OID 17933)
-- Name: icgc_sample; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 241 (class 1259 OID 17973)
-- Name: icgc_simple_somatic_mutation; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 245 (class 1259 OID 18037)
-- Name: icgc_simple_somatic_mutation_chave_serial_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.icgc_simple_somatic_mutation_chave_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 245
-- Name: icgc_simple_somatic_mutation_chave_serial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.icgc_simple_somatic_mutation_chave_serial_seq OWNED BY public.icgc_simple_somatic_mutation.chave_serial;


--
-- TOC entry 242 (class 1259 OID 17979)
-- Name: icgc_specimen; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 203 (class 1259 OID 16590)
-- Name: marcador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marcador (
    id_marcador integer NOT NULL,
    nome_marcador text,
    unidade_de_medida text
);


--
-- TOC entry 204 (class 1259 OID 16599)
-- Name: marcador_auxilia_diagnóstico; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."marcador_auxilia_diagnóstico" (
    id_marcador integer NOT NULL,
    id_amostra integer NOT NULL,
    unidade text,
    valor_medido text,
    tecido_de_origem text
);


--
-- TOC entry 202 (class 1259 OID 16588)
-- Name: marcador_id_marcador_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marcador_id_marcador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 202
-- Name: marcador_id_marcador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marcador_id_marcador_seq OWNED BY public.marcador.id_marcador;


--
-- TOC entry 248 (class 1259 OID 18084)
-- Name: mirnas; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 213 (class 1259 OID 16713)
-- Name: mutacao_estrutural_to_from_gene_em_amostra; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 249 (class 1259 OID 18103)
-- Name: mutacao_simples_avalia_gene_em_amostra; Type: TABLE; Schema: public; Owner: -
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
    cds_mutation text
);


--
-- TOC entry 214 (class 1259 OID 16744)
-- Name: mutacao_var_copias_afeta_gene_em_amostra; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 195 (class 1259 OID 16521)
-- Name: paciente; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 194 (class 1259 OID 16519)
-- Name: paciente_id_paciente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.paciente_id_paciente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 194
-- Name: paciente_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.paciente_id_paciente_seq OWNED BY public.paciente.id_paciente;


--
-- TOC entry 221 (class 1259 OID 16826)
-- Name: sequenciamento_avalia_gene_em_amostra; Type: TABLE; Schema: public; Owner: -
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
    log2foldchange double precision
);


--
-- TOC entry 222 (class 1259 OID 16847)
-- Name: sequenciamento_avalia_transcrito_em_amostra; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 187 (class 1259 OID 16452)
-- Name: transcrito; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transcrito (
    id_transcrito integer NOT NULL,
    id_gene integer,
    banco text,
    nome_no_banco text
);


--
-- TOC entry 186 (class 1259 OID 16450)
-- Name: transcrito_id_transcrito_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transcrito_id_transcrito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 186
-- Name: transcrito_id_transcrito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transcrito_id_transcrito_seq OWNED BY public.transcrito.id_transcrito;


--
-- TOC entry 190 (class 1259 OID 16477)
-- Name: transcrito_nomeia_coordenada; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transcrito_nomeia_coordenada (
    id_coordenada integer,
    id_transcrito integer
);


--
-- TOC entry 243 (class 1259 OID 18017)
-- Name: transcritos_v37; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 244 (class 1259 OID 18025)
-- Name: transcritos_v38; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 207 (class 1259 OID 16630)
-- Name: tratamento; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 206 (class 1259 OID 16628)
-- Name: tratamento_id_tratamento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tratamento_id_tratamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 206
-- Name: tratamento_id_tratamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tratamento_id_tratamento_seq OWNED BY public.tratamento.id_tratamento;


--
-- TOC entry 2439 (class 2604 OID 16551)
-- Name: id_amostra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amostra ALTER COLUMN id_amostra SET DEFAULT nextval('public.amostra_id_amostra_seq'::regclass);


--
-- TOC entry 2433 (class 2604 OID 16431)
-- Name: id_coordenada; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coordenada_gene ALTER COLUMN id_coordenada SET DEFAULT nextval('public.coordenada_gene_id_coordenada_seq'::regclass);


--
-- TOC entry 2435 (class 2604 OID 16471)
-- Name: id_coordenada; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coordenada_transcrito ALTER COLUMN id_coordenada SET DEFAULT nextval('public.coordenada_transcrito_id_coordenada_seq'::regclass);


--
-- TOC entry 2440 (class 2604 OID 16572)
-- Name: id_diagnostico; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diagnostico ALTER COLUMN id_diagnostico SET DEFAULT nextval('public.diagnostico_id_diagnostico_seq'::regclass);


--
-- TOC entry 2438 (class 2604 OID 16535)
-- Name: id_especime; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.especime ALTER COLUMN id_especime SET DEFAULT nextval('public.especime_id_especime_seq'::regclass);


--
-- TOC entry 2436 (class 2604 OID 16495)
-- Name: id_exon; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exon ALTER COLUMN id_exon SET DEFAULT nextval('public.exon_id_exon_seq'::regclass);


--
-- TOC entry 2448 (class 2604 OID 16889)
-- Name: id_experim_variacao_splicing; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_utiliza_amostra ALTER COLUMN id_experim_variacao_splicing SET DEFAULT nextval('public.experim_variacao_de_splicing_u_id_experim_variacao_splicing_seq'::regclass);


--
-- TOC entry 2445 (class 2604 OID 16765)
-- Name: id_exp_genica; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimento_de_expressao_genica ALTER COLUMN id_exp_genica SET DEFAULT nextval('public.experimento_de_expressao_genica_id_exp_genica_seq'::regclass);


--
-- TOC entry 2444 (class 2604 OID 16665)
-- Name: id_exp_mut_somatica; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimento_de_mutacao_somatica ALTER COLUMN id_exp_mut_somatica SET DEFAULT nextval('public.experimento_de_mutacao_somatica_id_exp_mut_somatica_seq'::regclass);


--
-- TOC entry 2449 (class 2604 OID 16923)
-- Name: id_experimento_redes_genicas; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimento_de_redes_genicas ALTER COLUMN id_experimento_redes_genicas SET DEFAULT nextval('public.experimento_de_redes_genicas_id_experimento_redes_genicas_seq'::regclass);


--
-- TOC entry 2447 (class 2604 OID 16878)
-- Name: id_experim_variacao_splicing; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimento_de_variacao_de_splicing ALTER COLUMN id_experim_variacao_splicing SET DEFAULT nextval('public.experimento_de_variacao_de_spl_id_experim_variacao_splicing_seq'::regclass);


--
-- TOC entry 2443 (class 2604 OID 16649)
-- Name: id_exposicao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposicao ALTER COLUMN id_exposicao SET DEFAULT nextval('public.exposicao_id_exposicao_seq'::regclass);


--
-- TOC entry 2446 (class 2604 OID 16794)
-- Name: id_exp_proteica; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expressao_proteica ALTER COLUMN id_exp_proteica SET DEFAULT nextval('public.expressao_proteica_id_exp_proteica_seq'::regclass);


--
-- TOC entry 2432 (class 2604 OID 16420)
-- Name: id_gene; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gene ALTER COLUMN id_gene SET DEFAULT nextval('public.gene_id_gene_seq'::regclass);


--
-- TOC entry 2450 (class 2604 OID 18039)
-- Name: chave_serial; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.icgc_simple_somatic_mutation ALTER COLUMN chave_serial SET DEFAULT nextval('public.icgc_simple_somatic_mutation_chave_serial_seq'::regclass);


--
-- TOC entry 2441 (class 2604 OID 16593)
-- Name: id_marcador; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marcador ALTER COLUMN id_marcador SET DEFAULT nextval('public.marcador_id_marcador_seq'::regclass);


--
-- TOC entry 2437 (class 2604 OID 16524)
-- Name: id_paciente; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('public.paciente_id_paciente_seq'::regclass);


--
-- TOC entry 2434 (class 2604 OID 16455)
-- Name: id_transcrito; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transcrito ALTER COLUMN id_transcrito SET DEFAULT nextval('public.transcrito_id_transcrito_seq'::regclass);


--
-- TOC entry 2442 (class 2604 OID 16633)
-- Name: id_tratamento; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tratamento ALTER COLUMN id_tratamento SET DEFAULT nextval('public.tratamento_id_tratamento_seq'::regclass);


--
-- TOC entry 2468 (class 2606 OID 16556)
-- Name: amostra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amostra
    ADD CONSTRAINT amostra_pkey PRIMARY KEY (id_amostra);


--
-- TOC entry 2454 (class 2606 OID 16436)
-- Name: coordenada_gene_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coordenada_gene
    ADD CONSTRAINT coordenada_gene_pkey PRIMARY KEY (id_coordenada);


--
-- TOC entry 2458 (class 2606 OID 16476)
-- Name: coordenada_transcrito_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coordenada_transcrito
    ADD CONSTRAINT coordenada_transcrito_pkey PRIMARY KEY (id_coordenada);


--
-- TOC entry 2470 (class 2606 OID 16577)
-- Name: diagnostico_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico);


--
-- TOC entry 2466 (class 2606 OID 16540)
-- Name: especime_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.especime
    ADD CONSTRAINT especime_pkey PRIMARY KEY (id_especime);


--
-- TOC entry 2460 (class 2606 OID 16500)
-- Name: exon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exon
    ADD CONSTRAINT exon_pkey PRIMARY KEY (id_exon);


--
-- TOC entry 2484 (class 2606 OID 16778)
-- Name: exp_expressao_genica_utiliza_amostra; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_express_genica_utiliza_amostra
    ADD CONSTRAINT exp_expressao_genica_utiliza_amostra PRIMARY KEY (id_exp_genica, id_amostra);


--
-- TOC entry 2490 (class 2606 OID 16891)
-- Name: experim_variacao_de_splicing_utiliza_amostra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_utiliza_amostra
    ADD CONSTRAINT experim_variacao_de_splicing_utiliza_amostra_pkey PRIMARY KEY (id_experim_variacao_splicing);


--
-- TOC entry 2482 (class 2606 OID 16770)
-- Name: experimento_de_expressao_genica_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimento_de_expressao_genica
    ADD CONSTRAINT experimento_de_expressao_genica_pkey PRIMARY KEY (id_exp_genica);


--
-- TOC entry 2480 (class 2606 OID 16670)
-- Name: experimento_de_mutacao_somatica_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimento_de_mutacao_somatica
    ADD CONSTRAINT experimento_de_mutacao_somatica_pkey PRIMARY KEY (id_exp_mut_somatica);


--
-- TOC entry 2492 (class 2606 OID 16928)
-- Name: experimento_de_redes_genicas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimento_de_redes_genicas
    ADD CONSTRAINT experimento_de_redes_genicas_pkey PRIMARY KEY (id_experimento_redes_genicas);


--
-- TOC entry 2488 (class 2606 OID 16883)
-- Name: experimento_de_variacao_de_splicing_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimento_de_variacao_de_splicing
    ADD CONSTRAINT experimento_de_variacao_de_splicing_pkey PRIMARY KEY (id_experim_variacao_splicing);


--
-- TOC entry 2478 (class 2606 OID 16654)
-- Name: exposicao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposicao
    ADD CONSTRAINT exposicao_pkey PRIMARY KEY (id_exposicao);


--
-- TOC entry 2486 (class 2606 OID 16799)
-- Name: expressao_proteica_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expressao_proteica
    ADD CONSTRAINT expressao_proteica_pkey PRIMARY KEY (id_exp_proteica);


--
-- TOC entry 2452 (class 2606 OID 16425)
-- Name: gene_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gene
    ADD CONSTRAINT gene_pkey PRIMARY KEY (id_gene);


--
-- TOC entry 2494 (class 2606 OID 17914)
-- Name: icgc_donor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.icgc_donor
    ADD CONSTRAINT icgc_donor_pkey PRIMARY KEY (icgc_donor_id);


--
-- TOC entry 2498 (class 2606 OID 17972)
-- Name: icgc_protein_expression_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.icgc_protein_expression
    ADD CONSTRAINT icgc_protein_expression_pkey PRIMARY KEY (icgc_sample_id, normalized_expression_level, analysis_id, antibody_id);


--
-- TOC entry 2496 (class 2606 OID 17940)
-- Name: icgc_sample_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.icgc_sample
    ADD CONSTRAINT icgc_sample_pkey PRIMARY KEY (icgc_sample_id);


--
-- TOC entry 2500 (class 2606 OID 17986)
-- Name: icgc_specimen_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.icgc_specimen
    ADD CONSTRAINT icgc_specimen_pkey PRIMARY KEY (submitted_specimen_id, project_code);


--
-- TOC entry 2472 (class 2606 OID 16598)
-- Name: marcador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marcador
    ADD CONSTRAINT marcador_pkey PRIMARY KEY (id_marcador);


--
-- TOC entry 2464 (class 2606 OID 16529)
-- Name: paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente);


--
-- TOC entry 2462 (class 2606 OID 16518)
-- Name: pk_coordenada_exon; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coordenada_exon
    ADD CONSTRAINT pk_coordenada_exon PRIMARY KEY (versao_montagem, fonte_montagem, cromossomo, inicio, fim, fita);


--
-- TOC entry 2474 (class 2606 OID 16606)
-- Name: pk_marcador_auxilia_diagnóstico; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."marcador_auxilia_diagnóstico"
    ADD CONSTRAINT "pk_marcador_auxilia_diagnóstico" PRIMARY KEY (id_marcador, id_amostra);


--
-- TOC entry 2456 (class 2606 OID 16460)
-- Name: transcrito_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transcrito
    ADD CONSTRAINT transcrito_pkey PRIMARY KEY (id_transcrito);


--
-- TOC entry 2476 (class 2606 OID 16638)
-- Name: tratamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tratamento
    ADD CONSTRAINT tratamento_pkey PRIMARY KEY (id_tratamento);


--
-- TOC entry 2510 (class 2606 OID 16562)
-- Name: amostra_id_especime_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amostra
    ADD CONSTRAINT amostra_id_especime_fkey FOREIGN KEY (id_especime) REFERENCES public.especime(id_especime);


--
-- TOC entry 2509 (class 2606 OID 16557)
-- Name: amostra_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amostra
    ADD CONSTRAINT amostra_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 2512 (class 2606 OID 16583)
-- Name: diagnostico_id_especime_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_id_especime_fkey FOREIGN KEY (id_especime) REFERENCES public.especime(id_especime);


--
-- TOC entry 2511 (class 2606 OID 16578)
-- Name: diagnostico_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 2508 (class 2606 OID 16541)
-- Name: especime_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.especime
    ADD CONSTRAINT especime_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 2507 (class 2606 OID 16506)
-- Name: exon_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exon
    ADD CONSTRAINT exon_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- TOC entry 2506 (class 2606 OID 16501)
-- Name: exon_id_transcrito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exon
    ADD CONSTRAINT exon_id_transcrito_fkey FOREIGN KEY (id_transcrito) REFERENCES public.transcrito(id_transcrito);


--
-- TOC entry 2527 (class 2606 OID 16779)
-- Name: experim_express_genica_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_express_genica_utiliza_amostra
    ADD CONSTRAINT experim_express_genica_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2528 (class 2606 OID 16784)
-- Name: experim_express_genica_utiliza_amostra_id_exp_genica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_express_genica_utiliza_amostra
    ADD CONSTRAINT experim_express_genica_utiliza_amostra_id_exp_genica_fkey FOREIGN KEY (id_exp_genica) REFERENCES public.experimento_de_expressao_genica(id_exp_genica);


--
-- TOC entry 2548 (class 2606 OID 16961)
-- Name: experim_express_proteica_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_express_proteica_utiliza_amostra
    ADD CONSTRAINT experim_express_proteica_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2549 (class 2606 OID 16966)
-- Name: experim_express_proteica_utiliza_amostra_id_exp_proteica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_express_proteica_utiliza_amostra
    ADD CONSTRAINT experim_express_proteica_utiliza_amostra_id_exp_proteica_fkey FOREIGN KEY (id_exp_proteica) REFERENCES public.expressao_proteica(id_exp_proteica);


--
-- TOC entry 2518 (class 2606 OID 16677)
-- Name: experim_mutacao_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_mutacao_utiliza_amostra
    ADD CONSTRAINT experim_mutacao_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2519 (class 2606 OID 16682)
-- Name: experim_mutacao_utiliza_amostra_id_exp_mut_somatica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_mutacao_utiliza_amostra
    ADD CONSTRAINT experim_mutacao_utiliza_amostra_id_exp_mut_somatica_fkey FOREIGN KEY (id_exp_mut_somatica) REFERENCES public.experimento_de_mutacao_somatica(id_exp_mut_somatica);


--
-- TOC entry 2546 (class 2606 OID 16948)
-- Name: experim_redes_genicas_analisa_gene_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_redes_genicas_analisa_gene
    ADD CONSTRAINT experim_redes_genicas_analisa_gene_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- TOC entry 2547 (class 2606 OID 16953)
-- Name: experim_redes_genicas_analisa_id_experimento_redes_genicas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_redes_genicas_analisa_gene
    ADD CONSTRAINT experim_redes_genicas_analisa_id_experimento_redes_genicas_fkey FOREIGN KEY (id_experimento_redes_genicas) REFERENCES public.experimento_de_redes_genicas(id_experimento_redes_genicas);


--
-- TOC entry 2545 (class 2606 OID 16937)
-- Name: experim_redes_genicas_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_redes_genicas_utiliza_amostra
    ADD CONSTRAINT experim_redes_genicas_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2544 (class 2606 OID 16932)
-- Name: experim_redes_genicas_utiliza_id_experimento_redes_genicas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_redes_genicas_utiliza_amostra
    ADD CONSTRAINT experim_redes_genicas_utiliza_id_experimento_redes_genicas_fkey FOREIGN KEY (id_experimento_redes_genicas) REFERENCES public.experimento_de_redes_genicas(id_experimento_redes_genicas);


--
-- TOC entry 2540 (class 2606 OID 16892)
-- Name: experim_variacao_de_splicing__id_experim_variacao_splicing_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_utiliza_amostra
    ADD CONSTRAINT experim_variacao_de_splicing__id_experim_variacao_splicing_fkey FOREIGN KEY (id_experim_variacao_splicing) REFERENCES public.experimento_de_variacao_de_splicing(id_experim_variacao_splicing);


--
-- TOC entry 2542 (class 2606 OID 16908)
-- Name: experim_variacao_de_splicing_analisa_transcr_id_transcrito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_analisa_transcrito_em_amostra
    ADD CONSTRAINT experim_variacao_de_splicing_analisa_transcr_id_transcrito_fkey FOREIGN KEY (id_transcrito) REFERENCES public.transcrito(id_transcrito);


--
-- TOC entry 2543 (class 2606 OID 16913)
-- Name: experim_variacao_de_splicing_id_experim_variacao_splicing_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_analisa_transcrito_em_amostra
    ADD CONSTRAINT experim_variacao_de_splicing_id_experim_variacao_splicing_fkey1 FOREIGN KEY (id_experim_variacao_splicing) REFERENCES public.experimento_de_variacao_de_splicing(id_experim_variacao_splicing);


--
-- TOC entry 2541 (class 2606 OID 16897)
-- Name: experim_variacao_de_splicing_utiliza_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experim_variacao_de_splicing_utiliza_amostra
    ADD CONSTRAINT experim_variacao_de_splicing_utiliza_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2517 (class 2606 OID 16655)
-- Name: exposicao_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exposicao
    ADD CONSTRAINT exposicao_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 2539 (class 2606 OID 16868)
-- Name: expressao_microarray_avalia_gene_em_amostra_id_exp_genica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expressao_microarray_avalia_gene_em_amostra
    ADD CONSTRAINT expressao_microarray_avalia_gene_em_amostra_id_exp_genica_fkey FOREIGN KEY (id_exp_genica) REFERENCES public.experimento_de_expressao_genica(id_exp_genica);


--
-- TOC entry 2538 (class 2606 OID 16863)
-- Name: expressao_microarray_avalia_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expressao_microarray_avalia_gene_em_amostra
    ADD CONSTRAINT expressao_microarray_avalia_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- TOC entry 2532 (class 2606 OID 16821)
-- Name: expressao_proteica_diz_respeito_a_gene_em__id_exp_proteica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expressao_proteica_diz_respeito_a_gene_em_amostra
    ADD CONSTRAINT expressao_proteica_diz_respeito_a_gene_em__id_exp_proteica_fkey FOREIGN KEY (id_exp_proteica) REFERENCES public.expressao_proteica(id_exp_proteica);


--
-- TOC entry 2530 (class 2606 OID 16811)
-- Name: expressao_proteica_diz_respeito_a_gene_em_amost_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expressao_proteica_diz_respeito_a_gene_em_amostra
    ADD CONSTRAINT expressao_proteica_diz_respeito_a_gene_em_amost_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2531 (class 2606 OID 16816)
-- Name: expressao_proteica_diz_respeito_a_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expressao_proteica_diz_respeito_a_gene_em_amostra
    ADD CONSTRAINT expressao_proteica_diz_respeito_a_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- TOC entry 2529 (class 2606 OID 16800)
-- Name: expressao_proteica_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expressao_proteica
    ADD CONSTRAINT expressao_proteica_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2515 (class 2606 OID 16623)
-- Name: familiar_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.familiar
    ADD CONSTRAINT familiar_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 2501 (class 2606 OID 16440)
-- Name: gene_nomeia_coordenada_id_coordenada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gene_nomeia_coordenada
    ADD CONSTRAINT gene_nomeia_coordenada_id_coordenada_fkey FOREIGN KEY (id_coordenada) REFERENCES public.coordenada_gene(id_coordenada);


--
-- TOC entry 2502 (class 2606 OID 16445)
-- Name: gene_nomeia_coordenada_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gene_nomeia_coordenada
    ADD CONSTRAINT gene_nomeia_coordenada_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- TOC entry 2513 (class 2606 OID 16607)
-- Name: marcador_auxilia_diagnóstico_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."marcador_auxilia_diagnóstico"
    ADD CONSTRAINT "marcador_auxilia_diagnóstico_id_amostra_fkey" FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2514 (class 2606 OID 16612)
-- Name: marcador_auxilia_diagnóstico_id_marcador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."marcador_auxilia_diagnóstico"
    ADD CONSTRAINT "marcador_auxilia_diagnóstico_id_marcador_fkey" FOREIGN KEY (id_marcador) REFERENCES public.marcador(id_marcador);


--
-- TOC entry 2520 (class 2606 OID 16719)
-- Name: mutacao_estrutural_to_from_gene_em_amo_id_amostra_controle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_amo_id_amostra_controle_fkey FOREIGN KEY (id_amostra_controle) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2522 (class 2606 OID 16729)
-- Name: mutacao_estrutural_to_from_gene_em_amo_id_exp_mut_somatica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_amo_id_exp_mut_somatica_fkey FOREIGN KEY (id_exp_mut_somatica) REFERENCES public.experimento_de_mutacao_somatica(id_exp_mut_somatica);


--
-- TOC entry 2523 (class 2606 OID 16734)
-- Name: mutacao_estrutural_to_from_gene_em_amostra_id_gene_from_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_amostra_id_gene_from_fkey FOREIGN KEY (id_gene_from) REFERENCES public.gene(id_gene);


--
-- TOC entry 2524 (class 2606 OID 16739)
-- Name: mutacao_estrutural_to_from_gene_em_amostra_id_gene_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_amostra_id_gene_to_fkey FOREIGN KEY (id_gene_to) REFERENCES public.gene(id_gene);


--
-- TOC entry 2521 (class 2606 OID 16724)
-- Name: mutacao_estrutural_to_from_gene_em_id_amostra_experimental_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_estrutural_to_from_gene_em_amostra
    ADD CONSTRAINT mutacao_estrutural_to_from_gene_em_id_amostra_experimental_fkey FOREIGN KEY (id_amostra_experimental) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2550 (class 2606 OID 18109)
-- Name: mutacao_simples_avalia_gene_em_amo_id_amostra_experimental_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_simples_avalia_gene_em_amostra
    ADD CONSTRAINT mutacao_simples_avalia_gene_em_amo_id_amostra_experimental_fkey FOREIGN KEY (id_amostra_experimental) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2551 (class 2606 OID 18114)
-- Name: mutacao_simples_avalia_gene_em_amostra_id_amostra_controle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_simples_avalia_gene_em_amostra
    ADD CONSTRAINT mutacao_simples_avalia_gene_em_amostra_id_amostra_controle_fkey FOREIGN KEY (id_amostra_controle) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2552 (class 2606 OID 18119)
-- Name: mutacao_simples_avalia_gene_em_amostra_id_exp_mut_somatica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_simples_avalia_gene_em_amostra
    ADD CONSTRAINT mutacao_simples_avalia_gene_em_amostra_id_exp_mut_somatica_fkey FOREIGN KEY (id_exp_mut_somatica) REFERENCES public.experimento_de_mutacao_somatica(id_exp_mut_somatica);


--
-- TOC entry 2553 (class 2606 OID 18124)
-- Name: mutacao_simples_avalia_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_simples_avalia_gene_em_amostra
    ADD CONSTRAINT mutacao_simples_avalia_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- TOC entry 2526 (class 2606 OID 16755)
-- Name: mutacao_var_copias_afeta_gene_em_amost_id_exp_mut_somatica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_var_copias_afeta_gene_em_amostra
    ADD CONSTRAINT mutacao_var_copias_afeta_gene_em_amost_id_exp_mut_somatica_fkey FOREIGN KEY (id_exp_mut_somatica) REFERENCES public.experimento_de_mutacao_somatica(id_exp_mut_somatica);


--
-- TOC entry 2525 (class 2606 OID 16750)
-- Name: mutacao_var_copias_afeta_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutacao_var_copias_afeta_gene_em_amostra
    ADD CONSTRAINT mutacao_var_copias_afeta_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- TOC entry 2535 (class 2606 OID 16842)
-- Name: sequenciamento_avalia_gene_em_amostra_id_amostra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sequenciamento_avalia_gene_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_gene_em_amostra_id_amostra_fkey FOREIGN KEY (id_amostra) REFERENCES public.amostra(id_amostra);


--
-- TOC entry 2534 (class 2606 OID 16837)
-- Name: sequenciamento_avalia_gene_em_amostra_id_exp_genica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sequenciamento_avalia_gene_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_gene_em_amostra_id_exp_genica_fkey FOREIGN KEY (id_exp_genica) REFERENCES public.experimento_de_expressao_genica(id_exp_genica);


--
-- TOC entry 2533 (class 2606 OID 16832)
-- Name: sequenciamento_avalia_gene_em_amostra_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sequenciamento_avalia_gene_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_gene_em_amostra_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- TOC entry 2537 (class 2606 OID 16855)
-- Name: sequenciamento_avalia_transcrito_em_amostra_id_exp_genica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sequenciamento_avalia_transcrito_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_transcrito_em_amostra_id_exp_genica_fkey FOREIGN KEY (id_exp_genica) REFERENCES public.experimento_de_expressao_genica(id_exp_genica);


--
-- TOC entry 2536 (class 2606 OID 16850)
-- Name: sequenciamento_avalia_transcrito_em_amostra_id_transcrito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sequenciamento_avalia_transcrito_em_amostra
    ADD CONSTRAINT sequenciamento_avalia_transcrito_em_amostra_id_transcrito_fkey FOREIGN KEY (id_transcrito) REFERENCES public.transcrito(id_transcrito);


--
-- TOC entry 2503 (class 2606 OID 16461)
-- Name: transcrito_id_gene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transcrito
    ADD CONSTRAINT transcrito_id_gene_fkey FOREIGN KEY (id_gene) REFERENCES public.gene(id_gene);


--
-- TOC entry 2504 (class 2606 OID 16480)
-- Name: transcrito_nomeia_coordenada_id_coordenada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transcrito_nomeia_coordenada
    ADD CONSTRAINT transcrito_nomeia_coordenada_id_coordenada_fkey FOREIGN KEY (id_coordenada) REFERENCES public.coordenada_transcrito(id_coordenada);


--
-- TOC entry 2505 (class 2606 OID 16485)
-- Name: transcrito_nomeia_coordenada_id_transcrito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transcrito_nomeia_coordenada
    ADD CONSTRAINT transcrito_nomeia_coordenada_id_transcrito_fkey FOREIGN KEY (id_transcrito) REFERENCES public.transcrito(id_transcrito);


--
-- TOC entry 2516 (class 2606 OID 16639)
-- Name: tratamento_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tratamento
    ADD CONSTRAINT tratamento_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


-- Completed on 2018-05-03 15:59:09 -03

--
-- PostgreSQL database dump complete
--

