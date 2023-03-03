from numpy import exp
import pandas as pd

from auxiliar import rtd_clean_dict


class RTD:
    '''RTD class is a real time data object with cleaned values from Tryd as attributes'''

    @classmethod
    def summarizer(cls, socket):
        '''Calculate Summarizer'''

        # get real time data
        frc = RTD(socket.get_raw_rtd('FRCN23')).saldo_agr
        di1f1 = RTD(socket.get_raw_rtd('DI1F24')).saldo_agr
        di1f2 = RTD(socket.get_raw_rtd('DI1F25')).saldo_agr
        dolfut = RTD(socket.get_raw_rtd('DOLFUT')).saldo_agr
        wdofut = RTD(socket.get_raw_rtd('WDOFUT')).saldo_agr
        indfut = RTD(socket.get_raw_rtd('INDFUT')).saldo_agr
        winfut = RTD(socket.get_raw_rtd('WINFUT')).saldo_agr

        # get correlation of each asset in relation of wdofut from profit
        frc_peso = .084 + .031 + (-.107)
        di1f1_peso = .363
        di1f2_peso = .464
        dolfut_peso = 1
        wdofut_peso = 1
        indfut_peso = -.669
        winfut_peso = -.667

        # calculate
        summarizer = frc*frc_peso + di1f1*di1f1_peso + di1f2*di1f2_peso + dolfut * \
            dolfut_peso + wdofut * wdofut_peso + indfut*indfut_peso + winfut*winfut_peso

        return summarizer, frc, di1f1, di1f2, dolfut, wdofut, indfut, winfut

    @classmethod
    def fair_price(cls, socket, juros_br, juros_eua=4.59):
        '''Calculate fair price'''

        # get real time data
        frp0 = RTD(socket.get_raw_rtd('FRP0'))
        dolfut = RTD(socket.get_raw_rtd('DOLFUT'))
        di1fut = RTD(socket.get_raw_rtd(juros_br))

        # first calculation
        spot = dolfut.ultima - frp0.ultima
        delta_dias = dolfut.dias_uteis_ate_vencimento / 252
        delta_j = (di1fut.ultima / 100) - (juros_eua / 100)

        # final result
        fair_price = round(spot * exp(delta_j*delta_dias), 2)

        return fair_price, spot, dolfut.ultima, di1fut.ultima

    @classmethod
    def fair_price_ptax(cls, socket, juros_br):
        '''Calculate fair price using ptax style'''

        # real time data
        frp0 = RTD(socket.get_raw_rtd('FRP0'))
        dolfut = RTD(socket.get_raw_rtd('DOLFUT'))
        di1fut = RTD(socket.get_raw_rtd(juros_br))
        frcfut = RTD(socket.get_raw_rtd('FRCJ24'))

        # first calculation
        spot = dolfut.ultima - frp0.ultima
        frcfut_dias = frcfut.dias_uteis_ate_vencimento / 252
        di1fut_dias = di1fut.dias_uteis_ate_vencimento / 252

        # intermediate result
        numerador = (1 + (di1fut.ultima / 100) / 252) ** di1fut_dias
        denominador = 1 + (frcfut.ultima / 100) * frcfut_dias

        # final result
        fair_price_ptax = round(spot * numerador / denominador, 2)

        return fair_price_ptax, spot, dolfut.ultima, di1fut.ultima

    def __init__(self, raw_data):
        '''Create a RTD object with raw data'''

        # create a raw list using raw data string
        raw_data_list = raw_data.split('|')

        # create a clean dictionary using raw data list
        clean_data_dict = rtd_clean_dict(raw_data_list)

        # iterate over clean dictionary and create an attribute for each key
        for k, v in clean_data_dict.items():
            setattr(self, k, v)

    def __str__(self):
        '''Return a RTD object as a string'''
        ativo = self.__dict__['ativo']
        ultima = self.__dict__['ultima']
        volume = self.__dict__['volume']
        return f'{ativo=} {ultima=} {volume=}'

    def return_rtd_as_df(self):
        '''Return a RTD object as a dataframe'''
        return pd.DataFrame.from_dict(self.__dict__())
