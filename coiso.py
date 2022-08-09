import socket
import win32api
import json
from flask import Flask
from calculos import calc

# ---ESCOLHER O ATIVO EXEMPLO:-----------#
# PETR4  - Petrobras#
# VALE3  - Vale#
# ITUB4  - Itau#
# INDQ19 - Indice Bovespa#
# WINQ19 - Mini Indice Bovespa#
# ========================================#
# ATIVO = ['PETR4', 'VALE3', 'ITUB4', 'BBAS3', 'CIEL3']
ATIVO = ['FRP0', 'DOLFUT']
COTACAO = 'COT$S|'
# ========================================#

# ---INFORMACOES DO SERVIDOR--------------#
# ========================================#
# EU FIZ
# HOST = '192.168.15.1'
# PORT = 8080
HOST = '192.168.15.102'
PORT = 8080


# ========================================#
def ByteConvert(dataInfo, ativo):
    return str.encode(dataInfo + ativo + '#')


app = Flask(__name__)


@app.route("/", methods=["GET"])
def start_rtd():
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((HOST, PORT))
            print("Id da thread principal %d" %
                  (win32api.GetCurrentThreadId()))
            arrInfo = []
            arrFinal = []
            try:
                for item in ATIVO:
                    s.sendall(ByteConvert(COTACAO, item))
                    # b'COT$S|PETR4#'
                    data = s.recv(1024)
                    # Acumulando os ativos
                    arrInfo.append(data.decode().replace(
                        "COT!", "").split("|"))
                arrFinal = calc.fairPrice(arrInfo)
                return json.dumps(arrFinal)

            except Exception as ex:
                print(ex)

    except Exception as ex:
        print('Não foi possivel conectar no servidor RTD. Erro: ', ex)


if __name__ == "__main__":
    app.run()
