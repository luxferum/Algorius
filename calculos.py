import pandas as pd
import numpy as npy
import scipy as scp
import math


def dolar_to_real(s):
    return s.replace('.', '').replace(',', '.')


def string_to_float(s):
    try:
        s = float(s)
        return s
    except:
        return s


def remove_dot_insert_point_convert_string_to_float(XX):
    for i in range(len(XX)):
        for j in range(len(XX[i])):
            x = XX[i][j]
            x = x.replace('.', '').replace(',', '.')
            x = string_to_float(x)
            XX[i][j] = x
    return XX



class calc:

    def fairPrice(arrDados):
        arrDados = remove_dot_insert_point_convert_string_to_float(
            arrDados)
        euler = math.e
        jurosEua = 1.0126
        jurosEuaLog = npy.log(jurosEua)

        jurosBr = 1.1315
        jurosBrLog = npy.log(jurosBr)

        baseLog = jurosBrLog - jurosEuaLog

        diasAteVencimento = arrDados[1][21]/360  # pegar do rtd
        baseDiasLog = diasAteVencimento*baseLog

        dolarFuturoUltimo = arrDados[1][1]
        # pegar do rtd --- dolarcomercial = dolarfuturo - frp0
        dolarComercialUltimo = dolarFuturoUltimo - arrDados[0][1]
        dolarJustoUltimo = (dolarComercialUltimo * euler) ** baseDiasLog
        arrDados[1] += [dolarFuturoUltimo,
                        dolarComercialUltimo, dolarJustoUltimo]
        return arrDados

    def stdDeviationOnScale(arrDados):
        euler = math.e
        jurosEua = 1.0126
        jurosEuaLog = npy.log(jurosEua)

        jurosBr = 1.1315
        jurosBrLog = npy.log(jurosBr)

        baseLog = jurosBrLog - jurosEuaLog

        diasAteVencimento = arrDados[0][21]/360  # pegar do rtd
        baseDiasLog = diasAteVencimento*baseLog

        dolarComercial = 5415.20  # pegar do rtd --- dolarcomercial = dolarfuturo - frp0
        dolarFuturo = 5555  # pegar do rtd
        dolarJusto = (dolarComercial * euler) ^ baseDiasLog

    def stdDeviationOffScale(self, arrDados):
        euler = math.e
        jurosEua = 1.0126
        jurosEuaLog = npy.log(jurosEua)

        jurosBr = 1.1315
        jurosBrLog = npy.log(jurosBr)

        baseLog = jurosBrLog - jurosEuaLog

        diasAteVencimento = arrDados[0][21]/360  # pegar do rtd
        baseDiasLog = diasAteVencimento*baseLog

        dolarComercial = 5415.20  # pegar do rtd --- dolarcomercial = dolarfuturo - frp0
        dolarFuturo = 5555  # pegar do rtd
        dolarJusto = (dolarComercial * euler) ^ baseDiasLog

    def avgSpeed(self, arrDados):
        euler = math.e
        jurosEua = 1.0126
        jurosEuaLog = npy.log(jurosEua)

        jurosBr = 1.1315
        jurosBrLog = npy.log(jurosBr)

        baseLog = jurosBrLog - jurosEuaLog

        diasAteVencimento = arrDados[0][21]/360  # pegar do rtd
        baseDiasLog = diasAteVencimento*baseLog

        dolarComercial = 5415.20  # pegar do rtd --- dolarcomercial = dolarfuturo - frp0
        dolarFuturo = 5555  # pegar do rtd
        dolarJusto = (dolarComercial * euler) ^ baseDiasLog

    def simpleHarmonicOscilator(self, arrDados):
        euler = math.e
        jurosEua = 1.0126
        jurosEuaLog = npy.log(jurosEua)

        jurosBr = 1.1315
        jurosBrLog = npy.log(jurosBr)

        baseLog = jurosBrLog - jurosEuaLog

        diasAteVencimento = arrDados[0][21]/360  # pegar do rtd
        baseDiasLog = diasAteVencimento*baseLog

        dolarComercial = 5415.20  # pegar do rtd --- dolarcomercial = dolarfuturo - frp0
        dolarFuturo = 5555  # pegar do rtd
        dolarJusto = (dolarComercial * euler) ^ baseDiasLog

    def vwapZScore(self, arrDados):
        euler = math.e
        jurosEua = 1.0126
        jurosEuaLog = npy.log(jurosEua)

        jurosBr = 1.1315
        jurosBrLog = npy.log(jurosBr)

        baseLog = jurosBrLog - jurosEuaLog

        diasAteVencimento = arrDados[0][21]/360  # pegar do rtd
        baseDiasLog = diasAteVencimento*baseLog

        dolarComercial = 5415.20  # pegar do rtd --- dolarcomercial = dolarfuturo - frp0
        dolarFuturo = 5555  # pegar do rtd
        dolarJusto = (dolarComercial * euler) ^ baseDiasLog
