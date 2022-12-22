from unidecode import unidecode

rtd_keys = ["Ativo                         ", "Última                        ", "Var.                          ", "Qtd. Compra                   ", "Compra                        ", "Venda                         ",
            "Qtd. Venda                    ", "Abertura                      ", "Máxima                        ", "Mínima                        ", "Fechamento                    ", "Volume                        ",
            "Hora                          ", "Fech. Ajustado                ", "Núm. de Negócios              ", "Média                         ", "Papéis Negociados             ", "TODO IDENTIFICAR (01)         ",
            "Estado                        ", "Vencimento                    ", "Lote Mínimo                   ", "Dias até Vencimento           ", "Dias Úteis até Vencimento     ", "Var. %                        ",
            "Var. (Var. %)                 ", "Data                          ", "Data/Hora                     ", "Descrição                     ", "Exercício                     ", "Var. Simb.                    ",
            "Semanal (Var. %)              ", "Mensal (Var. %)               ", "Anual (Var. %)                ", "30 Dias (Var. %)              ", "12 Meses (Var. %)             ", "52 Semanas (Var. %)           ",
            "2 Anos (Var. %)               ", "Ajuste PU                     ", "Ajuste PU Anterior            ", "Preço Teórico                 ", "Quantidade Teórica            ", "Fim do Leilão                 ",
            "Contratos em Aberto           ", "Fech. Ajustado Anterior       ", "MCap                          ", "Ações no Mercado              ", "Agr. Cmp.                     ", "Agr. Cmp. (Direto)            ",
            "Agr. Cmp. (Não-direto)        ", "Agr. Vnd.                     ", "Agr. Vnd. (Direto)            ", "Agr. Vnd. (Não-direto)        ", "Saldo Agr.                    ", "Saldo Agr. (Direto)           ",
            "Saldo Agr. (Não-direto)       ", "Agr. Cmp. %                   ", "Agr. Cmp. % (Direto)          ", "Agr. Cmp. % (Não-direto)      ", "Agr. Vnd. %                   ", "Agr. Vnd. % (Direto)          ",
            "Agr. Vnd. % (Não-direto)      ", "Qtd. Rest.                    ", "Ind. Sald.                    ", "Neg. Agr. Cmp.                ", "Neg. Agr. Cmp. (Direto)       ", "Neg. Agr. Cmp. (Não-direto)   ",
            "Neg. Agr. Vnd.                ", "Neg. Agr. Vnd. (Direto)       ", "Neg. Agr. Vnd. (Não-direto)   ", "Saldo Neg. Agr.               ", "Saldo Neg. Agr. (Direto)      ", "Saldo Neg. Agr. (Não-direto)  ",
            "Neg. Agr. Cmp. %              ", "Neg. Agr. Cmp. % (Direto)     ", "Neg. Agr. Cmp. % (Não-direto) ", "Neg. Agr. Vnd. %              ", "Neg. Agr. Vnd. % (Direto)     ", "Neg. Agr. Vnd. % (Não-direto) ",
            "PTAX P1                       ", "PTAX P2                       ", "PTAX P3                       ", "PTAX P4                       ", "PTAX Oficial                  ", "PTAX Fut. P1                  ",
            "PTAX Fut. P2                  ", "PTAX Fut. P3                  ", "PTAX Fut. P4                  ",
            "PTAX Fut. Oficial             "]


def clean_rtd_keys():
    '''Return a list of rtd keys cleaned up'''
    def clean_key(s):
        s = unidecode(s)
        s = s.strip()
        s = s.lower()
        s = s.replace(' ', '_').replace('-', '_')
        s = s.replace('.', '').replace('(', '').replace(')', '')
        s = s.replace('%', 'porcentagem')
        return s

    return [clean_key(k) for k in rtd_keys]


def clean_rtd_values(values):
    '''Given raw rtd. Return a list of rtd values cleaned up'''
    def clean_value(value):
        def string_to_float(s):
            try:
                s = float(s)
            finally:
                return s

        value = value.replace('.', '').replace(',', '.')
        return string_to_float(value)

    return [clean_value(i) for i in values]


def clean_rtd_as_dict(values):
    '''Given raw rtd. Return a dict of rtd cleaned up'''
    return {k: v for k, v in zip(clean_rtd_keys(), clean_rtd_values(values))}
