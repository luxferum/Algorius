'''RTD class usedto store rtd information in a instant of time'''


class RTD():
    '''
    Real Time Data class -> RTD with values cleaned up

    Attributes
    ----------
    Described in 'rtd_keys.py' file

    Methods
    -------
    __str__(self):
        Prints all RTD attributes names and values
    '''

    def __init__(self, rtd_dict):
        for k, v in rtd_dict.items():
            setattr(self, k, v)

    def __str__(self):
        for k, v in self.__dict__.items():
            print(f'\t{k} = {v}')
        return f'----------------------------'
