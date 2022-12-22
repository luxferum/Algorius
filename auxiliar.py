from rtd_RTD import RTD
from rtd_asset import Asset


def print_highlighter(s):
    '''Print text highlighted with dashes'''

    def highlight():
        print('--------------------------------')
        print(f'{s}')
        print('--------------------------------')

    return highlight()


a1 = Asset('ATIVO')
print(a1)

r1 = RTD({'ativo': 'ATIVO', 'preco': 10, 'nada': 'LALA'})
print(r1)

a1.insert_rtd(RTD({'ativo': 'ATIVO', 'preco': 10, 'nada': 'LALA'}))
a1.insert_rtd(RTD({'ativo': 'ATIVO', 'preco': 15, 'nada': '222'}))
a1.insert_rtd(RTD({'ativo': 'ATIVO', 'preco': 14, 'nada': 'LA22LA'}))
print(a1)
