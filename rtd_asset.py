from auxiliar import print_highlighter

'''Asset class used to store several rtd informations in different instant of time'''


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
