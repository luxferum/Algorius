from PyQt6.QtCore import QObject, pyqtSignal, QThread

from trydsocket import TrydSocket
from rtd import RTD


class Worker(QObject):
    '''Worker class that implements running tasks'''

    res = pyqtSignal(dict)
    socket = TrydSocket()
    juros_br = 'DI1F24'

    def __init__(self, callback, parent=None):
        super().__init__(parent)
        # Step 2: Create a QThread object
        self.thread = QThread()
        # Step 4: Move worker to the thread
        self.moveToThread(self.thread)
        # Step 5: Connect signals and slots
        self.thread.started.connect(self.run)
        self.res.connect(callback)
        self.thread.start()

    def destroy_thread(self):
        self.thread.exit()

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
            print(res_dict)

            self.res.emit(res_dict)
