# -*- coding: utf-8 -*-

from dash.dependencies import Input, Output
from dash import Dash, dcc, html
import win32api
import socket
import json
import sys
import os
from ctypes import *


# from pandas_datareader import data as web
from datetime import datetime as dt

from rtd_preprocessing import create_clean_dict
from calculo import fairPrice

# ------------------------------------------------------------------------------------------------

sys.path.append(os.path.abspath(os.path.join('', 'ProfitDLL/Exemplo Python')))

import profitDLL

profitDLL.dllStart()

# class TAssetID(Structure):
#     _fields_ = [("ticker", c_wchar_p),
#                 ("bolsa", c_wchar_p),
#                 ("feed", c_int)]

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


# # aqui tem exception, mas funciona quando escolhe Apple no dropdown
# @app.callback(Output('my-graph', 'figure'), [Input('my-dropdown', 'value')])
# def update_graph(selected_dropdown_value):
#     df = web.DataReader(
#         selected_dropdown_value,
#         'yahoo',
#         dt(2017, 1, 1),
#         dt.now()
#     )
#     return {
#         'data': [{
#             'x': df.index,
#             'y': df.Close
#         }],
#         'layout': {'margin': {'l': 40, 'r': 0, 't': 20, 'b': 30}}
#     }

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
                    array_dict_assets.append(dict_assets)

                dol_fut, frp0 = array_dict_assets[0], array_dict_assets[1]
                fair_price = fairPrice(dol_fut, frp0)
                return json.dumps(f"{array_dict_assets[0]['ativo']} -> fair price = {fair_price}", f"{array_dict_assets[1]}")

            except Exception as ex:
                print(ex)

    except Exception as ex:
        print(f'\nNão foi possivel conectar no servidor RTD. Erro:\n{ex}\n')

@app.server.route("/dll", methods=['GET'])
def start_dll():
    try:
        result = profitDLL.subscribeTicker()
        return json.dumps(result)
    except Exception as ex:
        print(ex)


if __name__ == "__main__":
    app.run()
