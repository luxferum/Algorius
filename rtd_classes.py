from collections import defaultdict
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

    # Connection information
    host = socket.gethostbyname(socket.gethostname())
    port = 8080

    def __init__(self):
        '''Create socket to access tryd to get real time data'''
        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def connect_socket(self, port=None):
        '''Connect to tryd socket given a port'''
        self.s.connect((TrydSocket.host, port))

    def close_socket(self):
        '''Close connection to tryd socket'''
        # releases the resource associated with a connection but does not
        # necessarily close the connection immediately
        self.s.close()

    def print_socket(self):
        '''Print socket'''
        print(f'Socket = {self.s}\n')

    def print_id_thread(self):
        '''Print ID thread'''
        print(f'\nId da thread principal: {win32api.GetCurrentThreadId()}')

    def get_raw_rtd(self, asset_name):
        '''Use socket to return raw real time data given an asset_name'''
        # flush socket before getting real time data
        info = b''
        self.s.sendall(info)
        # b'COT$S|PETR4#'
        info = str.encode(TrydSocket.COTACAO + asset_name + '#')
        self.s.sendall(info)
        # return a list of raw real time data
        return self.s.recv(1024).decode().replace("COT!", "").split("|")


class RTD:
    '''RTD class is a real time data object with cleaned rtd values as attributes'''
    rtd_dict = defaultdict(None)
    # rtd_df = pd.DataFrame()

    # @classmethod
    # def return_rtd_df(cls):
    #     return pd.DataFrame(RTD.rtd_dict, index=rtd_clean_keys())

    @classmethod
    def fair_price(cls, di1fut_user_choice, juros_eua_user_choice, tryd_socket):
        '''Calculate fair price with frp0 and dolfut'''
        # real time data
        frp0 = RTD(tryd_socket.get_raw_rtd('FRP0'))
        dolfut = RTD(tryd_socket.get_raw_rtd('DOLFUT'))

        # info used to calculate
        spot = dolfut.ultima - frp0.ultima
        delta_dias = int(dolfut.dias_uteis_ate_vencimento) / 252
        delta_j = di1fut_user_choice - juros_eua_user_choice

        # intermediate results
        numerador = exp(delta_j*delta_dias)

        # final result
        f = round(spot * numerador, 2)

        # print
        #print(f'fair price = {f} - spot = {spot}')
        return spot, f, dolfut.ultima

    @classmethod
    def fair_price_ptax(cls, di1fut_user_choice):
        '''Calculate fair price using ptax style with frp0, dolfut and frcfut'''
        # real time data
        frp0 = RTD.rtd_dict['FRP0']
        dolfut = RTD.rtd_dict['DOLFUT']
        frcfut = RTD.rtd_dict['FRCFUT']
        di = RTD.rtd_dict['DI1FUT']

        # info used to calculate
        spot = dolfut.ultima - frp0.ultima
        frcfut_fech = frcfut.ultima
        frcfut_dias = frcfut.dias_uteis_ate_vencimento / 252
        di_dias = di.dias_uteis_ate_vencimento / 252

        # intermediate results
        numerador = ((1+di1fut_user_choice) ** di_dias)
        denominador = 1 + frcfut_fech * frcfut_dias

        # final result
        f = round(spot * numerador / denominador, 2)

        # print
        #print(f'fair price ptax = {f} - spot = {spot}')
        return f

    # @classmethod
    # def std_dev_on_scale():
    #     pass

    # @classmethod
    # def std_dev_off_scale():
    #     pass

    # @classmethod
    # def avg_speed():
    #     pass

    # @classmethod
    # def simple_harmonic_oscilator():
    #     pass

    # @classmethod
    # def vwap_ZScore():
    #     pass

    def __init__(self, raw_data):
        '''Create an RTD object with rtd cleaned up'''
        for k, v in rtd_clean_dict(raw_data).items():
            setattr(self, k, v)

    def __str__(self, qnt_attr=2):
        '''Return a string representation of the RTD object'''
        print(f'----------------------------')
        for i, (k, v) in enumerate(self.__dict__.items()):
            if i < qnt_attr:
                print(f'\t{k} = {v}')
            else:
                break
        print(f'----------------------------')
        return ''

    def insert_rtd_in_dict(self):
        '''Insert a rtd object into the class attribute rtd_dict dictionary'''
        RTD.rtd_dict[self.ativo] = self

    def append_information_to_rtd(self, raw_data):
        '''Append information to the object'''
        d = rtd_clean_dict(raw_data)
        for k, v in self.__dict__.items():
            v.append(d[k])

    def return_rtd_as_df(self):
        '''Return a rtd object as a dataframe'''
        d = self.__dict__()
        df = pd.DataFrame.from_dict(d)

class Worker(QObject):
    '''Worker class that implements running tasks'''
    res = pyqtSignal(dict)
    
    TRYD = TrydSocket()
    TRYD.connect_socket(port=8080)
 
    def run(self):
        while True:
            time.sleep(2)
            spot, fair, future = RTD.fair_price(12.75, 4.75, self.TRYD)
            #fair_ptax = RTD.fair_price_ptax(1)

            dict_final = {
                'spot': spot,'future': future,'fair' : fair
            }
            self.res.emit(dict_final)

