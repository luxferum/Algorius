import re
import socket
from datetime import datetime
from multiprocessing import Pool
from select import select

from auxiliar import rtd_clean_dict

# tryd month to letter table
month2letter = {
    1: "G",
    2: "H",
    3: "J",
    4: "K",
    5: "M",
    6: "N",
    7: "Q",
    8: "U",
    9: "V",
    10: "X",
    11: "Z",
    12: "F",
}

# tryd ticker types
COTACAO = "COT$S|"
AUTOMATIZADOR = "AUT$S|"
LIVRO_DE_OFERTAS = "LVL2$S|"
NEGOCIO = "NEG$S|"
NEGOCIO_COMPLETO = "NEGS$S|"
INTERVALO_GRAFICO = "GRF$S|"

# ip and port to connect to
PORT = 8080
IP = socket.gethostbyname(socket.gethostname())


def get_tickers_data_pool(tickers):
    with Pool(len(tickers)) as pool:
        return pool.map(get_ticker_data, tickers)


def get_ticker_data(ticker_prefix):
    """Use socket to get tryd real time data with most 'contratos_em_aberto' of a given ticker as a dictionary with cleaned data"""
    print(f"{ticker_prefix} - Getting ticker data... ")

    current_year = int(datetime.now().strftime("%y"))
    current_month = int(datetime.now().strftime("%m"))

    if "FUT" in ticker_prefix or "0" in ticker_prefix:
        return get_data(ticker_prefix)

    if "WDO" in ticker_prefix:
        ticker_name = f"{ticker_prefix}{month2letter[current_month]}{current_year}"
        ticker_data = get_data(ticker_name)

        if ticker_data["dias_uteis_ate_vencimento"] != 0:
            return ticker_data

        current_year = current_year + 1 if current_month == 12 else current_year
        current_month = 1 if current_month == 12 else current_month + 1
        ticker_name = f"{ticker_prefix}{month2letter[current_month]}{current_year}"
        return get_data(ticker_name)

    ticker_data_list = []
    limit_year = current_year + 5
    while current_year < limit_year:
        ticker_name = f"{ticker_prefix}{month2letter[current_month]}{current_year}"
        ticker_data = get_data(ticker_name)

        if ticker_data:
            ticker_data_list.append(ticker_data)

        current_year = current_year + 1 if current_month == 12 else current_year
        current_month = 1 if current_month == 12 else current_month + 1

    ticker_data_list = sorted(
        ticker_data_list,
        key=lambda ticker: ticker["contratos_em_aberto"],
        reverse=True,
    )

    # for d in ticker_data_list:
    #     print(d["ativo"], d["contratos_em_aberto"], end=" - ")

    return ticker_data_list[0]


def get_data(ticker_name, timeout=1):
    """Use socket to get tryd real time data of a given ticker as a dictionary with cleaned data"""
    # print(f"\t{ticker_name}")

    tryd_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tryd_socket.connect((IP, PORT))

    ticker_type_name_delimiter = str.encode(COTACAO + ticker_name + "#")
    tryd_socket.sendall(ticker_type_name_delimiter)

    socket_response, _, _ = select([tryd_socket], [], [], timeout)
    if socket_response == []:
        return None

    data_response = tryd_socket.recv(1024).decode()
    data_regex = re.search(f"(?<=COT!){ticker_name}(.[^#]*)(?=#)", data_response)
    data_str = data_regex.group(0)
    data_list = data_str.split("|")
    data_dict_clean = rtd_clean_dict(data_list)

    return data_dict_clean
