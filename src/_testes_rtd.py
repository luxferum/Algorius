import time

from worker import Worker

if __name__ == "__main__":
    """This is used to test RTD functionalities"""
    start = time.time()

    w1 = Worker()
    r = w1.run()

    end = time.time()

    print(f"Rodou worker em {round(end - start, 2)} seconds")


# class Worker(QObject):
#     """Worker class that implements running tasks"""

#     res = pyqtSignal(dict)

#     def __init__(self, callback=None, parent=None):
#         """Constructor worker class with given callback and parent"""
#         super().__init__(parent)
#         if callback is not None:
#             # Step 1: Create a QThread object
#             self.thread = QThread()
#             # Step 2: Move worker to the thread
#             self.moveToThread(self.thread)
#             # Step 3: Connect signals and slots
#             self.thread.started.connect(self.run)
#             self.res.connect(callback)
#             self.thread.start()

#     def destroy_thread(self):
#         """Destroy the thread using exit() method"""
#         self.thread.exit()

#     def run(self):
#         """Get real time data and send signal to frontend"""
#         socket = TrydSocket()

#         while True:
#             fair, spot, future, _ = RTD.fair_price(socket)
#             fair_ptax, _, _, _ = RTD.fair_price_ptax(socket)
#             summarizer, frc, ddi, di, dol, wdo, ind, win = RTD.summarizer(socket)

#             res_dict = {
#                 "fair": round(fair, 2),
#                 "spot": round(spot, 2),
#                 "future": round(future, 2),
#                 "fair_ptax": round(fair_ptax, 2),
#                 "summarizer": round(summarizer, 2),
#                 "frc": str(round(frc, 2)),
#                 "ddi": str(round(ddi, 2)),
#                 "di": str(round(di, 2)),
#                 "dol": str(round(dol, 2)),
#                 "wdo": str(round(wdo, 2)),
#                 "ind": str(round(ind, 2)),
#                 "win": str(round(win, 2)),
#             }

#             # for k, v in res_dict.items():
#             #     print(f"{k} = {v}")

#             break

#             self.res.emit(res_dict)
