# -*- coding: utf-8 -*-

from dash import Dash, dcc, html
import win32api
import socket
import json
from ctypes import *


# from pandas_datareader import data as web
from datetime import datetime as dt

from rtd_preprocessing import create_clean_dict
from rtd import Ativo

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
HOST = '192.168.0.10'  # ipv4
PORT = 8080
# ========================================#


def ByteConvert(dataInfo, ativo):
    return str.encode(dataInfo + ativo + '#')


array_dict_assets = []


@app.server.route("/rtd", methods=['GET'])
def start_rtd():
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((HOST, PORT))
            print(f'\nId da thread principal: {win32api.GetCurrentThreadId()}')
            global array_dict_assets
            try:
                for item in ATIVO:
                    s.sendall(ByteConvert(COTACAO, item))
                    # b'COT$S|PETR4#'
                    data = s.recv(1024)
                    asset = data.decode().replace("COT!", "").split("|")
                    dict_assets = create_clean_dict(asset)
                    ativo1 = Ativo(dict_assets)
                    print(ativo1)
                    array_dict_assets.append(dict_assets)

                dol_fut, frp0 = array_dict_assets[0], array_dict_assets[1]
                fair_price = fairPrice(dol_fut, frp0)

                return json.dumps(f"{array_dict_assets[0]['ativo']} -> fair price = {fair_price}", f"{array_dict_assets[1]}")

            except Exception as ex:
                print(ex)

    except Exception as ex:
        print(f'\nNão foi possivel conectar no servidor RTD. Erro:\n{ex}\n')


if __name__ == "__main__":
    app.run()
