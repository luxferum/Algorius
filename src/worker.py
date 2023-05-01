from rtd import RTD
from trydsocket import (
    get_ticker_data,
    pool_get_tickers_data,
    pool_init_find_tickers_name,
    tickers_dict,
)


class Worker:
    """Worker class that implements running tasks"""

    def test_fair_prices_summarizer(self):
        fair, spot, future, _ = RTD.fair_price()
        fair_ptax, spot, future, _ = RTD.fair_price_ptax()
        summarizer = RTD.summarizer()

        res_dict = {
            "fair": round(fair, 2),
            "spot": round(spot, 2),
            "future": round(future, 2),
            "fair_ptax": round(fair_ptax, 2),
            "summarizer": round(summarizer, 2),
        }

        for k, v in res_dict.items():
            print(f"{k} = {v}")

    def run(self):
        """Run worker"""

        tickers = [
            "FRC",
            "DI1",
            "DDI",
        ]

        r = pool_init_find_tickers_name(tickers)

        self.test_fair_prices_summarizer()

        return None
