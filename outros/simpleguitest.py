import PySimpleGUI as sg
import numpy as np

class guiMkt():    
    def __init__(self):
        self.window = None
         

    def update(self, arr):
        text_elem = self.window['-text-']
        arrT = [0,1,24,7,8,9,12,18,22,21,78,79,80,81,82,83,84,85,86,87]
        for n in arrT:
            text_elem.update(arr[0][n])
                

    def useGui(self):
        # Define the window's contents i.e. layout
        layout = [[sg.Text('Papel:'), sg.Text(key='-text-')], #0
                    [sg.Text('Última:'), sg.Text(key='-text-')],#1
                    [sg.Text('Variação %:'), sg.Text(key='-text-')],#24
                    [sg.Text('Abertura:'), sg.Text(key='-text-')],#7
                    [sg.Text('Máxima:'), sg.Text(key='-text-')],#8
                    [sg.Text('Mínima:'), sg.Text(key='-text-')],#9
                    [sg.Text('Horário:'), sg.Text(key='-text-')],#12
                    [sg.Text('Estado:'), sg.Text(key='-text-')],#18
                    [sg.Text('Dias úteis até o vencimento:'), sg.Text(key='-text-')],#22
                    [sg.Text('Dias até o vencimento:'), sg.Text(key='-text-')],#21
                    [sg.Text('PTAX P1:'), sg.Text(key='-text-')],#78
                    [sg.Text('PTAX P2:'), sg.Text(key='-text-')],#79
                    [sg.Text('PTAX P3:'), sg.Text(key='-text-')],#80
                    [sg.Text('PTAX P4:'), sg.Text(key='-text-')],#81
                    [sg.Text('PTAX Oficial:'), sg.Text(key='-text-')],#82
                    [sg.Text('PTAX Fut. P1:'), sg.Text(key='-text-')],#83
                    [sg.Text('PTAX Fut. P2:'), sg.Text(key='-text-')],#84
                    [sg.Text('PTAX Fut. P3:'), sg.Text(key='-text-')],#85
                    [sg.Text('PTAX Fut. P4:'), sg.Text(key='-text-')],#86
                    [sg.Text('PTAX Fut. Oficial:'), sg.Text(key='-text-')], #87
                    [sg.Button('Teste', key='-FUNCTION-')]]
        # Create the window
        self.window = sg.Window('Generate random integer', layout)
         # Event loop
        while True:
            event = self.window.read()
            if event in (sg.WIN_CLOSED, 'Exit'):
                break

        # Close the window i.e. release resource
        self.window.close()


# arrInfo[0][0]
# arrInfo[0][1]
# arrInfo[0][24]
# arrInfo[0][7]
# arrInfo[0][8]
# arrInfo[0][9]
# arrInfo[0][12]
# arrInfo[0][18]
# arrInfo[0][78]
# arrInfo[0][79]
# arrInfo[0][80]
# arrInfo[0][81]
# arrInfo[0][82]
# arrInfo[0][83]
# arrInfo[0][84]
# arrInfo[0][85]
# arrInfo[0][86]
# arrInfo[0][87]