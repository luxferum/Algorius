from rtd_auxiliar import print_highlighter, clean_rtd_as_dict, clean_rtd_keys, clean_rtd_values
import pandas as pd


class Asset():
    '''
    Asset class -> Asset with several RTD with values cleaned up

    Attributes
    ----------
    Described in 'rtd_keys.py' file

    Methods
    -------
    __str__(self):
        Prints all RTD attributes names and values
    '''

    def __init__(self, rtd):
        self.ativo = rtd[0]
        self.rtd = [clean_rtd_values(rtd)]

    def __str__(self):
        print(f'{self.ativo}')
        for i in self.rtd:
            print(f'{i} - {len(i)}')
        return '--------------------------------'

    def insert_rtd(self, rtd):
        self.rtd.append(clean_rtd_values(rtd))

    def get_rtd_as_dataframe(self):
        df = pd.DataFrame(self.rtd, columns=clean_rtd_keys())
        print(df)
        return df



