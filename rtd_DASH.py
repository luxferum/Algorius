# -*- coding: utf-8 -*-

from dash.dependencies import Input, Output
from dash import dcc
from dash import html
from flask import Flask
import dash
import win32api
import socket
import json
from pandas_datareader import data as web
from datetime import datetime as dt

from rtd_preprocessing import create_clean_dict
from calculo import fairPrice

# ----------------------------------------------------------------

app = Flask(__name__)
# app = dash.Dash('Hello World')

# app.layout = html.Div([
#     dcc.Dropdown(
#         id='my-dropdown',
#         options=[
#             {'label': 'line', 'value': 'line'},
#             {'label': 'bar', 'value': 'bar'}
#             #{'label': 'Apple', 'value': 'AAPL'}
#         ],
#         value='line'
#     ),
#     dcc.Graph(id='my-graph')
# ], style={'width': '500'})

# app.css.append_css(
#     {'external_url': 'https://codepen.io/chriddyp/pen/bWLwgP.css'})

app = dash.Dash(
    __name__,
    assets_external_path='https://codepen.io/chriddyp/pen/bWLwgP.css'
)

app.scripts.config.serve_locally = False

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
    )
])


@app.callback(Output('my-graph', 'figure'), [Input('my-dropdown', 'value')])
def update_graph(selected_dropdown_value):
    df = web.DataReader(
        selected_dropdown_value,
        'yahoo',
        dt(2017, 1, 1),
        dt.now()
    )
    return {
        'data': [{
            'x': df.index,
            'y': df.Close
        }],
        'layout': {'margin': {'l': 40, 'r': 0, 't': 20, 'b': 30}}
    }

# --- ESCOLHER O ATIVO EXEMPLO -----------#
# PETR4  - Petrobras#
# VALE3  - Vale#
# ITUB4  - Itau#
# INDQ19 - Indice Bovespa#
# WINQ19 - Mini Indice Bovespa#


# --- ESCOLHER OS ATIVOS -----------------#
# ========================================#
ATIVO = ['FRP0', 'DOLFUT']
COTACAO = 'COT$S|'
# ========================================#

# --- INFORMACOES DO SERVIDOR ------------#
# ========================================#
HOST = '192.168.0.5'  # ipv4 address
PORT = 8080


# ========================================#
def ByteConvert(dataInfo, ativo):
    return str.encode(dataInfo + ativo + '#')


array_info_dict = []


@app.server.route("/rtd", methods=['GET'])
def start_rtd():
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((HOST, PORT))
            print(f'\nId da thread principal: {win32api.GetCurrentThreadId()}')
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
                # dolFut, frp0 = array_info_dict[0], array_info_dict[1]
                # fair_price = fairPrice(frp0, dolFut)
                # print(f'fair_price = {fair_price}')
                return json.dumps(array_info_dict)

            except Exception as ex:
                print(ex)

    except Exception as ex:
        print(f'\nNão foi possivel conectar no servidor RTD. Erro:\n{ex}\n')


if __name__ == "__main__":
    app.run()
