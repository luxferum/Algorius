from numpy import exp
from rtd import RTD

rtd_dolfut = RTD()  # get dolfut rtd
rtd_frp0 = RTD()  # get frp0 rtd
rtd_frcfut = RTD()  # get frp0 rtd
rtd_di = RTD()  # get frp0 rtd


def fair_price(di1fut_user_choice1, juroseua_user_choice2):
    '''
    Return fair price.

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


def fair_price_ptax(di1fut_user_choice):
    '''
    Return fair price using ptax style.

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
    f = spot * ((1+di1fut_user_choice) ** diasDI)/(1+frcfut*diasFRC)
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
