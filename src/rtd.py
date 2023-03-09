from numpy import exp
import pandas as pd

from auxiliar import rtd_clean_dict


class RTD:
    '''RTD class is a real time data object with cleaned values from Tryd as attributes'''

    @classmethod
    def summarizer(cls, socket):
        '''Calculate Summarizer'''

        # get real time data
        frc = RTD(socket.get_raw_rtd('FRCN23'))
        ddi = RTD(socket.get_raw_rtd('DI1F24'))
        di = RTD(socket.get_raw_rtd('DI1F25'))
        dol = RTD(socket.get_raw_rtd('DOLFUT'))
        wdo = RTD(socket.get_raw_rtd('WDOFUT'))
        ind = RTD(socket.get_raw_rtd('INDFUT'))
        win = RTD(socket.get_raw_rtd('WINFUT'))

        # calculate financial volume
        frc_volfin = 50_000 * (wdo.ultima / 1_000)
        ddi_volfin = 50_000 * (wdo.ultima / 1_000)
        di_volfin = 100_000 / pow(1 + ddi.ultima / 100,
                                  ddi.dias_uteis_ate_vencimento / 252)
        dol_volfin = 50_000 * dol.ultima
        wdo_volfin = 10_000 * dol.ultima
        ind_volfin = ind.ultima
        win_volfin = 0.20 * win.ultima

        # from profit: correlation between the asset and wdo/dol?
        frc_dol_corr = .084 + .031 + (-.107)
        ddi_dol_corr = .363
        di_dol_corr = .464
        dol_dol_corr = 1
        wdo_dol_corr = 1
        ind_dol_corr = -.669
        win_dol_corr = -.667

        # calculate agression * correlation with dol * financial volume
        frc_calc = frc.saldo_agr * frc_dol_corr * frc_volfin
        ddi_calc = ddi.saldo_agr * ddi_dol_corr * ddi_volfin
        di_calc = di.saldo_agr * di_dol_corr * di_volfin
        dol_calc = dol.saldo_agr * dol_dol_corr * dol_volfin
        wdo_calc = wdo.saldo_agr * wdo_dol_corr * wdo_volfin
        ind_calc = ind.saldo_agr * ind_dol_corr * ind_volfin
        win_calc = win.saldo_agr * win_dol_corr * win_volfin

        # calculate summarizer
        summarizer = frc_calc + ddi_calc + di_calc + \
            dol_calc + wdo_calc + ind_calc + win_calc

        return summarizer, frc_calc, ddi_calc, di_calc, dol_calc, wdo_calc, ind_calc, win_calc

    @classmethod
    def fair_price(cls, socket, di_code='DI1F24', juros_eua=4.59):
        '''Calculate fair price'''

        # get real time data
        frp0 = RTD(socket.get_raw_rtd('FRP0'))
        dol = RTD(socket.get_raw_rtd('DOLFUT'))
        di = RTD(socket.get_raw_rtd(di_code))

        # first calculation
        spot = dol.ultima - frp0.ultima
        delta_dias = dol.dias_uteis_ate_vencimento / 252
        delta_j = (di.ultima / 100) - (juros_eua / 100)

        # final result
        fair_price = spot * exp(delta_j*delta_dias)

        return fair_price, spot, dol.ultima, di.ultima

    @classmethod
    def fair_price_ptax(cls, socket, di_code='DI1F24'):
        '''Calculate fair price using ptax style'''

        # real time data
        frc = RTD(socket.get_raw_rtd('FRCJ24'))
        frp0 = RTD(socket.get_raw_rtd('FRP0'))
        dol = RTD(socket.get_raw_rtd('DOLFUT'))
        di = RTD(socket.get_raw_rtd(di_code))

        # first calculation
        spot = dol.ultima - frp0.ultima
        frc_dias = frc.dias_uteis_ate_vencimento / 252
        di_dias = di.dias_uteis_ate_vencimento / 252

        # intermediate result
        numerador = pow(1 + (di.ultima / 100) / 252, di_dias)
        denominador = 1 + (frc.ultima / 100) * frc_dias

        # final result
        fair_price_ptax = spot * numerador / denominador

        return fair_price_ptax, spot, dol.ultima, di.ultima

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
