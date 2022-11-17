from numpy import log
from math import e as EULER

JUROS_EUA = 1.0126
JUROS_EUA_LOG = log(JUROS_EUA)

JUROS_BR = 1.1315
JUROS_BR_LOG = log(JUROS_BR)

BASE_LOG = JUROS_BR_LOG - JUROS_EUA_LOG


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
