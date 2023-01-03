from rtd_classes import RTD


if __name__ == "__main__":
    asset_dict = {}
    rtd = RTD()

    asset_dict['DOLFUT'] = rtd.get_asset_rtd('DOLFUT')
    asset_dict['FRP0'] = rtd.get_asset_rtd('FRP0')

    rtd.close_socket()
