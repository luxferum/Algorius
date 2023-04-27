import re
import socket
from datetime import datetime
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

# tryd asset types
COTACAO = "COT$S|"
AUTOMATIZADOR = "AUT$S|"
LIVRO_DE_OFERTAS = "LVL2$S|"
NEGOCIO = "NEG$S|"
NEGOCIO_COMPLETO = "NEGS$S|"
INTERVALO_GRAFICO = "GRF$S|"

PORT = 8080
IP = socket.gethostbyname(socket.gethostname())


def get_data(asset_name, timeout=1):
    """Use socket to get real time data of a given asset"""

    tryd_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tryd_socket.connect((IP, PORT))

    asset_type_name_delimiter = str.encode(COTACAO + asset_name + "#")
    tryd_socket.sendall(asset_type_name_delimiter)

    socket_response, _, _ = select([tryd_socket], [], [], timeout)
    print(f"\t{asset_name} - {socket_response}")
    if socket_response == []:
        return None

    data = tryd_socket.recv(1024).decode()

    regex = f"(?<=COT!){asset_name}(.[^#]*)(?=#)"
    data = re.search(regex, data)

    data = data.group(0)
    data_list = data.split("|")
    data_dict_clean = rtd_clean_dict(data_list)

    return data_dict_clean


def get_asset_data(asset_prefix):
    """Use socket to get real time data given an asset_prefix with current date codes"""
    print(f"{asset_prefix} - Getting asset data... ")

    current_year = int(datetime.now().strftime("%y"))
    current_month = int(datetime.now().strftime("%m"))

    if "FUT" in asset_prefix or "0" in asset_prefix:
        return get_data(asset_prefix)

    # WDO - caso especial: pega o wdo atual e verifica a data de vencimento. Se vence hoje, próximo mês
    if "WDO" in asset_prefix:
        current_month_letter = month2letter[current_month]
        asset_name = f"{asset_prefix}{current_month_letter}{current_year}"
        asset_data = get_data(asset_name)

        if asset_data["dias_uteis_ate_vencimento"] != 0:
            return asset_data

        if asset_data["dias_uteis_ate_vencimento"] == 0:
            current_year = current_year + 1 if current_month == 12 else current_year
            current_month = 1 if current_month == 12 else current_month + 1

            current_month_letter = month2letter[current_month]
            asset_name = f"{asset_prefix}{current_month_letter}{current_year}"

            return get_data(asset_name)

    asset_data_list = []
    while current_year < 25:
        current_month_letter = month2letter[current_month]
        asset_name = f"{asset_prefix}{current_month_letter}{current_year}"

        asset_data = get_data(asset_name)
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
    return asset_data_most_open_contracts
