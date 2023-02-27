import socket
import re


class TrydSocket():
    '''TrydSocket class manage the connection with Tryd to get real time data'''

    # different asset types
    COTACAO = 'COT$S|'
    AUTOMATIZADOR = 'AUT$S|'
    LIVRO_DE_OFERTAS = 'LVL2$S|'
    NEGOCIO = 'NEG$S|'
    NEGOCIO_COMPLETO = 'NEGS$S|'
    INTERVALO_GRAFICO = 'GRF$S|'

    def __init__(self, port=8080):
        '''Create socket and connect to Tryd's server to get real time data'''

        # create socket to get real time data
        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        # connect socket to server using computer ip address and a given port
        self.s.connect((socket.gethostbyname(socket.gethostname()), port))

    def get_raw_rtd(self, asset_name):
        '''Use socket to get real time data given an asset_name as a string'''

        # send information to server to get the data from chosen asset delimited by #
        self.s.sendall(str.encode(TrydSocket.COTACAO + asset_name + '#'))

        # receive the real time data as a string
        buffer = self.s.recv(1024).decode()

        # filter the real time data by: chosen asset and delimiter
        data = re.search(f'(?<=COT!){asset_name}(.[^#]*)(?=#)', buffer)

        # return the real time data filtered as a string
        return self.get_raw_rtd(asset_name) if data is None else data.group(0)
