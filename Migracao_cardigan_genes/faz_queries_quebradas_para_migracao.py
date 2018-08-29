#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
from subprocess import PIPE, Popen
import subprocess

'''
python Migracao_cardigan_genes/faz_queries_quebradas_para_migracao.py -q "UPDATE sequenciamento_avalia_gene_em_amostra s SET id_gene_ref = (select gr.id_gene_ref FROM gene_referencia gr WHERE gr.old_id = s.id_gene)" -a 'chave_serial' -n 1000 -l 10540000 > updates_gene_ref_sequenciamento_avalia_gene_em_amostra.sql

'''

parser = argparse.ArgumentParser(description='''Descrição do programa''')
parser.add_argument('-a', '--atributo', help='atributo que vai ser usado para fazer as quebras (chave_serial)')
parser.add_argument('-l', '--limite', help='limite superior (onde quero que pare a query')
parser.add_argument('-n', '--tamanho', help='tamanho do intervalo de cada query "filha"')
parser.add_argument('-q', '--query', help='query que será quebrada em varias')
args = parser.parse_args()

fechar = []

#args.query = "UPDATE sequenciamento_avalia_gene_em_amostra s SET id_gene_ref = (select gr.id_gene_ref FROM gene_referencia gr WHERE gr.old_id = s.id_gene)"
#args.limite = 11000000
#args.tamanho = 1000
#args.atributo = "chave_serial"

for i in range(0, int(args.limite), int(args.tamanho)):
    print("{} WHERE {} >= {} AND {} < {} ;".format(args.query, args.atributo, i, args.atributo, i + int(args.tamanho)))





