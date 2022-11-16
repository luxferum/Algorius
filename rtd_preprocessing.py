from unidecode import unidecode


def clean_rtd_keys():
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

    def clean_rtd_keys(s):
        '''Função para limpar as chaves para usar no dicionário'''
        s = s.strip()
        s = unidecode(s)
        s = s.lower()
        s = s.replace(' ', '_').replace('-', '_')
        s = s.replace('.', '').replace('(', '').replace(')', '')
        s = s.replace('%', 'porcentagem')
        return s

    cleaned_rtd_keys = [clean_rtd_keys(k) for k in rtd_keys]
    return cleaned_rtd_keys


def clean_info(info):
    '''Função para limpar as informações pegadas pelo rtd e usar como valor no dicionário'''
    def clean_value(value):
        def string_to_float(s):
            try:
                s = float(s)
            finally:
                return s

        value = value.replace('.', '').replace(',', '.')
        value = string_to_float(value)
        return value

    cleaned_info = [clean_value(i) for i in info]
    return cleaned_info


def create_clean_dict(info):
    '''Função para criar um dicionário com as informações limpas do rtd'''
    dictInfo = {k: v for k, v in zip(clean_rtd_keys(), clean_info(info))}
    return dictInfo
