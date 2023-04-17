import re
import socket
from datetime import datetime
from select import select

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

    def get_raw_rtd(self, asset_prefix, timeout=1):
        """Use socket to get real time data given an asset_prefix with current date codes"""
        print(f"{asset_prefix}: ", end="")

        # get current year and month
        year = int(datetime.now().strftime("%y"))
        month = int(datetime.now().strftime("%m"))

        # WDO -> SE PEGAR O ATUAL, MAS VENCE HOJE PEGA O PROXIMO OU SEJA, USA MONTH + 1

        if not ("FUT" in asset_prefix or "0" in asset_prefix):
            while True:
                # asset_name with letter and year
                asset_name = asset_prefix + str(month2letter[month]) + str(year)

                # send information to server to get the data from chosen asset delimited by #
                self.s.sendall(str.encode(TrydSocket.COTACAO + asset_name + "#"))

                # use select to get the response using a timeout if not available
                result, _, _ = select([self.s], [], [], timeout)

                # if the response is not available we go to the next month/yea and try again
                if result == []:
                    print(f"{asset_name} ERROR ", end="- ")

                    year = year + 1 if month == 12 else year
                    month = 1 if month == 12 else month + 1

                else:
                    print(f"{asset_name} OK")

                    # get the data as a string
                    buffer = self.s.recv(1024).decode()
                    break

        else:
            asset_name = asset_prefix
            print(f"OK")

            # send information to server to get the data from chosen asset delimited by #
            self.s.sendall(str.encode(TrydSocket.COTACAO + asset_name + "#"))

            # get the data as a string
            buffer = self.s.recv(1024).decode()

        # filter the real time data by: chosen asset and delimiter
        data = re.search(f"(?<=COT!){asset_name}(.[^#]*)(?=#)", buffer)

        # return the real time data filtered as a string
        return self.get_raw_rtd(asset_name) if data is None else data.group(0)
