from collections import defaultdict
import re
from PyQt6.QtCore import QObject, pyqtSignal
from numpy import exp
import pandas as pd
import win32api
import socket
import time
from rtd_auxiliar import rtd_clean_dict, rtd_clean_keys


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
        print(f'----- Getting data from {asset_name=}')
        info = str.encode(TrydSocket.COTACAO + asset_name + '#')
        self.s.sendall(info)
        data = self.s.recv(1024).decode()  # .replace("COT!", "").split("|")
        data = re.search('(?<=COT!)(.*)(?=#)', data)
        self.s.sendall(b'')

        # time.sleep(0.5)
        return self.get_raw_rtd(asset_name) if data is None else data.group().split('|')


class RTD:
    '''RTD class is a real time data object with cleaned rtd values as attributes'''
    DI1FUT = 12.75
    JUROS_EUA = 4.75

    @classmethod
    def fair_price(cls, tryd_socket):
        '''Calculate fair price with frp0 and dolfut'''
        # real time data
        frp0 = RTD(tryd_socket.get_raw_rtd('FRP0'))
        dolfut = RTD(tryd_socket.get_raw_rtd('DOLFUT'))
        di1fut = RTD(tryd_socket.get_raw_rtd('DI1FUT'))

        # info used to calculate
        spot = dolfut.ultima - frp0.ultima
        delta_dias = dolfut.dias_uteis_ate_vencimento / 252
        delta_j = di1fut.ultima - RTD.JUROS_EUA

        # final result
        fair_price = round(spot * exp(delta_j*delta_dias), 2)

        # print(f'fair price = {fair_price} - spot = {spot}')
        return fair_price, spot, dolfut.ultima

    @classmethod
    def fair_price_ptax(cls, tryd_socket):
        '''Calculate fair price using ptax style with frp0, dolfut and frcfut'''
        # real time data
        frp0 = RTD(tryd_socket.get_raw_rtd('FRP0'))
        dolfut = RTD(tryd_socket.get_raw_rtd('DOLFUT'))
        di1fut = RTD(tryd_socket.get_raw_rtd('DI1FUT'))
        frcfut = RTD(tryd_socket.get_raw_rtd('FRCFUT'))

        # info used to calculate
        spot = dolfut.ultima - frp0.ultima
        frcfut_fech = frcfut.ultima
        frcfut_dias = frcfut.dias_uteis_ate_vencimento / 252
        di1fut_dias = di1fut.dias_uteis_ate_vencimento / 252

        # intermediate results
        numerador = ((1+di1fut_dias) ** di1fut_dias)
        denominador = 1 + frcfut_fech * frcfut_dias

        # final result
        fair_price_ptax = round(spot * numerador / denominador, 2)

        # print(f'fair price ptax = {f} - spot = {spot}')
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

    def run(self):
        tryd_socket = TrydSocket(port=8080)

        while True:
            fair, spot, future = RTD.fair_price(tryd_socket)
            res_dict = {
                'spot': spot,
                'future': future,
                'fair': fair
            }
            print(res_dict)

            # time.sleep(1)
            self.res.emit(res_dict)
