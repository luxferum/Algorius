from numpy import exp

from rtd_get import GetRTD


class UseRTD:
    def __init__(self):
        self.rtd_get = GetRTD()
        self.rtd_get.pool_find_ticker_name()

    def summarizer(self):
        """Calculate Summarizer"""

        # get real time data
        ticker_names = [
            "FRC",
            "DDI",
            "DI1",
            "DOLFUT",
            "WDOFUT",
            "INDFUT",
            "WINFUT",
        ]
        ticker_data = self.rtd_get.pool_get_ticker_data(ticker_names)
        frc, ddi, di, dol, wdo, ind, win = ticker_data

        # calculate financial volume
        frc_volfin = frc["saldo_agr"] * 50_000 * (wdo["ultima"] / 1_000)
        ddi_volfin = ddi["saldo_agr"] * 50_000 * (wdo["ultima"] / 1_000)
        di_volfin = di["saldo_agr"] * (
            100_000
            / pow(1 + ddi["ultima"] / 100, ddi["dias_uteis_ate_vencimento"] / 252)
        )
        dol_volfin = dol["saldo_agr"] * 50_000 * (dol["ultima"] / 1_000)
        wdo_volfin = wdo["saldo_agr"] * 10_000 * (dol["ultima"] / 1_000)
        ind_volfin = ind["saldo_agr"] * ind["ultima"]
        win_volfin = win["saldo_agr"] * win["ultima"] * 0.20

        # from profit: correlation between the ticker and wdo/dol?
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

        return summarizer

    def fair_price(self, juros_eua=4.59):
        """Calculate fair price"""

        # get real time data
        ticker_names = ["FRP0", "DOLFUT", "DI1"]
        ticker_data = self.rtd_get.pool_get_ticker_data(ticker_names)
        frp0, dol, di = ticker_data

        # first calculation
        spot = dol["ultima"] - frp0["ultima"]
        delta_dias = dol["dias_uteis_ate_vencimento"] / 252
        delta_j = (di["ultima"] / 100) - (juros_eua / 100)

        # final result
        fair_price = spot * exp(delta_j * delta_dias)

        return fair_price, spot, dol["ultima"], di["ultima"]

    def fair_price_ptax(self):
        """Calculate fair price using ptax style"""

        # get real time data
        ticker_names = ["FRC", "FRP0", "DOLFUT", "DI1"]
        ticker_data = self.rtd_get.pool_get_ticker_data(ticker_names)
        frc, frp0, dol, di = ticker_data

        # first calculation
        spot = dol["ultima"] - frp0["ultima"]
        frc_dias = frc["dias_uteis_ate_vencimento"] / 252
        di_dias = di["dias_uteis_ate_vencimento"] / 252

        # intermediate result
        numerador = pow(1 + (di["ultima"] / 100) / 252, di_dias)
        denominador = 1 + (frc["ultima"] / 100) * frc_dias

        # final result
        fair_price_ptax = spot * numerador / denominador

        return fair_price_ptax, spot, dol["ultima"], di["ultima"]
