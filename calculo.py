from numpy import log
from math import e as EULER

JUROS_EUA = 1.0126
JUROS_EUA_LOG = log(JUROS_EUA)

JUROS_BR = 1.1315
JUROS_BR_LOG = log(JUROS_BR)

BASE_LOG = JUROS_BR_LOG - JUROS_EUA_LOG

# PREÇO JUSTO USANDO ESTILO PTAX #
# def fairPricePTAX():
#     spot=5338.50 (PRECISA VALOR DO FRP E DOLFUT QUE VEM DO RTD, RESULTANDO EM -> SPOT = DOLFUT - FRP0).
#     di1fut=0.1375 (LINKADO AO UI -> USUÁRIO IRÁ ESCOLHER)
#     frcfut=0.0604 (PRECISA DO VALOR DO FRCFUT QUE VEM DO RTD)
#     diasFRC=13/252 (PRECISA DA DATA DE VENCIMENTO DO FRC, RESULTANDO EM -> HOJE - VENCIMENTO/252)
#     diasDI=13/252 (PRECISA DA DATA DE VENCIMENTO DO DI, RESULTANDO EM -> HOJE - VENCIMENTO/252)
#     f=spot*((np.power(1+di1fut,diasDI))/(1+frcfut*diasFRC)) (FÓRMULA FINAL DO PREÇO JUSTO DO PTAX).
#     print(f)

### CRIAR UMA FUNÇÃO NOVA ####


# PREÇO JUSTO #
# def fairPrice():
#     deltaJ=1.1375-1.044 #DI1FUT E JUROS EUA (LINKADO AO UI -> USUÁRIO IRÁ ESCOLHER)
#     deltaDias=13/252#DIAS ATÉ O VENCIMENTO/252 (PRECISA LINKAR COM O VENCIMENTO QUE VEM DO RTD, RESULTANDO EM -> DELTA_DIAS = DATA_DE_HOJE - VENCIMENTO/252).
#     spot=5338.50#DOLAR A VISTA (PRECISA VALOR DO FRP E DOLFUT QUE VEM DO RTD, RESULTANDO EM -> SPOT = DOLFUT - FRP0).
#     e=np.e#CONST DE EULER (FUNÇÃO JÁ EXISTENTE DO MÓDULO NUMPY).
#     f=spot*np.power(e,deltaJ*deltaDias)#FORMULA (FÓRMULA FINAL DO PREÇO JUSTO).
#     print(f)

#### TROCAR PELA FUNÇÃO ABAIXO ####


def fairPrice(dolar_futuro, fpr0):
    '''Calcular preço do dolar futuro F = S*e^(r-rf)*(T-t)'''
    s = dolar_futuro['ultima'] - fpr0['ultima']  # spot
    e = EULER
    diff_r_rf = BASE_LOG
    diff_T_t = dolar_futuro['dias_uteis_ate_vencimento'] / 360
    F = s * e ** (diff_r_rf * diff_T_t)
    print(f'fair_price = {F}')
    return F

# p/ dolar!


def stdDeviationOnScale(self):
    pass


def stdDeviationOffScale(self):
    pass


def avgSpeed(self):
    pass


def simpleHarmonicOscilator(self):
    pass


def vwapZScore(self):
    pass
