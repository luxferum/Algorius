from dash import Dash, dcc, html

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
# FUNÇÃO DO RTD ENVIADA PARA O MAINWINDOW.PY

if __name__ == "__main__":
    app.run()
