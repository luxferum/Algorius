import re
import socket
from datetime import datetime
from select import select

from auxiliar import rtd_clean_dict


class TrydSocket:
    """TrydSocket class manage the connection with Tryd to get real time data"""

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

    # tryd asset types
    COTACAO = "COT$S|"
    AUTOMATIZADOR = "AUT$S|"
    LIVRO_DE_OFERTAS = "LVL2$S|"
    NEGOCIO = "NEG$S|"
    NEGOCIO_COMPLETO = "NEGS$S|"
    INTERVALO_GRAFICO = "GRF$S|"

    def __init__(self, port=8080):
        """Create socket and connect to Tryd's server to get real time data"""

        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        ip = socket.gethostbyname(socket.gethostname())
        self.socket.connect((ip, port))

    def get_data(self, asset_name, timeout=1):
        """Use socket to get real time data of a given asset"""

        asset_type_name_delimiter = str.encode(TrydSocket.COTACAO + asset_name + "#")
        self.socket.sendall(asset_type_name_delimiter)

        socket_response, _, _ = select([self.socket], [], [], timeout)
        if socket_response == []:
            # print(f"{asset_name} ERROR")
            return None

        # print(f"{asset_name} OK")
        data = self.socket.recv(1024).decode()

        regex = f"(?<=COT!){asset_name}(.[^#]*)(?=#)"
        data = re.search(regex, data)

        # se o que eu estiver fazendo regex e não for o que eu quero... recursão
        if data is None:
            return self.get_data(asset_name)

        data = data.group(0)
        data_list = data.split("|")
        data_dict_clean = rtd_clean_dict(data_list)

        return data_dict_clean

    def get_asset_data(self, asset_prefix):
        """Use socket to get real time data given an asset_prefix with current date codes"""
        print(f"{asset_prefix} - Getting asset data... ")

        if "FUT" in asset_prefix or "0" in asset_prefix:
            return self.get_data(asset_prefix)

        current_year = int(datetime.now().strftime("%y"))
        current_month = int(datetime.now().strftime("%m"))

        # CASO ESPECIAL PARA DEPOIS WDO -> SE PEGAR O ATUAL, MAS VENCE HOJE PEGA O PROXIMO OU SEJA, USA MONTH + 1
        asset_data_list = []
        while current_year < 25:
            current_month_letter = self.month2letter[current_month]
            asset_name = f"{asset_prefix}{current_month_letter}{current_year}"

            asset_data = self.get_data(asset_name)
            if asset_data:
                asset_data_list.append(asset_data)

            current_year = current_year + 1 if current_month == 12 else current_year
            current_month = 1 if current_month == 12 else current_month + 1

        asset_data_list = sorted(
            asset_data_list,
            key=lambda asset: asset["contratos_em_aberto"],
            reverse=True,
        )
        asset_data_most_open_contracts = asset_data_list[0]

        # for d in asset_data_list:
        #     print(d["ativo"], d["contratos_em_aberto"])
        print(f"{asset_prefix} - Done! ")
        return asset_data_most_open_contracts
