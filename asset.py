from auxiliar import clean_rtd_as_dict


class Asset():
    def __init__(self, rtd_raw):
        '''Create an asset object with rtd cleaned up'''
        rtd_dict = clean_rtd_as_dict(rtd_raw)
        for k, v in rtd_dict.items():
            setattr(self, k, v)

    def __str__(self, MAX_PRINT=100):
        '''Return a string representation of the asset object'''
        count = 0
        print(f'----------------------------')
        for k, v in self.__dict__.items():
            print(f'\t{k} = {v}')
            count += 1
            if count == MAX_PRINT:
                break
        return f'----------------------------'
