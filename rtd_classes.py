from PyQt6.QtCore import QObject, pyqtSignal
from numpy import exp
import pandas as pd
import socket
import re
from rtd_auxiliar import rtd_clean_dict


class TrydSocket():
    '''TrydSocket class manage connection with tryd to get raw real time data'''

    # datatypes for real time data
    COTACAO = 'COT$S|'
    AUTOMATIZADOR = 'AUT$S|'
    LIVRO_DE_OFERTAS = 'LVL2$S|'
    NEGOCIO = 'NEG$S|'
    NEGOCIO_COMPLETO = 'NEGS$S|'
    INTERVALO_GRAFICO = 'GRF$S|'

    def __init__(self, port=8080):
        '''Create and connect to socket to access tryd to get real time data'''

        # create socket to get real time data
        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        # connect socket to server with ip address and port
        self.s.connect((socket.gethostbyname(socket.gethostname()), port))

    def get_raw_rtd(self, asset_name):
        '''Use socket to return a string with raw real time data given an asset_name'''

        # send informations to server to get the data delimited by #
        self.s.sendall(str.encode(TrydSocket.COTACAO + asset_name + '#'))

        # receive the real time data as a string
        buffer = self.s.recv(1024).decode()

        # filter the real time data by the delimiter
        data = re.search(f'(?<=COT!){asset_name}(.[^#]*)(?=#)', buffer)

        # return the real time data filtered as string
        return self.get_raw_rtd(asset_name) if data is None else data.group(0)


class RTD:
    '''RTD class is a real time data object with cleaned rtd values as attributes'''

    @classmethod
    def fair_price(cls, socket, juros_br='DI1H23', juros_eua=4.59):
        '''Calculate fair price'''

        # real time data
        frp0 = RTD(socket.get_raw_rtd('FRP0'))
        dolfut = RTD(socket.get_raw_rtd('DOLFUT'))
        di1fut = RTD(socket.get_raw_rtd(juros_br))

        # info used to calculate
        spot = dolfut.ultima - frp0.ultima
        delta_dias = dolfut.dias_uteis_ate_vencimento / 252
        delta_j = (di1fut.ultima / 100) - (juros_eua / 100)

        # final result
        fair_price = round(spot * exp(delta_j*delta_dias), 2)

        return fair_price, spot, dolfut.ultima, di1fut.ultima

    @classmethod
    def fair_price_ptax(cls, socket, juros_br='DI1H23'):
        '''Calculate fair price using ptax style'''

        # real time data
        frp0 = RTD(socket.get_raw_rtd('FRP0'))
        dolfut = RTD(socket.get_raw_rtd('DOLFUT'))
        di1fut = RTD(socket.get_raw_rtd(juros_br))
        frcfut = RTD(socket.get_raw_rtd('FRCJ23'))

        # info used to calculate
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
        '''Create an RTD object with raw rtd'''

        # create a list with the raw data string
        raw_data_list = raw_data.split('|')

        # clean the raw data list and turn into a cleaned dictionary
        clean_data_dict = rtd_clean_dict(raw_data_list)

        # iter over the dictionary and create a atribute for each key
        for k, v in clean_data_dict.items():
            setattr(self, k, v)

    def __str__(self):
        '''Return a string representation of the RTD object as dictionary'''
        ativo = self.__dict__['ativo']
        ultima = self.__dict__['ultima']
        volume = self.__dict__['volume']
        return f'{ativo=} {ultima=} {volume=}'

    def return_rtd_as_df(self):
        '''Return a rtd object as a dataframe'''
        return pd.DataFrame.from_dict(self.__dict__())


class Worker(QObject):
    '''Worker class that implements running tasks'''

    res = pyqtSignal(dict)
    juros_br = 'DI1H23'  # 'DI1F25' ou 'DI1H23'

    def run(self):
        socket = TrydSocket(port=8080)

        while (True):
            fair, spot, future, di = RTD.fair_price(socket, self.juros_br)
            fair_ptax, _, _, _ = RTD.fair_price_ptax(socket, self.juros_br)

            res_dict = {
                'fair': fair,
                'fair_ptax': fair_ptax,
                'spot': spot,
                'future': future,
                'di': di,
            }

            print(res_dict)
            self.res.emit(res_dict)
