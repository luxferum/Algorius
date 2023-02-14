from PyQt6.QtCore import QObject, pyqtSignal
from numpy import exp
import pandas as pd
import win32api
import socket
import re
from rtd_auxiliar import rtd_clean_dict


class TrydSocket():
    '''TrydSocket class manage connection with tryd to get raw real time data'''

    # Datatypes for real time data
    COTACAO = 'COT$S|'
    AUTOMATIZADOR = 'AUT$S|'
    LIVRO_DE_OFERTAS = 'LVL2$S|'
    NEGOCIO = 'NEG$S|'
    NEGOCIO_COMPLETO = 'NEGS$S|'
    INTERVALO_GRAFICO = 'GRF$S|'

    def __init__(self, port=8080):
        '''Create and connect to socket to access tryd to get real time data'''

        self.host = socket.gethostbyname(socket.gethostname())
        self.port = port

        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.s.connect((self.host, port))

        print(f'\n----- SOCKET CONNECTED\n \t{self.s} \n')

    def close_socket(self):
        '''Releases the resource associated with connection socket'''

        self.s.close()

    def print_id_thread(self):
        '''Print ID thread'''

        print(f'Socket: {self.s}\n')
        print(f'\nId da thread principal: {win32api.GetCurrentThreadId()}')

    def get_raw_rtd(self, asset_name):
        '''Use socket to return raw real time data given an asset_name'''

        # buffer for real time data
        self.s.sendall(str.encode(TrydSocket.COTACAO + asset_name + '#'))
        buffer = self.s.recv(1024).decode()

        # filter buffer to match selected asset
        pattern = re.compile(f'(?<=COT!{asset_name})(.*)(?=#)')
        data = re.search(pattern, buffer)
        self.s.sendall(b'')

        if data is None:
            # reexecute function if regex not found
            return self.get_raw_rtd(asset_name)
        else:
            # return list of values for the selected asset
            return data.group().split('|')


class RTD:
    '''RTD class is a real time data object with cleaned rtd values as attributes'''

    @classmethod
    def fair_price(cls, tryd_socket, juros_br, juros_eua=4.59):
        '''Calculate fair price with frp0 and dolfut'''

        # real time data
        frp0 = RTD(tryd_socket.get_raw_rtd('FRP0'))
        dolfut = RTD(tryd_socket.get_raw_rtd('DOLFUT'))
        di1fut = RTD(tryd_socket.get_raw_rtd(juros_br))

        # info used to calculate
        spot = dolfut.ultima - frp0.ultima
        delta_dias = dolfut.dias_uteis_ate_vencimento / 252
        delta_j = (di1fut.ultima / 100) - (juros_eua / 100)

        # final result
        fair_price = round(spot * exp(delta_j*delta_dias), 2)

        return fair_price, spot, dolfut.ultima, di1fut.ultima

    @classmethod
    def fair_price_ptax(cls, tryd_socket, juros_br):
        '''Calculate fair price using ptax style with frp0, dolfut and frcfut'''

        # real time data
        frp0 = RTD(tryd_socket.get_raw_rtd('FRP0'))
        dolfut = RTD(tryd_socket.get_raw_rtd('DOLFUT'))
        di1fut = RTD(tryd_socket.get_raw_rtd(juros_br))
        frcfut = RTD(tryd_socket.get_raw_rtd('FRCJ23'))

        # info used to calculate
        spot = dolfut.ultima - frp0.ultima
        frcfut_dias = frcfut.dias_uteis_ate_vencimento / 252
        di1fut_dias = di1fut.dias_uteis_ate_vencimento / 252

        # intermediate results
        numerador = (1 + (di1fut.ultima / 100) / 252) ** di1fut_dias
        denominador = 1 + (frcfut.ultima / 100) * frcfut_dias

        # final result
        fair_price_ptax = round(spot * numerador / denominador, 2)

        return fair_price_ptax

    def __init__(self, raw_data):
        '''Create an RTD object with rtd cleaned up'''

        for k, v in rtd_clean_dict(raw_data).items():
            setattr(self, k, v)

    def __str__(self, qnt_attr=10):
        '''Return a string representation of the RTD object'''

        print(f'----------------------------')
        for i, (k, v) in enumerate(self.__dict__.items()):
            if i < qnt_attr:
                print(f'\t{k} = {v}')
            else:
                break
        print(f'----------------------------')
        return ''

    def return_rtd_as_df(self):
        '''Return a rtd object as a dataframe'''

        return pd.DataFrame.from_dict(self.__dict__())


class Worker(QObject):
    '''Worker class that implements running tasks'''

    res = pyqtSignal(dict)
    juros_br = 'DI1H23'  # 'DI1F25' 'DI1H23'

    def run(self):
        tryd_socket = TrydSocket(port=8080)

        while True:
            fair_ptax = RTD.fair_price_ptax(tryd_socket, self.juros_br)
            fair, spot, future, juros_br = RTD.fair_price(
                tryd_socket, self.juros_br)

            res_dict = {
                'fair_ptax': fair_ptax,
                'fair': fair,
                'spot': spot,
                'future': future,
                'juros_br': juros_br,
            }

            print(res_dict)

            self.res.emit(res_dict)
