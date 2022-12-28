# -*- coding: utf-8 -*-

from dash import Dash, dcc, html
import win32api
import socket
import json

from rtd_preprocessing import clean_rtd_as_dict
from rtd_RTD import RTD

# ------------------------------------------------------------------------------------------------

app = Dash(
    __name__,
    assets_external_path='https://codepen.io/chriddyp/pen/bWLwgP.css'
)

app.layout = html.Div([
    html.Div(
        className="app-header",
        children=[
            html.Div('Plotly Dash', className="app-header--title")
        ]
    ),
    html.Div(
        children=html.Div([
            html.H5('Overview'),
            html.Div('''
                This is an example of a simple Dash app with
                local, customized CSS.
            ''')
        ])
    ),
    dcc.Dropdown(
        id='my-dropdown',
        options=[
            {'label': 'line', 'value': 'line'},
            {'label': 'bar', 'value': 'bar'},
            {'label': 'Apple', 'value': 'AAPL'}
        ],
        value='line'
    ),
    dcc.Graph(id='my-graph')
], style={'width': '500'})


# ------------------------------------------------------------------------------------------------

# --- ESCOLHER OS ATIVOS -----------------#
ATIVO = ['FRP0', 'DOLFUT']
COTACAO = 'COT$S|'
# ========================================#

# --- INFORMACOES DO SERVIDOR ------------#
HOST = '192.168.0.5'  # ipv4
PORT = 8080
# ========================================#

'''
AUTOMATIZADOR = 'AUT$S|'
LIVRO_DE_OFERTAS = 'LVL2$S|'
NEGOCIO = 'NEG$S|'
NEGOCIO_COMPLETO = 'NEGS$S|'
INTERVALO_GRAFICO = 'GRF$S|'
'''


def ByteConvert(dataInfo, ativo):
    # dataInfo example >> b'COT$S|PETR4#'
    return str.encode(dataInfo + ativo + '#')


@app.server.route("/rtd", methods=['GET'])
def start_rtd():
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((HOST, PORT))
            print(f'\nId da thread principal: {win32api.GetCurrentThreadId()}')
            try:
                for item in ATIVO:
                    # data in string
                    s.sendall(ByteConvert(COTACAO, item))
                    data = s.recv(1024).decode().replace("COT!", "").split("|")
                    # data in dictionary
                    data_dict = clean_rtd_as_dict(data)
                    # data in RTD object
                    data_rtd = RTD(data_dict)
                    # print RTD object
                    print(data_rtd)

                str_to_json = json.dumps(data_rtd)
                return str_to_json

            except Exception as ex:
                print(ex)

    except Exception as ex:
        print(f'\nNão foi possivel conectar no servidor RTD. Erro:\n{ex}\n')


if __name__ == "__main__":
    app.run()
