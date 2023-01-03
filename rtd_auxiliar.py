from numpy import exp
from unidecode import unidecode
from rtd_keys import rtd_keys
from numpy import NaN


def print_highlighter(s):
    '''Print text highlighted with dashes'''

    def highlight():
        print('--------------------------------')
        print(f'{s}')
        print('--------------------------------')

    return highlight()


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
                return s
            except:
                return s

        value = value.replace('.', '').replace(',', '.')
        return string_to_float(value)

    return [clean_value(i) for i in values]


def clean_rtd_as_dict(raw_data):
    '''Given raw rtd. Return a dict of rtd cleaned up'''
    return {k: v for k, v in zip(clean_rtd_keys(), clean_rtd_values(raw_data))}


def byte_convert(data_info, ativo):
    '''Convert bytes to a string'''
    # data_info example = b'COT$S|PETR4#'
    return str.encode(data_info + ativo + '#')


'''RTD calculation used to calculate specific values'''


def fair_price(rtd_dolfut, rtd_frp0, di1fut_user_choice1, juroseua_user_choice2):
    '''
    Calculate fair price.

        Parameters:
                a (int): A decimal integer
                b (int): Another decimal integer

        Returns:
                binary_sum (str): Binary string of the sum of a and b
    '''
    # DI1FUT E JUROS EUA (LINKADO AO UI -> USUÁRIO IRÁ ESCOLHER)
    delta_j = di1fut_user_choice1 - juroseua_user_choice2
    # DIAS ATÉ O VENCIMENTO/252 (PRECISA LINKAR COM O VENCIMENTO QUE VEM DO RTD, RESULTANDO EM -> DELTA_DIAS = DATA_DE_HOJE - VENCIMENTO/252).
    delta_dias = rtd_dolfut['dias_uteis_ate_vencimento'] / 252
    # DOLAR A VISTA (PRECISA VALOR DO FRP E DOLFUT QUE VEM DO RTD, RESULTANDO EM -> SPOT = DOLFUT - FRP0).
    spot = rtd_dolfut['fechamento'] - rtd_frp0['fechamento']
    # FORMULA (FÓRMULA FINAL DO PREÇO JUSTO)
    f = spot * exp(delta_j*delta_dias)
    print(f)


def fair_price_ptax(rtd_dolfut, rtd_frp0, rtd_frcfut, rtd_di, rtd_di1fut_user_choice):
    '''
    Calculate fair price using ptax style.

        Parameters:
                a (int): A decimal integer
                b (int): Another decimal integer

        Returns:
                binary_sum (str): Binary string of the sum of a and b
    '''
    # (PRECISA VALOR DO FRP E DOLFUT QUE VEM DO RTD, RESULTANDO EM -> SPOT=DOLFUT - FRP0).
    spot = rtd_dolfut['fechamento'] - rtd_frp0['fechamento']
    # (PRECISA DO VALOR DO FRCFUT QUE VEM DO RTD)
    frcfut = rtd_frcfut['fechamento']
    # (PRECISA DA DATA DE VENCIMENTO DO FRC, RESULTANDO EM -> HOJE - VENCIMENTO/252)
    diasFRC = rtd_frcfut['dias_uteis_ate_vencimento']/252
    # (PRECISA DA DATA DE VENCIMENTO DO DI, RESULTANDO EM -> HOJE - VENCIMENTO/252)
    diasDI = rtd_di['dias_uteis_ate_vencimento']/252
    # (FÓRMULA FINAL DO PREÇO JUSTO DO PTAX).
    f = spot * ((1+rtd_di1fut_user_choice) ** diasDI)/(1+frcfut*diasFRC)
    print(f)


def std_dev_on_scale():
    pass


def std_dev_off_scale():
    pass


def avg_speed():
    pass


def simple_harmonic_oscilator():
    pass


def vwap_ZScore():
    pass
