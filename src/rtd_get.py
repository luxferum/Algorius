import re
import socket
from datetime import datetime
from multiprocessing import Pool
from select import select

from unidecode import unidecode


class GetRTD:
    """RTD class is a real time data object with cleaned values from Tryd as attributes"""

    tryd_data_keys = [
        "Ticker                        ",
        "Última                        ",
        "Var.                          ",
        "Qtd. Compra                   ",
        "Compra                        ",
        "Venda                         ",
        "Qtd. Venda                    ",
        "Abertura                      ",
        "Máxima                        ",
        "Mínima                        ",
        "Fechamento                    ",
        "Volume                        ",
        "Hora                          ",
        "Fech. Ajustado                ",
        "Núm. de Negócios              ",
        "Média                         ",
        "Papéis Negociados             ",
        "TODO IDENTIFICAR (01)         ",
        "Estado                        ",
        "Vencimento                    ",
        "Lote Mínimo                   ",
        "Dias até Vencimento           ",
        "Dias Úteis até Vencimento     ",
        "Var. %                        ",
        "Var. (Var. %)                 ",
        "Data                          ",
        "Data/Hora                     ",
        "Descrição                     ",
        "Exercício                     ",
        "Var. Simb.                    ",
        "Semanal (Var. %)              ",
        "Mensal (Var. %)               ",
        "Anual (Var. %)                ",
        "30 Dias (Var. %)              ",
        "12 Meses (Var. %)             ",
        "52 Semanas (Var. %)           ",
        "2 Anos (Var. %)               ",
        "Ajuste PU                     ",
        "Ajuste PU Anterior            ",
        "Preço Teórico                 ",
        "Quantidade Teórica            ",
        "Fim do Leilão                 ",
        "Contratos em Aberto           ",
        "Fech. Ajustado Anterior       ",
        "MCap                          ",
        "Ações no Mercado              ",
        "Agr. Cmp.                     ",
        "Agr. Cmp. (Direto)            ",
        "Agr. Cmp. (Não-direto)        ",
        "Agr. Vnd.                     ",
        "Agr. Vnd. (Direto)            ",
        "Agr. Vnd. (Não-direto)        ",
        "Saldo Agr.                    ",
        "Saldo Agr. (Direto)           ",
        "Saldo Agr. (Não-direto)       ",
        "Agr. Cmp. %                   ",
        "Agr. Cmp. % (Direto)          ",
        "Agr. Cmp. % (Não-direto)      ",
        "Agr. Vnd. %                   ",
        "Agr. Vnd. % (Direto)          ",
        "Agr. Vnd. % (Não-direto)      ",
        "Qtd. Rest.                    ",
        "Ind. Sald.                    ",
        "Neg. Agr. Cmp.                ",
        "Neg. Agr. Cmp. (Direto)       ",
        "Neg. Agr. Cmp. (Não-direto)   ",
        "Neg. Agr. Vnd.                ",
        "Neg. Agr. Vnd. (Direto)       ",
        "Neg. Agr. Vnd. (Não-direto)   ",
        "Saldo Neg. Agr.               ",
        "Saldo Neg. Agr. (Direto)      ",
        "Saldo Neg. Agr. (Não-direto)  ",
        "Neg. Agr. Cmp. %              ",
        "Neg. Agr. Cmp. % (Direto)     ",
        "Neg. Agr. Cmp. % (Não-direto) ",
        "Neg. Agr. Vnd. %              ",
        "Neg. Agr. Vnd. % (Direto)     ",
        "Neg. Agr. Vnd. % (Não-direto) ",
        "PTAX P1                       ",
        "PTAX P2                       ",
        "PTAX P3                       ",
        "PTAX P4                       ",
        "PTAX Oficial                  ",
        "PTAX Fut. P1                  ",
        "PTAX Fut. P2                  ",
        "PTAX Fut. P3                  ",
        "PTAX Fut. P4                  ",
        "PTAX Fut. Oficial             ",
    ]

    tryd_month_letter = {
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

    tryd_data_types = {
        "cotacao": "COT$S|",
        "automatizador": "AUT$S|",
        "livro_de_ofertas": "LVL2$S|",
        "negocio": "NEG$S|",
        "negocio_completo": "NEGS$S|",
        "intervalo_grafico": "GRF$S|",
    }

    @classmethod
    def clean_keys(cls):
        """Return a list of rtd keys cleaned up"""

        def clean_key(s):
            s = unidecode(s)
            s = s.strip()
            s = s.lower()
            s = s.replace(" ", "_").replace("-", "_")
            s = s.replace(".", "").replace("(", "").replace(")", "")
            s = s.replace("%", "porcentagem")
            return s

        return [clean_key(k) for k in GetRTD.tryd_data_keys]

    @classmethod
    def clean_values(cls, values):
        """Given raw rtd. Return a list of rtd values cleaned up"""

        def clean_value(value):
            def string_to_float(s):
                try:
                    s = float(s)
                    return s
                except:
                    return s

            value = value.replace(".", "").replace(",", ".")
            return string_to_float(value)

        return [clean_value(i) for i in values]

    def __init__(self, port=8080):
        self.port = port
        self.ip = socket.gethostbyname(socket.gethostname())

    def pool_find_ticker_name(self, ticker_prefix_list=["FRC", "DI1", "DDI"]):
        with Pool(len(ticker_prefix_list)) as pool:
            ticker_name_list = pool.map(self.find_ticker_name, ticker_prefix_list)
            self.ticker_prefix_to_name = {t[:3]: t for t in ticker_name_list}

    def find_ticker_name(self, ticker_prefix):
        # print(f"{ticker_prefix} - Getting ticker data... ")

        current_year = int(datetime.now().strftime("%y"))
        current_month = int(datetime.now().strftime("%m"))

        ticker_data_list = []
        limit_year = current_year + 1  # o padrão de definido foi 5
        while current_year < limit_year:
            ticker_name = (
                f"{ticker_prefix}{self.tryd_month_letter[current_month]}{current_year}"
            )
            ticker_data = self.get_ticker_data(ticker_name)

            if "WDO" in ticker_prefix:
                if ticker_data["dias_uteis_ate_vencimento"] != 0:
                    return ticker_data

            if ticker_data:
                ticker_data_list.append(ticker_data)

            current_year = current_year + 1 if current_month == 12 else current_year
            current_month = 1 if current_month == 12 else current_month + 1

        ticker_data_list = sorted(
            ticker_data_list,
            key=lambda t: t["contratos_em_aberto"],
            reverse=True,
        )

        ticker_name_most_open_contracts = ticker_data_list[0]["ticker"]
        return ticker_name_most_open_contracts

    def pool_get_ticker_data(self, ticker_prefix_list):
        prefix2name = self.ticker_prefix_to_name

        ticker_name_list = []
        for ticker in ticker_prefix_list:
            if ticker in prefix2name.keys():
                ticker_name_list.append(prefix2name[ticker])
            else:
                ticker_name_list.append(ticker)

        with Pool(len(ticker_prefix_list)) as pool:
            return pool.map(self.get_ticker_data, ticker_name_list)

    def get_ticker_data(self, ticker_name):
        # print(f"\t{ticker_name}")

        tryd_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        tryd_socket.connect((self.ip, self.port))

        tryd_ticker = str.encode(self.tryd_data_types["cotacao"] + ticker_name + "#")
        tryd_socket.sendall(tryd_ticker)

        timeout = 5
        socket_response, _, _ = select([tryd_socket], [], [], timeout)
        if socket_response == []:
            return None

        tryd_response = tryd_socket.recv(1024).decode()
        data_str = re.search(f"(?<=COT!){ticker_name}(.[^#]*)(?=#)", tryd_response)
        data_list = data_str.group(0).split("|")
        data_dict = {
            k: v for k, v in zip(GetRTD.clean_keys(), GetRTD.clean_values(data_list))
        }

        return data_dict
