from PyQt6.QtCore import QObject, pyqtSignal

from trydsocket import TrydSocket
from rtd import RTD


class Worker(QObject):
    '''Worker class that implements running tasks'''

    res = pyqtSignal(dict)
    socket = TrydSocket()
    juros_br = 'DI1H23'

    def run(self):
        socket, juros_br = self.socket, self.juros_br

        while (True):
            fair, spot, future, di = RTD.fair_price(socket, juros_br)
            fair_ptax, _, _, _ = RTD.fair_price_ptax(socket, juros_br)

            res_dict = {
                'fair': fair,
                'fair_ptax': fair_ptax,
                'spot': spot,
                'future': future,
                'di': di,
            }
            # print(res_dict)

            self.res.emit(res_dict)
