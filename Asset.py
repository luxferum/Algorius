class Asset:
    def __init__(self, info_dict):
        self.nome = info_dict['ativo']
        self.dict = info_dict

    def __str__(self):
        return f'Ativo: {self.asset}\n Info = {self.dict}'
