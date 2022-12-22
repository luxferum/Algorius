object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 735
  ClientWidth = 1699
  Color = clBtnFace
  Constraints.MinHeight = 774
  Constraints.MinWidth = 1281
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    1699
    735)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGlobal: TPanel
    Left = 0
    Top = 0
    Width = 1699
    Height = 735
    Anchors = [akLeft, akTop, akRight, akBottom]
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1699
      735)
    object gbMarketData: TGroupBox
      AlignWithMargins = True
      Left = 799
      Top = 0
      Width = 893
      Height = 724
      Anchors = [akTop, akRight]
      Caption = 'MarketData'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        893
        724)
      object gbOfferBook: TGroupBox
        AlignWithMargins = True
        Left = 668
        Top = 288
        Width = 212
        Height = 266
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'OfferBook'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          212
          266)
        object Label3: TLabel
          AlignWithMargins = True
          Left = 59
          Top = 18
          Width = 101
          Height = 13
          Caption = 'Exemplo para 1 ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          AlignWithMargins = True
          Left = 8
          Top = 109
          Width = 62
          Height = 13
          Caption = 'Mostrar linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnUnsubBook: TButton
          AlignWithMargins = True
          Left = 107
          Top = 63
          Width = 100
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'unsub Book'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnUnsubMiniBookClick
        end
        object ListBox1: TListBox
          AlignWithMargins = True
          Left = 5
          Top = 63
          Width = 96
          Height = 36
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 3
        end
        object btnSubBook: TButton
          AlignWithMargins = True
          Left = 107
          Top = 36
          Width = 100
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '   sub Book'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnSubMiniBookClick
        end
        object Edit2: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 36
          Width = 65
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object memoOfferBook: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 132
          Width = 202
          Height = 129
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtMonitor: TEdit
          AlignWithMargins = True
          Left = 73
          Top = 105
          Width = 28
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 5
          Text = '15'
        end
        object Button11: TButton
          AlignWithMargins = True
          Left = 107
          Top = 105
          Width = 81
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Atualizar linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = Button11Click
        end
        object Edit6: TComboBox
          AlignWithMargins = True
          Left = 71
          Top = 36
          Width = 30
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'B'
          Items.Strings = (
            'B'
            'F')
        end
      end
      object gbPriceBook: TGroupBox
        AlignWithMargins = True
        Left = 668
        Top = 21
        Width = 213
        Height = 266
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'PriceBook'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          213
          266)
        object lblTicker: TLabel
          AlignWithMargins = True
          Left = 59
          Top = 18
          Width = 101
          Height = 13
          Caption = 'Exemplo para 1 ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          AlignWithMargins = True
          Left = 8
          Top = 109
          Width = 62
          Height = 13
          Caption = 'Mostrar linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ListBox2: TListBox
          AlignWithMargins = True
          Left = 5
          Top = 63
          Width = 97
          Height = 36
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 3
        end
        object btnUnsubMiniBook: TButton
          AlignWithMargins = True
          Left = 108
          Top = 63
          Width = 100
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'unsub MiniBook'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnUnsubMiniBookClick
        end
        object Edit3: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 36
          Width = 65
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object btnSubMiniBook: TButton
          AlignWithMargins = True
          Left = 108
          Top = 36
          Width = 100
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '   sub MiniBook'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnSubMiniBookClick
        end
        object memoPriceBook: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 132
          Width = 203
          Height = 129
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edtMonitorPrice: TEdit
          AlignWithMargins = True
          Left = 73
          Top = 105
          Width = 28
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 5
          Text = '15'
        end
        object Button12: TButton
          AlignWithMargins = True
          Left = 108
          Top = 105
          Width = 81
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Atualizar linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = Button12Click
        end
        object Edit8: TComboBox
          AlignWithMargins = True
          Left = 71
          Top = 36
          Width = 30
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'B'
          Items.Strings = (
            'B'
            'F')
        end
      end
      object gbTradeDayle: TGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 21
        Width = 431
        Height = 297
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Trade e Daily'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          431
          297)
        object lblTickerTrade: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 27
          Width = 36
          Height = 13
          AutoSize = False
          Caption = 'TICKER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 246
          Width = 64
          Height = 13
          Anchors = [akBottom]
          Caption = 'TinyBook Buy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitTop = 139
        end
        object Label6: TLabel
          Left = 225
          Top = 246
          Width = 62
          Height = 13
          Anchors = [akBottom]
          Caption = 'TinyBook Sell'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 226
          ExplicitTop = 139
        end
        object edtTicker: TEdit
          AlignWithMargins = True
          Left = 47
          Top = 24
          Width = 65
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object ListBoxSubscribed: TListBox
          AlignWithMargins = True
          Left = 260
          Top = 24
          Width = 112
          Height = 56
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 3
        end
        object btnUnsubTrade: TButton
          AlignWithMargins = True
          Left = 154
          Top = 55
          Width = 100
          Height = 25
          Caption = 'unsubscribe Trade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnUnsubMiniBookClick
        end
        object btnSubTrade: TButton
          AlignWithMargins = True
          Left = 154
          Top = 24
          Width = 100
          Height = 25
          Caption = '    subscribe Trade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnSubMiniBookClick
        end
        object MemoTrades: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 86
          Width = 421
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object cbbBolsa2: TComboBox
          AlignWithMargins = True
          Left = 118
          Top = 24
          Width = 30
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'B'
          Items.Strings = (
            'B'
            'F')
        end
        object memoTinnyBuy: TMemo
          Left = 5
          Top = 263
          Width = 160
          Height = 25
          Anchors = [akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object memoTinnySell: TMemo
          Left = 222
          Top = 263
          Width = 160
          Height = 25
          Anchors = [akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object MemoDaily: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 113
          Width = 421
          Height = 65
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object MemoAssetState: TMemo
          Left = 5
          Top = 215
          Width = 421
          Height = 25
          Anchors = [akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object MemoChangeCotation: TMemo
          Left = 5
          Top = 184
          Width = 421
          Height = 25
          Anchors = [akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
      end
      object gbTradeHistory: TGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 324
        Width = 434
        Height = 109
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Hist'#243'rico de Trades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        DesignSize = (
          434
          109)
        object lblProgress: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 47
          Width = 412
          Height = 30
          Anchors = [akLeft, akTop, akBottom]
          AutoSize = False
          Caption = 'Progress: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 13
        end
        object lblTickerHist: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 27
          Width = 36
          Height = 13
          AutoSize = False
          Caption = 'TICKER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dateHistoryStart: TDateTimePicker
          AlignWithMargins = True
          Left = 156
          Top = 24
          Width = 78
          Height = 21
          Anchors = [akTop, akRight]
          Date = 43318.000000000000000000
          Time = 0.613715486113505900
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dateHistoryEnd: TDateTimePicker
          AlignWithMargins = True
          Left = 240
          Top = 24
          Width = 78
          Height = 21
          Anchors = [akTop, akRight]
          Date = 43318.000000000000000000
          Time = 43318.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkTime
          ParentFont = False
          TabOrder = 3
        end
        object btnGetTradesHistory: TButton
          AlignWithMargins = True
          Left = 324
          Top = 24
          Width = 105
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Pedir Hist'#243'rico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnGetTradesHistoryClick
        end
        object MemoCalback: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 64
          Width = 424
          Height = 40
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object Edit4: TEdit
          AlignWithMargins = True
          Left = 47
          Top = 24
          Width = 65
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cbbBolsa1: TComboBox
          AlignWithMargins = True
          Left = 118
          Top = 24
          Width = 30
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'B'
          Items.Strings = (
            'B'
            'F')
        end
      end
      object gbAdjustHistory: TGroupBox
        AlignWithMargins = True
        Left = 447
        Top = 21
        Width = 215
        Height = 700
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Hist'#243'rico de Ajustes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        DesignSize = (
          215
          700)
        object MemoAdjustHistory: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 46
          Width = 205
          Height = 649
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object btnClearAdjustHistory: TButton
          AlignWithMargins = True
          Left = 107
          Top = 19
          Width = 105
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Limpar Hist'#243'rico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnClearAdjustHistoryClick
        end
      end
      object gbAssetInfo: TGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 434
        Width = 434
        Height = 276
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Informa'#231#227'o de Ativos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        DesignSize = (
          434
          276)
        object Label1: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 27
          Width = 36
          Height = 13
          AutoSize = False
          Caption = 'TICKER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnAssetInfo: TButton
          AlignWithMargins = True
          Left = 152
          Top = 24
          Width = 105
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Pedir Informa'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnAssetInfoClick
        end
        object MemoAssetInfo: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 51
          Width = 424
          Height = 220
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbBolsaAssetInfo: TComboBox
          AlignWithMargins = True
          Left = 116
          Top = 24
          Width = 30
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'B'
          Items.Strings = (
            'B'
            'F')
        end
        object edtTickerAssetInfo: TEdit
          AlignWithMargins = True
          Left = 45
          Top = 24
          Width = 65
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
    object gbRoteamento: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 98
      Width = 788
      Height = 626
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Roteamento'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        788
        626)
      object gbOrders: TGroupBox
        AlignWithMargins = True
        Left = 265
        Top = 21
        Width = 511
        Height = 385
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Lista de ordens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          511
          385)
        object lblOrderID: TLabel
          AlignWithMargins = True
          Left = 264
          Top = 24
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'clOrderID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 262
        end
        object btnGetOrder: TButton
          AlignWithMargins = True
          Left = 433
          Top = 21
          Width = 75
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Get Order'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnGetOrderClick
        end
        object btnLoadOrder: TButton
          AlignWithMargins = True
          Left = 174
          Top = 21
          Width = 80
          Height = 21
          Caption = 'Ordens Do Dia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnLoadOrderClick
        end
        object dateEnd: TDateTimePicker
          AlignWithMargins = True
          Left = 90
          Top = 21
          Width = 78
          Height = 21
          Date = 43095.000000000000000000
          Time = 0.613715486113505900
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dateStart: TDateTimePicker
          AlignWithMargins = True
          Left = 6
          Top = 21
          Width = 78
          Height = 21
          Date = 43095.000000000000000000
          Time = 0.613715486113505900
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtGetOrder: TEdit
          AlignWithMargins = True
          Left = 316
          Top = 21
          Width = 111
          Height = 21
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object GridOrder: TGridView
          AlignWithMargins = True
          Left = 5
          Top = 48
          Width = 501
          Height = 332
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsSingle
          Caption = ''
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridStyle = gsReport
          GridLinesStyle = lsNormal
          HeaderSize = 18
          HeaderStyle = hsAuto
          HideScrollBar = True
          InputSize = 16
          Options = [goHeader, goHighlightTextSelection]
          RowSize = 16
          ParentColor = False
          ParentFont = False
          SelectionMoveDirection = mdDown
          SlideSize = 80
          TabOrder = 5
          TabStop = True
          WantReturns = False
          OnCellClick = GridOrderCellClick
          PreventFocus = False
          object TTextualColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 60
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'conta'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 0
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = True
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 60
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 59
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'titular'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 1
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 59
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 70
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'corretoraId'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 2
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 70
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 65
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'price'
            Header.DisplayMode = dmTextOnly
            Options = [coPublicUsing]
            Position = 3
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 65
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'Status'
            Header.DisplayMode = dmTextOnly
            Options = [coPublicUsing]
            Position = 4
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TNumericColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DefaultValue = '0'
            DrawingOptions = doNormal
            DefaultWidth = 60
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'Qtd'
            Header.DisplayMode = dmTextOnly
            Options = [coPublicUsing]
            Position = 5
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stNumeric
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 60
            WrapKind = wkEllipsis
            Max = 0
            Min = 0
          end
          object TTextualColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 65
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'avgPrice'
            Header.DisplayMode = dmTextOnly
            Options = [coPublicUsing]
            Position = 6
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 65
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'clOrdID'
            Header.DisplayMode = dmTextOnly
            Options = [coPublicUsing]
            Position = 7
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 100
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object Date: TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'ProfitID'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 8
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'Date'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 9
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'Side'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 10
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = 3000
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 11
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'Traded'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 12
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = 3000
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'Leaves'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 13
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
        end
      end
      object gbOrderControl: TGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 21
        Width = 249
        Height = 348
        Caption = 'Controle de ordens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Padding.Top = 50
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          249
          348)
        object lblAccount: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 27
          Width = 35
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAmountRot: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 154
          Width = 35
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'QTD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPriceRot: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 128
          Width = 35
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'PRICE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSenha: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 55
          Width = 35
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Senha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblStopRot: TLabel
          AlignWithMargins = True
          Left = 130
          Top = 128
          Width = 30
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'STOP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTickerRot: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 94
          Width = 43
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'TICKER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbbAccount: TComboBox
          AlignWithMargins = True
          Left = 41
          Top = 24
          Width = 150
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cbbBolsa: TComboBox
          AlignWithMargins = True
          Left = 118
          Top = 90
          Width = 30
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'B'
          Items.Strings = (
            'B'
            'F')
        end
        object cbbGetAccount: TButton
          AlignWithMargins = True
          Left = 197
          Top = 24
          Width = 48
          Height = 22
          Caption = 'Atualizar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = cbbGetAccountClick
        end
        object edtAmount: TEdit
          AlignWithMargins = True
          Left = 42
          Top = 151
          Width = 83
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '100'
        end
        object edtPrice: TEdit
          AlignWithMargins = True
          Left = 42
          Top = 124
          Width = 83
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = '20'
        end
        object edtSenha: TEdit
          AlignWithMargins = True
          Left = 41
          Top = 52
          Width = 150
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object edtStopPrice: TEdit
          AlignWithMargins = True
          Left = 161
          Top = 124
          Width = 83
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 6
          Text = '20'
        end
        object edtTickerRot: TEdit
          AlignWithMargins = True
          Left = 50
          Top = 90
          Width = 65
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Text = 'PETR4'
        end
        object btnBuy: TButton
          AlignWithMargins = True
          Left = 4
          Top = 188
          Width = 62
          Height = 25
          Caption = 'Buy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = btnBuyClick
        end
        object btnModifica: TButton
          AlignWithMargins = True
          Left = 136
          Top = 188
          Width = 110
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Modificar selecionada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = btnModificaClick
        end
        object btnSell: TButton
          AlignWithMargins = True
          Left = 70
          Top = 188
          Width = 62
          Height = 25
          Caption = 'Sell'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnClick = btnSellClick
        end
        object btnStopBuy: TButton
          AlignWithMargins = True
          Left = 70
          Top = 219
          Width = 62
          Height = 25
          Caption = 'Stop Buy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnClick = btnStopBuyClick
        end
        object btnStopSell: TButton
          AlignWithMargins = True
          Left = 4
          Top = 219
          Width = 62
          Height = 25
          Caption = 'Stop Sell'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          OnClick = btnStopSellClick
        end
        object Button1: TButton
          AlignWithMargins = True
          Left = 3
          Top = 250
          Width = 112
          Height = 25
          Caption = 'Cancelar selecionada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnClick = Button1Click
        end
        object btnZerar: TButton
          AlignWithMargins = True
          Left = 136
          Top = 219
          Width = 110
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Zerar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnClick = btnZerarClick
        end
        object Button6: TButton
          AlignWithMargins = True
          Left = 3
          Top = 281
          Width = 243
          Height = 25
          Caption = 'Cancelar todas as ordens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          OnClick = Button6Click
        end
        object Button7: TButton
          AlignWithMargins = True
          Left = 118
          Top = 250
          Width = 128
          Height = 25
          Caption = 'Cancelar todas do ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          OnClick = Button7Click
        end
        object cbDayTrade: TCheckBox
          Left = 163
          Top = 317
          Width = 78
          Height = 17
          Caption = 'DayTrade'
          TabOrder = 17
          OnClick = cbDayTradeClick
        end
      end
      object gbPositions: TGroupBox
        AlignWithMargins = True
        Left = 265
        Top = 409
        Width = 511
        Height = 208
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Lista de posi'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          511
          208)
        object btnGetPosition: TButton
          AlignWithMargins = True
          Left = 433
          Top = 21
          Width = 75
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Get Position'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnGetPositionClick
        end
        object GridPosition: TGridView
          AlignWithMargins = True
          Left = 5
          Top = 48
          Width = 501
          Height = 155
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsSingle
          Caption = ''
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridStyle = gsReport
          GridLinesStyle = lsNormal
          HeaderSize = 18
          HeaderStyle = hsAuto
          HideScrollBar = True
          InputSize = 16
          Options = [goHeader, goHighlightTextSelection]
          RowSize = 16
          ParentColor = False
          ParentFont = False
          SelectionMoveDirection = mdDown
          SlideSize = 80
          TabOrder = 1
          TabStop = True
          WantReturns = False
          PreventFocus = False
          object TTextualColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 60
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'conta'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 0
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 60
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 60
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'titular'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 1
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 60
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taCenter
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 70
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'corretoraId'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 2
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = True
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 70
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'Ticker'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 3
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'AvgPriceIntraday'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 4
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'Qtd'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 5
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'AvgPriceSellToday'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 6
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'QtdSell'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 7
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'AvgPriceBuyToday'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 8
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
          object TTextualColumn
            Alignment = taLeftJustify
            Color = clWindow
            Cursor = crDefault
            DrawingOptions = doNormal
            DefaultWidth = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.Color = clWindow
            Footer.FormulaKind = fkNone
            FormulaKind = fkNone
            Header.Color = clBtnFace
            Header.Caption = 'QtdBuy'
            Header.DisplayMode = dmTextOnly
            Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
            Position = 9
            SlideBounds.Height = 0
            SlideBounds.Left = 0
            SlideBounds.Top = 0
            SlideBounds.Width = 0
            Sorted = False
            SortType = stAlphabetic
            VerticalAlignment = vaMiddle
            Visible = True
            Width = 80
            WrapKind = wkEllipsis
            AutoExecute = False
          end
        end
      end
    end
    object gbLogin: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 788
      Height = 92
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Login'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        788
        92)
      object lblActivation: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 21
        Width = 97
        Height = 13
        AutoSize = False
        Caption = 'ACTIVATION CODE:'
        FocusControl = edtCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 207
        Top = 21
        Width = 97
        Height = 13
        AutoSize = False
        Caption = 'Usu'#225'rio:'
        FocusControl = edtCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        AlignWithMargins = True
        Left = 334
        Top = 21
        Width = 97
        Height = 13
        AutoSize = False
        Caption = 'Senha:'
        FocusControl = edtCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnInterface: TButton
        AlignWithMargins = True
        Left = 534
        Top = 35
        Width = 160
        Height = 21
        Caption = 'Initialize + login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnInterfaceClick
      end
      object Button5: TButton
        AlignWithMargins = True
        Left = 700
        Top = 35
        Width = 85
        Height = 21
        Caption = 'Finalize'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Button5Click
      end
      object edtCode: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 35
        Width = 196
        Height = 21
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object pnlActivate: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 62
        Width = 122
        Height = 21
        Anchors = [akBottom]
        Caption = 'Ativado'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
      object pnlLogin: TPanel
        AlignWithMargins = True
        Left = 131
        Top = 62
        Width = 124
        Height = 21
        Anchors = [akBottom]
        Caption = 'Login'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
      object pnlMarket: TPanel
        AlignWithMargins = True
        Left = 261
        Top = 62
        Width = 125
        Height = 21
        Anchors = [akBottom]
        Caption = 'MarketData'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
      end
      object pnlRot: TPanel
        AlignWithMargins = True
        Left = 392
        Top = 62
        Width = 120
        Height = 21
        Anchors = [akBottom]
        Caption = 'Roteamento'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object edtUser: TEdit
        Left = 207
        Top = 35
        Width = 121
        Height = 21
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object edtAccPassword: TEdit
        Left = 334
        Top = 35
        Width = 194
        Height = 21
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 8
      end
    end
  end
end
