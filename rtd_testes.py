from rtd_classes import TrydSocket, RTD, Worker

''' This is used to test RTD functionalities'''

if __name__ == "__main__":
    tryd = TrydSocket()
    tryd.connect_socket(port=8080)

    r1 = RTD(tryd.get_raw_rtd('DOLFUT'))
    r1.add_to_rtd_dict()
    r2 = RTD(tryd.get_raw_rtd('FRP0'))
    r2.add_to_rtd_dict()
    r3 = RTD(tryd.get_raw_rtd('FRCFUT'))
    r3.add_to_rtd_dict()

    for k, v in RTD.rtd_dict.items():
        print(k)
        print(v)

    # df = RTD.return_rtd_df()
    # print(df.info())

    tryd.close_socket()

# if __name__ == "__main__":
#     w1 = Worker()
#     w1.run('FRP0', 1)
