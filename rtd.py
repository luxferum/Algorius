import socket
import win32api
import json
from flask import Flask

from rtd_preprocessing import create_clean_dict
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

array_info_dict = []


@app.route("/", methods=["GET"])
def start_rtd():
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((HOST, PORT))
            print("Id da thread principal %d" %
                  (win32api.GetCurrentThreadId()))
            global array_info_dict
            try:
                for item in ATIVO:
                    s.sendall(ByteConvert(COTACAO, item))
                    # b'COT$S|PETR4#'
                    data = s.recv(1024)
                    info = data.decode().replace("COT!", "").split("|")
                    info_dict = create_clean_dict(info)
                    array_info_dict.append(info_dict)

                # teste do fairprice usando os objetos
                dolFut, frp0 = array_info_dict[0], array_info_dict[1]
                fair_price = calculo.fairPrice(frp0, dolFut)
                print(f'fair_price = {fair_price}')
                # retornar json
                return json.dumps(array_info_dict)

            except Exception as ex:
                print(ex)

    except Exception as ex:
        print('Não foi possivel conectar no servidor RTD. Erro: ', ex)


if __name__ == "__main__":
    app.run()
