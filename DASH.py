from dash.dependencies import Input, Output
from dash import dcc
from dash import html
import dash
import socket
import win32api
import json
import pandas as pd

from pandas_datareader import data as web
from datetime import datetime as dt
import plotly.express as px

import daniel
from calculos import calc


def ByteConvert(dataInfo, ativo):
    return str.encode(dataInfo + ativo + '#')


HOST = '192.168.15.102'
PORT = 8080
# ATIVO = ['FRP0', 'DOLFUT']
ATIVO = ['FRP0']
COTACAO = 'COT$S|'

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

output = pd.DataFrame()


@app.server.route("/rtd", methods=['GET'])
def rtd():
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((HOST, PORT))
            print("\n\t\tId da thread principal %d\n" %
                  (win32api.GetCurrentThreadId()))
            arrInfo = []
            arrFinal = []
            try:
                for item in ATIVO:
                    s.sendall(ByteConvert(COTACAO, item))
                    # b'COT$S|PETR4#'
                    data = s.recv(1024)
                    # ativo
                    info = data.decode().replace("COT!", "").split("|")
                    # dict do ativo
                    info_dict = daniel.create_dict(info)
                    # insere dicionario no dataframe
                    global output
                    output = output.append(info_dict, ignore_index=True)

                # # muda string para float
                # output = output.applymap(daniel.clean_change_type)
                # hora
                # output = output.set_index('hora')
                print(output)
                # json
                result = output.to_json()
                # parsed = json.loads(result)
                return json.dumps(result)

            except Exception as ex:
                print(ex)

    except Exception as ex:
        print('Não foi possivel conectar no servidor RTD. Erro: ', ex)


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


if __name__ == '__main__':
    app.run_server()
