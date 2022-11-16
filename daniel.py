import pandas as pd
import unidecode
import re


rtd_keys = ["Ativo                         ", "Última                        ", "Var.                          ", "Qtd. Compra                   ", "Compra                        ", "Venda                         ",
            "Qtd. Venda                    ", "Abertura                      ", "Máxima                        ", "Mínima                        ", "Fechamento                    ", "Volume                        ",
            "Hora                          ", "Fech. Ajustado                ", "Núm. de Negócios              ", "Média                         ", "Papéis Negociados             ", "TODO IDENTIFICAR (01)         ", "Estado                        ",
            "Vencimento                    ", "Lote Mínimo                   ",
            "Dias até Vencimento           ", "Dias Úteis até Vencimento     ", "Var. %                        ", "Var. (Var. %)                 ", "Data                          ",
            "Data/Hora                     ", "Descrição                     ", "Exercício                     ",
            "Var. Simb.                    ", "Semanal (Var. %)              ", "Mensal (Var. %)               ", "Anual (Var. %)                ", "30 Dias (Var. %)              ", "12 Meses (Var. %)             ",
            "52 Semanas (Var. %)           ", "2 Anos (Var. %)               ", "Ajuste PU                     ", "Ajuste PU Anterior            ",
            "Preço Teórico                 ", "Quantidade Teórica            ", "Fim do Leilão                 ", "Contratos em Aberto           ", "Fech. Ajustado Anterior       ", "MCap                          ",
            "Ações no Mercado              ", "Agr. Cmp.                     ", "Agr. Cmp. (Direto)            ", "Agr. Cmp. (Não-direto)        ", "Agr. Vnd.                     ", "Agr. Vnd. (Direto)            ",
            "Agr. Vnd. (Não-direto)        ", "Saldo Agr.                    ", "Saldo Agr. (Direto)           ", "Saldo Agr. (Não-direto)       ", "Agr. Cmp. %                   ", "Agr. Cmp. % (Direto)          ",
            "Agr. Cmp. % (Não-direto)      ", "Agr. Vnd. %                   ", "Agr. Vnd. % (Direto)          ", "Agr. Vnd. % (Não-direto)      ", "Qtd. Rest.                    ", "Ind. Sald.                    ",
            "Neg. Agr. Cmp.                ", "Neg. Agr. Cmp. (Direto)       ", "Neg. Agr. Cmp. (Não-direto)   ", "Neg. Agr. Vnd.                ", "Neg. Agr. Vnd. (Direto)       ", "Neg. Agr. Vnd. (Não-direto)   ",
            "Saldo Neg. Agr.               ", "Saldo Neg. Agr. (Direto)      ", "Saldo Neg. Agr. (Não-direto)  ", "Neg. Agr. Cmp. %              ", "Neg. Agr. Cmp. % (Direto)     ", "Neg. Agr. Cmp. % (Não-direto) ",
            "Neg. Agr. Vnd. %              ", "Neg. Agr. Vnd. % (Direto)     ", "Neg. Agr. Vnd. % (Não-direto) ", "PTAX P1                       ", "PTAX P2                       ", "PTAX P3                       ",
            "PTAX P4                       ", "PTAX Oficial                  ", "PTAX Fut. P1                  ", "PTAX Fut. P2                  ", "PTAX Fut. P3                  ", "PTAX Fut. P4                  ",
            "PTAX Fut. Oficial             "]

# comentei e comitei para testar

def string_to_float(s):
    try:
        s = float(s)
        return s
    except:
        return s


def clean_change_type(x):
    x = x.replace('.', '').replace(',', '.')
    x = string_to_float(x)
    return x


def clean(c):
    # remove multiplos espacos
    c = c.strip()
    # remove acentos
    c = unidecode.unidecode(c)
    # tira espacos e coloca underline
    c = c.replace(' ', '_')
    # deixa tudo minusculo
    c = c.lower()
    return c


rtd_keys = [clean(k) for k in rtd_keys]


def create_dict(info):
    dictInfo = {k: v for k, v in zip(rtd_keys, info)}
    return dictInfo
