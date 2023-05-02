from numpy import exp

from rtd_get import GetRTD

tickers = [
    "FRC",
    "DDI",
    "DI1",
    "DOLFUT",
    "WDOFUT",
    "INDFUT",
    "WINFUT",
]


class Worker:
    """Worker class that implements running tasks"""

    def run(self):
        """Run worker"""

        rtd = GetRTD()
        rtd.pool_find_ticker_name()
        dados = rtd.pool_get_ticker_data(tickers)

        for v in dados:
            print(v)
