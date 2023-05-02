from rtd_get import GetRTD
from rtd_use import UseRTD
from worker import Worker

tickers = [
    "FRC",
    "DDI",
    "DI1",
    "DOLFUT",
    "WDOFUT",
    "INDFUT",
    "WINFUT",
]

if __name__ == "__main__":
    rtd = UseRTD()

    r1 = rtd.fair_price()
    for r in r1:
        print(r)

    r2 = rtd.fair_price_ptax()
    for r in r2:
        print(r)

    r3 = rtd.summarizer()
    print(r3)


# if __name__ == "__main__":
#     rtd = GetRTD()
#     rtd.pool_find_ticker_name()
#     dados = rtd.pool_get_ticker_data(tickers)

#     for v in dados:
#         print(v)


# if __name__ == "__main__":
#     start = time.time()

#     w1 = Worker()
#     r = w1.run()

#     end = time.time()
#     print(f"Rodou worker em {round(end - start, 2)} seconds")
