import socket
from rtd import RTD
from asset import Asset

# ==== INFORMACOES DO SERVIDOR ============ #
IPV4 = socket.gethostbyname(socket.gethostname())
PORT = 8080
# ========================================= #

asset_dict = {}


def faz_asset(asset_name):
    raw = rtd.get_raw_rtd(asset_name)
    asset_obj = Asset(raw)
    asset_dict[asset_obj.ativo] = asset_obj

    print(f'{asset_name}: {asset_dict[asset_name].ultima}')


if __name__ == "__main__":
    rtd = RTD(IPV4, PORT)

    faz_asset('DOLFUT')
    faz_asset('FRP0')

    rtd.close_socket()
