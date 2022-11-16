import socket
import win32api
import json
from flask import Flask


from rtd_preprocessing import create_clean_dict
from Asset import Asset
import calculo


# --- ESCOLHER OS ATIVOS -----------------#
# ========================================#
ATIVO = ['FRP0', 'DOLFUT']
COTACAO = 'COT$S|'
# ========================================#

# --- INFORMACOES DO SERVIDOR-------------#
# ========================================#
HOST = '192.168.0.15'  # ipv4 address
PORT = 8080


# ========================================#
def ByteConvert(dataInfo, ativo):
    return str.encode(dataInfo + ativo + '#')


app = Flask(__name__)

arrInfo = []
arrAsset = []


@app.route("/", methods=["GET"])
def start_rtd():
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((HOST, PORT))
            print("Id da thread principal %d" %
                  (win32api.GetCurrentThreadId()))
            global arrInfo
            global arrAsset
            try:
                for item in ATIVO:
                    s.sendall(ByteConvert(COTACAO, item))
                    data = s.recv(1024)  # b'COT$S|PETR4#'
                    info = data.decode().replace("COT!", "").split("|")  # data to info
                    info_dict = create_clean_dict(info)  # info to dict
                    asset = Asset(info_dict)  # dict to object
                    info_simple = (
                        asset.nome, asset.dict['ultima'], asset.dict['dias_uteis_ate_vencimento'])  # simple info

                    arrInfo.append(info_simple)
                    arrAsset.append(asset)
                # teste do fairprice usando os objetos
                dolFut, frp0 = arrAsset[0], arrAsset[1]
                fair_price = calculo.fairPrice(frp0, dolFut)
                print(f'fair_price = {fair_price}')
                # retornar json
                return json.dumps(arrInfo)

            except Exception as ex:
                print(ex)

    except Exception as ex:
        print('Não foi possivel conectar no servidor RTD. Erro: ', ex)


if __name__ == "__main__":
    app.run()
