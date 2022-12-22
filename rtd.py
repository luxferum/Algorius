def print_highlighter(s):
    '''Print text highlighted with dashes'''

    def highlight():
        print('--------------------------------')
        print(f'{s}')
        print('--------------------------------')

    return highlight()


class Asset():
    '''Asset class -> Asset with several RTD objects'''

    def __init__(self, asset):
        self.asset = asset
        self.rtd_list = []

    def insert_rtd(self, rtd):
        if self.asset == rtd.ativo:
            self.rtd_list.append(rtd)
        else:
            print(f"Cannot insert rtd: '{rtd.ativo}' in asset: '{self.asset}'")

    def __str__(self):
        print_highlighter(self.asset)
        for r in self.rtd_list:
            print(f'\t{r}')
        return f'--------------------------------\n'


class RTD():
    '''Real Time Data class -> RTD with values cleaned up'''

    def __init__(self, rtd_dict):
        for k, v in rtd_dict.items():
            setattr(self, k, v)

    def __str__(self):
        for k, v in self.__dict__.items():
            print(f'\t{k} = {v}')
        return f'----------------------------'


'''
a1 = Asset('ATIVO')
print(a1)

r1 = RTD({'ativo': 'ATIVO', 'preco': 10, 'nada': 'LALA'})
print(r1)

a1.insert_rtd(RTD({'ativo': 'ATIVO', 'preco': 10, 'nada': 'LALA'}))
a1.insert_rtd(RTD({'ativo': 'ATIVO', 'preco': 15, 'nada': '222'}))
a1.insert_rtd(RTD({'ativo': 'ATIVO', 'preco': 14, 'nada': 'LA22LA'}))
print(a1)
'''
