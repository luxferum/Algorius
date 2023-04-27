from rtd import RTD
from trydsocket import TrydSocket


class Worker:
    """Worker class that implements running tasks"""

    def test_fair_prices_summarizer(self, socket):
        fair, spot, future, _ = RTD.fair_price(socket)
        fair_ptax, _, _, _ = RTD.fair_price_ptax(socket)
        summarizer, frc, ddi, di, dol, wdo, ind, win = RTD.summarizer(socket)

        res_dict = {
            "fair": round(fair, 2),
            "spot": round(spot, 2),
            "future": round(future, 2),
            "fair_ptax": round(fair_ptax, 2),
            "summarizer": round(summarizer, 2),
            "frc": str(round(frc, 2)),
            "ddi": str(round(ddi, 2)),
            "di": str(round(di, 2)),
            "dol": str(round(dol, 2)),
            "wdo": str(round(wdo, 2)),
            "ind": str(round(ind, 2)),
            "win": str(round(win, 2)),
        }

        for k, v in res_dict.items():
            print(f"{k} = {v}")

    def run(self):
        """Get real time data and send signal to frontend"""
        socket = TrydSocket()

        while True:
            self.test_fair_prices_summarizer(socket)
            break
