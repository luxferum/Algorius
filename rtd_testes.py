from rtd_classes import TrydSocket, RTD, Worker

''' This is used to test RTD functionalities'''

# if __name__ == "__main__":
#     # Create and connect to RTD
#     tryd_socket = TrydSocket(port=8080)

#     r1 = RTD(tryd_socket.get_raw_rtd('DOLFUT'))
#     r2 = RTD(tryd_socket.get_raw_rtd('FRP0'))
#     r3 = RTD(tryd_socket.get_raw_rtd('FRCFUT'))

#     teste = RTD.fair_price(tryd_socket)
#     print(teste)

#     # Release connection to server
#     tryd_socket.close_socket()

if __name__ == "__main__":
    w1 = Worker()
    w1.run()
