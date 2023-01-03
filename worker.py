from preprocessing import *
from rtd_classes import *
from worker import *
from ctypes import *
import win32api
import socket
from time import sleep
from PyQt6.QtCore import QObject, pyqtSignal
import json

class Worker(QObject):
    progress = pyqtSignal(RTD)

    # --- ESCOLHER OS ATIVOS -----------------#
    ATIVO = ['FRP0', 'DOLFUT']
    COTACAO = 'COT$S|'
    # ========================================#

    # --- INFORMACOES DO SERVIDOR ------------#
    HOST = '192.168.0.10'  # ipv4
    PORT = 8080
    # ========================================#

    def run(self):
        while True:
            raw_obj = self.start_rtd()
            sleep(1)
            self.progress.emit(raw_obj)

    def ByteConvert(self, dataInfo, ativo):
        return str.encode(dataInfo + ativo + '#')

    array_dict_assets = []

    def start_rtd(self):
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.connect((self.HOST, self.PORT))
                try:
                    for item in self.ATIVO:
                        # data in string
                        s.sendall(self.ByteConvert(self.COTACAO, item))
                        data = s.recv(1024).decode().replace("COT!", "").split("|")
                        # data in dictionary
                        data_dict = clean_rtd_as_dict(data)
                        # data in RTD object
                        data_rtd = RTD(data_dict)
                        # print RTD object
                    return data_rtd

                except Exception as ex:
                    print(ex)

        except Exception as ex:
            print(f'\nNão foi possivel conectar no servidor RTD. Erro:\n{ex}\n')