import pandas as pd
from numpy import exp

from auxiliar import rtd_clean_dict
from trydsocket import TrydSocket


class RTD:
    """RTD class is a real time data object with cleaned values from Tryd as attributes"""

    @classmethod
    def summarizer(cls, socket):
        """Calculate Summarizer"""

        # get real time data
        frc = RTD(socket.get_raw_rtd("FRC"))
        ddi = RTD(socket.get_raw_rtd("DDI"))
        di = RTD(socket.get_raw_rtd("DI1"))
        dol = RTD(socket.get_raw_rtd("DOLFUT"))
        wdo = RTD(socket.get_raw_rtd("WDOFUT"))
        ind = RTD(socket.get_raw_rtd("INDFUT"))
        win = RTD(socket.get_raw_rtd("WINFUT"))

        # calculate financial volume
        frc_volfin = frc.saldo_agr * 50_000 * (wdo.ultima / 1_000)
        ddi_volfin = ddi.saldo_agr * 50_000 * (wdo.ultima / 1_000)
        di_volfin = di.saldo_agr * (
            100_000 / pow(1 + ddi.ultima / 100, ddi.dias_uteis_ate_vencimento / 252)
        )
        dol_volfin = dol.saldo_agr * 50_000 * (dol.ultima / 1_000)
        wdo_volfin = wdo.saldo_agr * 10_000 * (dol.ultima / 1_000)
        ind_volfin = ind.saldo_agr * ind.ultima
        win_volfin = win.saldo_agr * win.ultima * 0.20

        # from profit: correlation between the asset and wdo/dol?
        frc_dol_corr = 0.084 + 0.031 + (-0.107)
        ddi_dol_corr = 0.363
        di_dol_corr = 0.464
        dol_dol_corr = 1
        wdo_dol_corr = 1
        ind_dol_corr = -0.669
        win_dol_corr = -0.667

        # calculate agression * correlation with dol * financial volume
        frc_calc = frc_dol_corr * frc_volfin
        ddi_calc = ddi_dol_corr * ddi_volfin
        di_calc = di_dol_corr * di_volfin
        dol_calc = dol_dol_corr * dol_volfin
        wdo_calc = wdo_dol_corr * wdo_volfin
        ind_calc = ind_dol_corr * ind_volfin
        win_calc = win_dol_corr * win_volfin

        # calculate summarizer
        summarizer = (
            frc_calc + ddi_calc + di_calc + dol_calc + wdo_calc + ind_calc + win_calc
        )

        return (
            summarizer,
            frc_calc,
            ddi_calc,
            di_calc,
            dol_calc,
            wdo_calc,
            ind_calc,
            win_calc,
        )

    @classmethod
    def fair_price(cls, socket, di_code="DI1F24", juros_eua=4.59):
        """Calculate fair price"""

        # get real time data
        frp0 = RTD(socket.get_raw_rtd("FRP0"))
        dol = RTD(socket.get_raw_rtd("DOLFUT"))
        di = RTD(socket.get_raw_rtd("DI1"))

        # first calculation
        spot = dol.ultima - frp0.ultima
        delta_dias = dol.dias_uteis_ate_vencimento / 252
        delta_j = (di.ultima / 100) - (juros_eua / 100)

        # final result
        fair_price = spot * exp(delta_j * delta_dias)

        return fair_price, spot, dol.ultima, di.ultima

    @classmethod
    def fair_price_ptax(cls, socket, di_code="DI1F24"):
        """Calculate fair price using ptax style"""

        # real time data
        frc = RTD(socket.get_raw_rtd("FRC"))
        frp0 = RTD(socket.get_raw_rtd("FRP0"))
        dol = RTD(socket.get_raw_rtd("DOLFUT"))
        di = RTD(socket.get_raw_rtd("DI1"))

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
        """Create a RTD object with raw data"""

        # create a raw list using raw data string
        raw_data_list = raw_data.split("|")

        # create a clean dictionary using raw data list
        clean_data_dict = rtd_clean_dict(raw_data_list)

        # iterate over clean dictionary and create an attribute for each key
        for k, v in clean_data_dict.items():
            setattr(self, k, v)

    def __str__(self):
        """Return a RTD object as a string"""
        ativo = self.__dict__["ativo"]
        ultima = self.__dict__["ultima"]
        volume = self.__dict__["volume"]
        return f"{ativo=} {ultima=} {volume=}"

    def return_rtd_as_df(self):
        """Return a RTD object as a dataframe"""
        return pd.DataFrame.from_dict(self.__dict__())
