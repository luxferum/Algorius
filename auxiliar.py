from unidecode import unidecode
from rtd_keys import rtd_keys
from numpy import NaN


def clean_rtd_keys():
    '''Return a list of rtd keys cleaned up'''
    def clean_key(s):
        s = unidecode(s)
        s = s.strip()
        s = s.lower()
        s = s.replace(' ', '_').replace('-', '_')
        s = s.replace('.', '').replace('(', '').replace(')', '')
        s = s.replace('%', 'porcentagem')
        return s

    return [clean_key(k) for k in rtd_keys]


def clean_rtd_values(values):
    '''Given raw rtd. Return a list of rtd values cleaned up'''
    def clean_value(value):
        def string_to_float(s):
            try:
                s = float(s)
                return s
            except:
                return s

        value = value.replace('.', '').replace(',', '.')
        return string_to_float(value)

    return [clean_value(i) for i in values]


def clean_rtd_as_dict(raw_data):
    '''Given raw rtd. Return a dict of rtd cleaned up'''
    return {k: v for k, v in zip(clean_rtd_keys(), clean_rtd_values(raw_data))}


def byte_convert(data_info, ativo):
    '''Convert bytes to a string'''
    # data_info example = b'COT$S|PETR4#'
    return str.encode(data_info + ativo + '#')


def print_highlighter(s):
    '''Print text highlighted with dashes'''

    def highlight():
        print('--------------------------------')
        print(f'{s}')
        print('--------------------------------')

    return highlight()
