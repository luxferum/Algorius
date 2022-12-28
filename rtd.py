from asset import Asset
from auxiliar import byte_convert
import win32api
import socket


class RTD():
    '''
    RTD Class -> Create connection with server socket to get raw RTD

    Attributes
    ----------
        Description

    Methods
    -------
        Description
    '''

    # ==== ESCOLHER TIPO DE DADOS ============= #
    COTACAO = 'COT$S|'
    AUTOMATIZADOR = 'AUT$S|'
    LIVRO_DE_OFERTAS = 'LVL2$S|'
    NEGOCIO = 'NEG$S|'
    NEGOCIO_COMPLETO = 'NEGS$S|'
    INTERVALO_GRAFICO = 'GRF$S|'

    # ==== INFORMACOES DO SERVIDOR ============ #
    HOST = socket.gethostbyname(socket.gethostname())
    PORT = 8080

    def __init__(self, host=None, port=None):
        '''Connect to Tryd socket to get rtd'''
        try:
            self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.s.connect((host, port))
            print(f'\nId da thread principal: {win32api.GetCurrentThreadId()}')

        except Exception as ex:
            print(f'\nNão foi possivel conectar ao servidor RTD.')
            print(f'\nErro:\n{ex}\n')

    def close_socket(self):
        '''Close Tryd socket'''
        self.s.close()

    def get_raw_rtd(self, ativo):
        '''Use socket to get raw rtd from an asset'''
        try:
            self.s.sendall(byte_convert(self.COTACAO, ativo))
            return self.s.recv(1024).decode().replace("COT!", "").split("|")

        except Exception as ex:
            print(ex)

    def get_asset_rtd(self, ativo):
        return Asset(self.rtd.get_raw_rtd(ativo))
