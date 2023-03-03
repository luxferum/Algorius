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
            summarizer, frc, di1f1, di1f2, dolfut, wdofut, indfut, winfut = RTD.summarizer(
                socket)

            res_dict = {
                'fair': fair,
                'fair_ptax': fair_ptax,
                'spot': spot,
                'future': future,
                'di': di,
                'summarizer': summarizer,
                'frc': str(frc),
                'di1f1': str(di1f1),
                'di1f2': str(di1f2),
                'dolfut': str(dolfut),
                'wdofut': str(wdofut),
                'indfut': str(indfut),
                'winfut': str(winfut)
            }

            print(res_dict)

            self.res.emit(res_dict)
