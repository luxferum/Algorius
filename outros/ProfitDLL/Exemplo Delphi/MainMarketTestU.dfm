object MainMarketTest: TMainMarketTest
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'MainForm'
  ClientHeight = 514
  ClientWidth = 954
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    954
    514)
  PixelsPerInch = 96
  TextHeight = 13
  object gbToData: TGroupBox
    Left = -2
    Top = -5
    Width = 956
    Height = 526
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      956
      526)
    object lblActivation: TLabel
      Left = 11
      Top = 6
      Width = 97
      Height = 13
      Caption = 'ACTIVATION CODE:'
    end
    object lblUser: TLabel
      Left = 231
      Top = 6
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object lblAccPassword: TLabel
      Left = 358
      Top = 6
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object btnInitialize: TButton
      Left = 11
      Top = 58
      Width = 135
      Height = 27
      Caption = 'Initialize + login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnInitializeClick
    end
    object edtCode: TEdit
      Left = 11
      Top = 25
      Width = 214
      Height = 21
      TabOrder = 1
    end
    object btnFinalize: TButton
      Left = 159
      Top = 58
      Width = 66
      Height = 27
      Caption = 'Finalize'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnFinalizeClick
    end
    object pnlMarket: TPanel
      Left = 353
      Top = 57
      Width = 109
      Height = 28
      Caption = 'Market'
      Color = clRed
      ParentBackground = False
      TabOrder = 3
    end
    object pnlActv: TPanel
      Left = 241
      Top = 57
      Width = 106
      Height = 28
      Caption = 'Activate'
      Color = clRed
      ParentBackground = False
      TabOrder = 4
    end
    object GroupBox5: TGroupBox
      Left = 3
      Top = 412
      Width = 478
      Height = 101
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object Label5: TLabel
        Left = 11
        Top = 7
        Width = 90
        Height = 13
        Caption = 'Historico de trades'
      end
      object lblProgress: TLabel
        Left = 107
        Top = 7
        Width = 55
        Height = 13
        Caption = 'Progresso: '
      end
      object Edit5: TEdit
        Left = 3
        Top = 408
        Width = 94
        Height = 21
        TabOrder = 0
      end
      object dateHistoryStart: TDateTimePicker
        Left = 142
        Top = 26
        Width = 96
        Height = 21
        Date = 43318.000000000000000000
        Time = 0.613715486113505900
        TabOrder = 1
      end
      object dateHistoryEnd: TDateTimePicker
        Left = 244
        Top = 26
        Width = 83
        Height = 21
        Date = 43318.000000000000000000
        Time = 0.613715486113505900
        Kind = dtkTime
        TabOrder = 2
      end
      object btnGetTradesHistory: TButton
        Left = 342
        Top = 26
        Width = 99
        Height = 21
        Caption = 'Historico de trades'
        TabOrder = 3
        OnClick = btnGetTradesHistoryClick
      end
      object Edit4: TEdit
        Left = 3
        Top = 26
        Width = 86
        Height = 21
        TabOrder = 4
      end
      object MemoCalback: TMemo
        Left = 3
        Top = 64
        Width = 470
        Height = 25
        TabOrder = 5
      end
      object edtBolsa2: TEdit
        Left = 95
        Top = 26
        Width = 41
        Height = 21
        TabOrder = 6
      end
    end
    object GroupBox2: TGroupBox
      Left = -4
      Top = 98
      Width = 488
      Height = 187
      Anchors = [akLeft]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      DesignSize = (
        488
        187)
      object Label4: TLabel
        Left = 18
        Top = 3
        Width = 50
        Height = 13
        Caption = 'Subscriber'
      end
      object Label1: TLabel
        Left = 11
        Top = 55
        Width = 23
        Height = 13
        Caption = 'Daily'
      end
      object Label2: TLabel
        Left = 11
        Top = 107
        Width = 33
        Height = 13
        Caption = 'Trades'
      end
      object edtTicker: TEdit
        Left = 13
        Top = 23
        Width = 84
        Height = 21
        Anchors = []
        TabOrder = 0
      end
      object ListBoxSubscribed: TListBox
        Left = 320
        Top = 23
        Width = 165
        Height = 45
        AutoComplete = False
        Anchors = []
        ItemHeight = 13
        TabOrder = 1
      end
      object UnsubTrade: TButton
        Left = 238
        Top = 21
        Width = 66
        Height = 25
        Anchors = []
        Caption = 'Unsubscribe'
        TabOrder = 2
        OnClick = btnUnSubscribeClick
      end
      object SubTrade: TButton
        Left = 150
        Top = 21
        Width = 82
        Height = 25
        Anchors = []
        Caption = 'Subscribe'
        TabOrder = 3
        OnClick = btnSubscribeClick
      end
      object Edit1: TEdit
        Left = 11
        Top = 80
        Width = 474
        Height = 21
        Anchors = []
        TabOrder = 4
      end
      object Memo1: TMemo
        Left = 11
        Top = 126
        Width = 474
        Height = 50
        TabOrder = 5
      end
      object edtBolsa1: TEdit
        Left = 103
        Top = 23
        Width = 41
        Height = 21
        TabOrder = 6
      end
    end
    object GroupBox6: TGroupBox
      Left = 3
      Top = 291
      Width = 481
      Height = 115
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object Label6: TLabel
        Left = 11
        Top = 13
        Width = 68
        Height = 13
        Caption = 'TinnyBook Sell'
      end
      object Label7: TLabel
        Left = 11
        Top = 60
        Width = 70
        Height = 13
        Caption = 'TinnyBook Buy'
      end
      object Edit7: TEdit
        Left = 3
        Top = 408
        Width = 94
        Height = 21
        TabOrder = 0
      end
      object memoTinnySell: TMemo
        Left = 3
        Top = 32
        Width = 475
        Height = 25
        TabOrder = 1
      end
      object memoTinnyBuy: TMemo
        Left = 3
        Top = 74
        Width = 475
        Height = 25
        TabOrder = 2
      end
    end
    object gbOfferBook: TGroupBox
      AlignWithMargins = True
      Left = 735
      Top = 21
      Width = 208
      Height = 264
      Anchors = [akRight]
      Caption = 'OfferBook'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      DesignSize = (
        208
        264)
      object Label8: TLabel
        AlignWithMargins = True
        Left = 6
        Top = 24
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
      object memoOfferBook: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 56
        Width = 198
        Height = 203
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
      object Button11: TButton
        AlignWithMargins = True
        Left = 108
        Top = 20
        Width = 85
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'Atualizar linha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button11Click
      end
      object edtMonitor: TNumericEditor
        Left = 74
        Top = 20
        Width = 28
        Height = 20
        Alignment = taLeftJustify
        BorderStyle = bsSingle
        Margin = 0
        ParentColor = False
        TabOrder = 2
        TabStop = True
        VerticalAlignment = vaMiddle
        AutoSelect = False
        ReadOnly = False
        Text = '0'
        Options = [eoAllowFloat, eoAllowSigns]
        Precision = 0
      end
    end
    object gbPriceBook: TGroupBox
      AlignWithMargins = True
      Left = 735
      Top = 291
      Width = 208
      Height = 222
      Anchors = [akRight]
      Caption = 'PriceBook'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      DesignSize = (
        208
        222)
      object Label9: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 21
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
      object memoPriceBook: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 44
        Width = 198
        Height = 173
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
      object Button12: TButton
        AlignWithMargins = True
        Left = 110
        Top = 17
        Width = 83
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'Atualizar linha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button12Click
      end
      object edtMonitorPrice: TNumericEditor
        Left = 76
        Top = 18
        Width = 28
        Height = 20
        Alignment = taLeftJustify
        BorderStyle = bsSingle
        Margin = 0
        ParentColor = False
        TabOrder = 2
        TabStop = True
        VerticalAlignment = vaMiddle
        AutoSelect = False
        ReadOnly = False
        Text = '0'
        Options = [eoAllowFloat, eoAllowSigns]
        Precision = 0
      end
    end
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 487
      Top = 412
      Width = 239
      Height = 101
      Anchors = [akRight]
      Caption = 'Callback Asset Info'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      DesignSize = (
        239
        101)
      object memoListAtivos: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 47
        Width = 229
        Height = 49
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
      object btnGetLstAtivos: TButton
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 186
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'Get Ativos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnGetLstAtivosClick
      end
      object edtGetListTicker: TEdit
        Left = 195
        Top = 17
        Width = 41
        Height = 24
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 490
      Top = 21
      Width = 239
      Height = 108
      Anchors = [akRight]
      Caption = 'Callback Change Price'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      DesignSize = (
        239
        108)
      object gridTickers: TGridView
        Left = 3
        Top = 20
        Width = 236
        Height = 241
        Cursor = 3000
        Anchors = [akTop, akRight]
        BorderStyle = bsSingle
        Caption = ''
        GridStyle = gsReport
        GridLinesStyle = lsNormal
        HeaderSize = 18
        HeaderStyle = hsAuto
        HideScrollBar = True
        InputSize = 16
        Options = [goHeader, goHighlightTextSelection]
        RowSize = 16
        ParentColor = False
        SelectionMoveDirection = mdNone
        SlideSize = 80
        TabOrder = 0
        TabStop = True
        WantReturns = False
        PreventFocus = False
        object TTextualColumn
          Alignment = taLeftJustify
          Color = clWindow
          Cursor = crDefault
          DrawingOptions = doNormal
          DefaultWidth = 50
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.Color = clWindow
          Footer.FormulaKind = fkNone
          FormulaKind = fkNone
          Header.Color = clBtnFace
          Header.Caption = 'Asset'
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
          Width = 50
          WrapKind = wkEllipsis
          AutoExecute = False
        end
        object TTextualColumn
          Alignment = taLeftJustify
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
          Header.Caption = 'Price'
          Header.DisplayMode = dmTextOnly
          Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
          Position = 1
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
          Alignment = taLeftJustify
          Color = clWindow
          Cursor = crDefault
          DrawingOptions = doNormal
          DefaultWidth = 120
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
          Position = 2
          SlideBounds.Height = 0
          SlideBounds.Left = 0
          SlideBounds.Top = 0
          SlideBounds.Width = 0
          Sorted = False
          SortType = stAlphabetic
          VerticalAlignment = vaMiddle
          Visible = True
          Width = 120
          WrapKind = wkEllipsis
          AutoExecute = False
        end
      end
    end
    object GroupBox4: TGroupBox
      AlignWithMargins = True
      Left = 487
      Top = 291
      Width = 239
      Height = 115
      Anchors = [akRight]
      Caption = 'Update Status Ticker'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      object memoStatusTicker: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 16
        Width = 229
        Height = 94
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
    end
    object grpAdjustHistory: TGroupBox
      AlignWithMargins = True
      Left = 490
      Top = 153
      Width = 239
      Height = 108
      Anchors = [akRight]
      Caption = 'Callback Adjust History'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      DesignSize = (
        239
        108)
      object gridAdjust: TGridView
        Left = 3
        Top = 20
        Width = 236
        Height = 241
        Anchors = [akTop, akRight]
        BorderStyle = bsSingle
        Caption = ''
        GridStyle = gsReport
        GridLinesStyle = lsNormal
        HeaderSize = 18
        HeaderStyle = hsAuto
        HideScrollBar = True
        InputSize = 16
        Options = [goHeader, goHighlightTextSelection]
        RowSize = 16
        ParentColor = False
        SelectionMoveDirection = mdNone
        SlideSize = 80
        TabOrder = 0
        TabStop = True
        WantReturns = False
        PreventFocus = False
        object TTextualColumn
          Alignment = taLeftJustify
          Color = clWindow
          Cursor = crDefault
          DrawingOptions = doNormal
          DefaultWidth = 50
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.Color = clWindow
          Footer.FormulaKind = fkNone
          FormulaKind = fkNone
          Header.Color = clBtnFace
          Header.Caption = 'Asset'
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
          Width = 50
          WrapKind = wkEllipsis
          AutoExecute = False
        end
        object TTextualColumn
          Alignment = taLeftJustify
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
          Header.Caption = 'Price'
          Header.DisplayMode = dmTextOnly
          Options = [coCanClick, coCanSort, coEditorAutoSelect, coPublicUsing]
          Position = 1
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
          Alignment = taLeftJustify
          Color = clWindow
          Cursor = crDefault
          DrawingOptions = doNormal
          DefaultWidth = 120
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
          Position = 2
          SlideBounds.Height = 0
          SlideBounds.Left = 0
          SlideBounds.Top = 0
          SlideBounds.Width = 0
          Sorted = False
          SortType = stAlphabetic
          VerticalAlignment = vaMiddle
          Visible = True
          Width = 120
          WrapKind = wkEllipsis
          AutoExecute = False
        end
      end
    end
    object edtAccPassword: TEdit
      Left = 358
      Top = 25
      Width = 121
      Height = 21
      TabOrder = 14
    end
    object edtUser: TEdit
      Left = 231
      Top = 25
      Width = 121
      Height = 21
      TabOrder = 15
    end
  end
end
