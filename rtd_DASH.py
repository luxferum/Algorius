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

# import profitDLL

# profitDLL.dllStart()

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

#FUNÇÃO DO RTD ENVIADA PARA O MAINWINDOW.PY#

if __name__ == "__main__":
    app.run()
