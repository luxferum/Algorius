import re
import socket
from datetime import datetime
from select import select

from auxiliar import rtd_clean_dict

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


class TrydSocket:
    """TrydSocket class manage the connection with Tryd to get real time data"""

    # different asset types
    COTACAO = "COT$S|"
    AUTOMATIZADOR = "AUT$S|"
    LIVRO_DE_OFERTAS = "LVL2$S|"
    NEGOCIO = "NEG$S|"
    NEGOCIO_COMPLETO = "NEGS$S|"
    INTERVALO_GRAFICO = "GRF$S|"

    def __init__(self, port=8080):
        """Create socket and connect to Tryd's server to get real time data"""

        # create socket to get real time data
        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        # connect socket to server using computer ip address and a given port
        self.s.connect((socket.gethostbyname(socket.gethostname()), port))

    def get_data(self, asset_name, timeout=1):
        """Use socket to get real time data of a given asset"""

        # send information to server to get the data from chosen asset delimited by #
        self.s.sendall(str.encode(TrydSocket.COTACAO + asset_name + "#"))

        # use select to get the response using a timeout if not available
        result, _, _ = select([self.s], [], [], timeout)

        # if the response is not available return None
        if result != []:
            # print(f"{asset_name} OK")

            # get the data as a string
            buffer = self.s.recv(1024).decode()

            # filter the real time data by: chosen asset and delimiter
            data = re.search(f"(?<=COT!){asset_name}(.[^#]*)(?=#)", buffer)

            """
            VERIFICAR AQUI SE FOR NONE E TAL! SÓ RETORNA SE NÃO FOR NONE
            AINDA TA ERRADO, PORQUE EU TIREI A RECURSÃO... TENHO QUE VERIFICAR
            E O DADO QUE EU TO PEGANDO É DO MESMO ASSET_NAME QUE EU PEDI!!!!!
            """
            if data is None:
                return self.get_data(asset_name)

            # data is not None
            raw_data = data.group(0)

            # create a raw list using raw data string
            raw_data_list = raw_data.split("|")

            # create a clean dictionary using raw data list
            clean_data_dict = rtd_clean_dict(raw_data_list)

            return clean_data_dict

        else:
            # print(f"{asset_name} ERROR")

            return None

    def get_data_most_volume(self, asset_prefix, timeout=1):
        """Use socket to get real time data given an asset_prefix with current date codes"""
        print(f"{asset_prefix}: ")

        # CASO ESPECIAL PARA DEPOIS WDO -> SE PEGAR O ATUAL, MAS VENCE HOJE PEGA O PROXIMO OU SEJA, USA MONTH + 1

        # dolfut, wdofut, frp0, etc... don't have other asset names based on date codes
        if "FUT" in asset_prefix or "0" in asset_prefix:
            return self.get_data(asset_prefix)

        asset_list = []

        year = int(datetime.now().strftime("%y"))
        month = int(datetime.now().strftime("%m"))

        while year < 25:
            asset_name = asset_prefix + str(month2letter[month]) + str(year)
            asset_data = self.get_data(asset_name)

            if asset_data:
                asset_list.append(asset_data)

            year = year + 1 if month == 12 else year
            month = 1 if month == 12 else month + 1

        asset_list = sorted(asset_list, key=lambda asset: asset["volume"], reverse=True)

        # for d in asset_list:
        #     print(d["ativo"], d["volume"])

        print(asset_list[0]["ativo"], asset_list[0]["volume"])

        return asset_list[0]
