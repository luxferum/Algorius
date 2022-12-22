unit MainMarketTestU;

interface

uses
  Windows, Classes, Controls, Forms, StdCtrls, Vcl.ExtCtrls, ScrollView, Vcl.ComCtrls,
  ConnectorInterfaceMarketU, SysUtils,
  System.Generics.Collections, System.StrUtils, NumericEditU, Vcl.Grids,
  JvExGrids, JvGrids, Data.DB, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  CustomGridViewControl, CustomGridView, GridView, Messages, CellEditors;

const
  WM_ASSET_LIST      = WM_USER       + 99;

type


  TAssetID = record
    strTicker : String;
    strBolsa  : String;
    strName   : String;
  end;
  PAssetID = ^TAssetID;

  TGroupTicker = record
    AssetID  : TAssetID;
    nRow     : Integer;
  end;
  PGroupTicker = ^TGroupTicker;

  TGroupOffer = record
      nPosition  : Integer;
      nQtd       : Integer;
      nOfferID   : Int64;
      nAgent     : Integer;
      sPrice     : Double;
      strDtOffer : String;
  end;
  PGroupOffer = ^TGroupOffer;

  TGroupPrice = record
      nQtd   : Integer;
      sPrice : Double;
      nCount : Integer;
  end;
  PGroupPrice = ^TGroupPrice;

  TActionType = (atAdd = 0, atEdit = 1, atDelete = 2, atDeleteFrom = 3, atFullBook = 4);

  TMainMarketTest = class(TForm)
    gbToData: TGroupBox;
    lblActivation: TLabel;
    btnInitialize: TButton;
    edtCode: TEdit;
    btnFinalize: TButton;
    pnlMarket: TPanel;
    pnlActv: TPanel;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Edit5: TEdit;
    dateHistoryStart: TDateTimePicker;
    dateHistoryEnd: TDateTimePicker;
    btnGetTradesHistory: TButton;
    Edit4: TEdit;
    MemoCalback: TMemo;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    edtTicker: TEdit;
    ListBoxSubscribed: TListBox;
    UnsubTrade: TButton;
    SubTrade: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Edit7: TEdit;
    memoTinnySell: TMemo;
    memoTinnyBuy: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    lblProgress: TLabel;
    edtBolsa2: TEdit;
    edtBolsa1: TEdit;
    gbOfferBook: TGroupBox;
    Label8: TLabel;
    memoOfferBook: TMemo;
    Button11: TButton;
    gbPriceBook: TGroupBox;
    Label9: TLabel;
    memoPriceBook: TMemo;
    Button12: TButton;
    edtMonitorPrice: TNumericEditor;
    edtMonitor: TNumericEditor;
    GroupBox1: TGroupBox;
    memoListAtivos: TMemo;
    btnGetLstAtivos: TButton;
    edtGetListTicker: TEdit;
    GroupBox3: TGroupBox;
    gridTickers: TGridView;
    GroupBox4: TGroupBox;
    memoStatusTicker: TMemo;
    grpAdjustHistory: TGroupBox;
    gridAdjust: TGridView;
    edtAccPassword: TEdit;
    edtUser: TEdit;
    lblUser: TLabel;
    lblAccPassword: TLabel;

    procedure btnUnSubscribeClick(Sender : TObject);
    procedure btnSubscribeClick(Sender : TObject);
    procedure btnInitializeClick(Sender: TObject);
    procedure btnFinalizeClick(Sender: TObject);
    procedure btnGetTradesHistoryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure btnGetLstAtivosClick(Sender: TObject);
  private
    m_MainCanSet                : Boolean;

    m_nCountAsset               : Integer;
    slst_SubscribedTickers      : TStringList;

    m_lstOfferBuy               : TList;             // Exemplo para 1 Ativo somente
    m_lstOfferSell              : TList;             // Exemplo para 1 Ativo somente

    m_lstPriceBuy               : TList;             // Exemplo para 1 Ativo somente
    m_lstPriceSell              : TList;             // Exemplo para 1 Ativo somente

    m_lstTickers                : TDictionary<String, TGroupTicker>;

    procedure ProcessAssetList (var Msg:TMessage); message WM_ASSET_LIST;

    procedure LerArquivo;
    procedure DescriptaOfferArray(pRetorno    : Pointer; lstOffer : TList);
    procedure DescriptaPriceArray(pRetorno    : Pointer; lstPrice : TList);
    function  FindRow(rAssetID : TAssetIDRec) : Integer;
    procedure UpdateGridRow(nRow : Integer; sPrice : Single; strDate : String);
    procedure UpdateAdjustGridRow(nRow : Integer; sPrice : Single; strDate : String);
  public
    property MainCanSet : Boolean       read m_MainCanSet     write m_MainCanSet;

    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
  end;

var
  MainForm2 : TMainMarketTest;

////////////////////////////////////////////////////////////////////////////////
// WARNING: Não utilizar funções da dll dentro do CALLBACK
////////////////////////////////////////////////////////////////////////////////
//Callback do stado das diferentes conexões
procedure StateCallback(nConnStateType , nResult : Integer) stdcall; forward;
////////////////////////////////////////////////////////////////////////////////
//Callback com informações marketData
procedure AssetListCallback     (rAssetID : TAssetIDRec; pwcName : PWideChar) stdcall; forward;
procedure ChangeCotation        (rAssetID : TAssetIDRec; pwcDate : PWideChar; sPrice : Double) stdcall; forward;
procedure ChangeStateTicker     (rAssetID : TAssetIDRec; pwcDate   : PWideChar; nState : Integer) stdcall; forward;
procedure NewTradeCallback      (rAssetID : TAssetIDRec; pwcDate : PWideChar; sPrice, sVol : Double; nQtd, nBuyAgent, nSellAgent, nTradeType : Integer; bIsEdit : Char) stdcall; forward;
procedure NewDailyCallback      (rAssetID : TAssetIDRec; pwcDate : PWideChar; sOpen, sHigh, sLow, sClose, sVol, sAjuste, sMaxLimit, sMinLimit, sVolBuyer, sVolSeller : Double; nQtd, nNegocios, nContratosOpen, nQtdBuyer, nQtdSeller, nNegBuyer, nNegSeller : Integer) stdcall; forward;
procedure HistoryTradeCallback  (rAssetID : TAssetIDRec; pwcDate : PWideChar; sPrice, sVol : Double; nQtd, nBuyAgent, nSellAgent, nTradeType : Integer) stdcall; forward;
procedure AdjustHistoryCallback (rAssetID : TAssetIDRec; sValue : Double; strAdjustType, strObserv, dtAjuste, dtDeliber, dtPagamento : PWideChar; nAffectPrice : Integer) stdcall; forward;

procedure PriceBookCallback (                      rAssetID : TAssetIDRec ;
                   nAction , nPosition, Side, nQtds, nCount : Integer;
                                                     sPrice : Double;
                                      pArraySell, pArrayBuy : Pointer)  stdcall; forward;

procedure OfferBookCallback (                      rAssetID : TAssetIDRec ;
                     nAction, nPosition, Side, nQtd, nAgent : Integer;
                                                   nOfferID : Int64;
                                                     sPrice : Double;
       bHasPrice, bHasQtd, bHasDate, bHasOfferID, bHasAgent : Char;
                                                   pwcDate  : PWideChar;
                                      pArraySell, pArrayBuy : Pointer) stdcall; forward;

procedure ProgressCallback      (rAssetID : TAssetIDRec; nProgress : Integer) stdcall; forward;
procedure TinyBookCallback      (rAssetID : TAssetIDRec; sPrice    : Double; nQtd, nSide : Integer) stdcall; forward;
////////////////////////////////////////////////////////////////////////////////
// Functions
////////////////////////////////////////////////////////////////////////////////
// General
procedure CopyMemoryToStr(var strDest: String; Source: Pointer; Length: NativeUInt);

function DLLInitializeMarketLogin(
    const pwcActivationKey  : PWideChar;
    const pwcUser           : PWideChar;
    const pwcPassword       : PWideChar;
    StateCallback           : TStateCallback;
    NewTradeCallback        : TNewTradeCallback;
    NewDailyCallback        : TNewDailyCallback;
    PriceBookCallback       : TPriceBookCallback;
    OfferBookCallback       : TOfferBookCallback;
    HistoryTradeCallback    : THistoryTradeCallback;
    ProgressCallback        : TProgressCallback;
    TinyBookCallback        : TTinyBookCallback
    ) : ShortInt; stdcall;
external 'ProfitDLL.dll';

function DLLFinalize : ShortInt; stdcall;
external 'ProfitDLL.dll';

////////////////////////////////////////////////////////////////////////////////
// Market Data
function SetAdjustHistoryCallback     (AdjustHistory : TAdjustHistoryCallback) : ShortInt; stdcall; forward;
external 'ProfitDLL.dll';
function SetEnabledLogToDebug(nEnabled : Integer): ShortInt; stdcall;
external 'ProfitDLL.dll';
function SetChangeCotationCallback(ChangeCotation : TChangeCotation): ShortInt; stdcall;
external 'ProfitDLL.dll';
function SetChangeStateTickerCallback(ChangeState : TChangeStateTicker): ShortInt; stdcall;
external 'ProfitDLL.dll';
function SetAssetListCallback(AssetListCallback : TAssetListCallback) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function GetAllTicker(const pwcTicker : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function SubscribeTicker       (const pwcTicker : PWideChar; const pwcBolsa : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function UnsubscribeTicker     (const pwcTicker : PWideChar; const pwcBolsa : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function SubscribePriceBook    (const pwcTicker : PWideChar; const pwcBolsa : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function UnsubscribePriceBook  (const pwcTicker : PWideChar; const pwcBolsa : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function SubscribeOfferBook    (const pwcTicker : PWideChar; const pwcBolsa : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function UnsubscribeOfferBook  (const pwcTicker : PWideChar; const pwcBolsa : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function GetAgentNameByID      (nID : Integer) : PWideChar; stdcall;
external 'ProfitDLL.dll';
function GetAgentShortNameByID (nID : Integer) : PWideChar; stdcall;
external 'ProfitDLL.dll';
function GetHistoryTradesInInterval (const pwcTicker : PWideChar; const pwcBolsa : PWideChar; dtStart, dtEnd : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function FreePointer(pPointer :Pointer; nStart : Integer): ShortInt ;stdcall;
external 'ProfitDLL.dll';
// #Functions
////////////////////////////////////////////////////////////////////////////////

implementation

uses
  Vcl.Dialogs, Vcl.Graphics, DateUtils;
{$R *.dfm}

//******************************************************************************
//
//       Nome: Create
//  Descrição: Construtor da classe.
//
//    Criação:
// Modificado:
//
//******************************************************************************
constructor TMainMarketTest.Create(AOwner : TComponent);
begin
  inherited;
  m_nCountAsset          := 0;
  m_lstTickers           := TDictionary<String, TGroupTicker>.Create;
  slst_SubscribedTickers := TStringList.Create;
end;

//******************************************************************************
//
//       Nome: Destroy
//  Descrição: Destroy da classe.
//
//    Criação:
// Modificado:
//
//******************************************************************************
destructor TMainMarketTest.Destroy;
begin
  slst_SubscribedTickers.Free;
  DLLFinalize;
  inherited;
end;

//******************************************************************************
//
//       Nome: FormCreate
//  Descrição:
//
//
//******************************************************************************
procedure TMainMarketTest.FormCreate(Sender: TObject);

begin
  m_lstOfferBuy  := TList.Create;
  m_lstOfferSell := TList.Create;

  m_lstPriceBuy  := TList.Create;
  m_lstPriceSell := TList.Create;

  m_MainCanSet   := False;
end;

//******************************************************************************
//
//       Nome: StateCallback
//  Descrição: Retorno para os diferentes tipos de conexões
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure StateCallback(nConnStateType , nResult : Integer) stdcall;
begin
  if (nConnStateType = Ord(connStActv)) then
    begin
      if (nResult = Ord(connArSuccess)) then
        begin
          MainForm2.pnlActv.Caption   := 'Activate';
          MainForm2.pnlActv.Color     := clGreen;
          MainForm2.MainCanSet        := True;
        end
      else
        begin
          MainForm2.pnlActv.Caption  := 'Not Activate';
          MainForm2.pnlActv.Color := clRed;
        end;
    end;

  if (nConnStateType = Ord(connStMarket)) then
    begin
      if (nResult = Ord(ConncsConnectedLogged))  then
        begin
          MainForm2.pnlMarket.Caption   := 'Market Connectado';
          MainForm2.pnlMarket.Color     := clGreen;
        end
      else
        begin
          MainForm2.pnlMarket.Caption  := 'Market Desconectado';
          MainForm2.pnlMarket.Color := clRed;
        end;
    end;
end;

//******************************************************************************
//
//       Nome:
//  Descrição:
//
//
//******************************************************************************
procedure TMainMarketTest.btnGetLstAtivosClick(Sender: TObject);
begin
  m_nCountAsset := 0;
  GetAllTicker(PWideChar(edtGetListTicker.Text));
end;

//******************************************************************************
//
//       Nome: btnGetTradesHistoryClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainMarketTest.btnGetTradesHistoryClick(Sender: TObject);
begin
   GetHistoryTradesInInterval(PWideChar(Edit4.Text), PWideChar(edtBolsa2.Text), PWideChar(DateToStr(dateHistoryStart.Date)), PWideChar(TimeToStr(dateHistoryEnd.Date)));
end;

//******************************************************************************
//
//       Nome: btnInitializeClick
//  Descrição: Realiza a inicialização dos serviços
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainMarketTest.btnInitializeClick(Sender: TObject);
var
  nRes : ShortInt;
begin

  nRes := DLLInitializeMarketLogin(
    PWideChar(edtCode.Text),
    PWideChar(edtUser.Text),
    PWideChar(edtAccPassword.Text),
    StateCallback,
    NewTradeCallback,
    NewDailyCallback,
    PriceBookCallback,
    OfferBookCallback,
    HistoryTradeCallback,
    ProgressCallback,
    TinyBookCallback);

  m_MainCanSet   := False;

  if (nRes <> NL_OK) then
    ShowMessage('Could not initialize!');
end;

//******************************************************************************
//
//       Nome: btnFinalizeClick
//  Descrição: Realiza a finalizaçao dos serviços
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainMarketTest.btnFinalizeClick(Sender: TObject);
var
  nRes : ShortInt;
begin
  nRes := DLLFinalize;
  m_MainCanSet := False;

  if (nRes <> NL_OK) then
    ShowMessage('Could not initialize!');
end;


//******************************************************************************
//
//       Nome: StateCallback
//  Descrição: Retorno para os diferentes tipos de conexões
//
//    Criação:
// Modificado:
//
//******************************************************************************

procedure TMainMarketTest.btnUnSubscribeClick(Sender : TObject);
var
  nIndex : Integer;
  strTicker : string;
  nRes : ShortInt;
  bClear : LongBool;
begin
  if slst_SubscribedTickers.Count > 0 then
    begin
      bClear := True;
      for nIndex := 0 to slst_SubscribedTickers.Count - 1 do
        begin
          strTicker := slst_SubscribedTickers[nIndex];

          nRes := UnsubscribeTicker(PWideChar(edtTicker.Text), PWideChar(edtBolsa1.Text));

          if (nRes = NL_ERR_INIT) then
            ShowMessage('Please initialize.');
          if (nRes <> NL_OK) then
            begin
              bClear := false;
              ShowMessage('Could not unsubscribe from ' + strTicker + '!');
            end;
        end;
      if bClear then
        begin
          slst_SubscribedTickers.Clear;
          ListBoxSubscribed.Clear;
        end;
    end
  else
    ShowMessage('Nothing to unsubscribe.');
end;

//******************************************************************************
//
//       Nome: Button11Click
//  Descrição:
//
//
//******************************************************************************
procedure TMainMarketTest.Button11Click(Sender: TObject);
var
  Offer : PGroupOffer;
begin
  if (Sender = Button11) and (StrToInt(edtMonitor.Text) < m_lstOfferBuy.Count) and (StrToInt(edtMonitor.Text) >= 0) then
    begin
      Offer  := m_lstOfferBuy.Items[m_lstOfferBuy.Count - 1 - StrToInt(edtMonitor.Text)];
      memoOfferBook.Text :=          ' Posição=' + IntToStr(Offer.nPosition) +
                            #13#10 + ' Side=Buy' +
                            #13#10 + ' Qtd='     + IntToStr(Offer.nQtd) +
                            #13#10 + ' Agent='   + IntToStr(Offer.nAgent) +
                            #13#10 + ' Offer=' + IntToStr(Offer.nOfferID) +
                            #13#10 + ' Price=' + FloatToStr(Offer.sPrice) +
                            #13#10 + ' Date=' + Offer.strDtOffer;
    end;

  if (Sender = Button12) and (StrToInt(edtMonitor.Text) < m_lstOfferSell.Count) and (StrToInt(edtMonitor.Text) >= 0) then
    begin
      Offer  := m_lstOfferSell.Items[m_lstOfferSell.Count - 1 - StrToInt(edtMonitor.Text)];
      memoPriceBook.Text :=          ' Posição=' + IntToStr(Offer.nPosition) +
                            #13#10 + ' Side=Sell' +
                            #13#10 + ' Qtd='     + IntToStr(Offer.nQtd) +
                            #13#10 + ' Agent='   + IntToStr(Offer.nAgent) +
                            #13#10 + ' Offer=' + IntToStr(Offer.nOfferID) +
                            #13#10 + ' Price=' + FloatToStr(Offer.sPrice) +
                            #13#10 + ' Date=' + Offer.strDtOffer;
    end;
end;

//******************************************************************************
//
//       Nome: Button12Click
//  Descrição:
//
//
//******************************************************************************
procedure TMainMarketTest.Button12Click(Sender: TObject);
var
  Offer : PGroupPrice;
begin
  if (StrToInt(edtMonitorPrice.Text) <= m_lstPriceBuy.Count) and (StrToInt(edtMonitorPrice.Text) >= 0) then
    begin
      Offer  := m_lstPriceBuy.Items[m_lstPriceBuy.Count - 1 - StrToInt(edtMonitorPrice.Text)];

      memoPriceBook.Text :=          ' Side=Buy' +
                            #13#10 + ' Qtd='     + IntToStr(Offer.nQtd) +
                            #13#10 + ' Count='   + IntToStr(Offer.nCount) +
                            #13#10 + ' Price='   + FloatToStr(Offer.sPrice);
    end;

  if (StrToInt(edtMonitorPrice.Text) <= m_lstPriceSell.Count) and (StrToInt(edtMonitorPrice.Text) >= 0) then
    begin
      Offer  := m_lstPriceSell.Items[m_lstPriceSell.Count - 1 - StrToInt(edtMonitorPrice.Text)];

      memoPriceBook.Text := memoPriceBook.Text +
                            #13#10 + ' Side=Selll' +
                            #13#10 + ' Qtd='     + IntToStr(Offer.nQtd) +
                            #13#10 + ' Count='   + IntToStr(Offer.nCount) +
                            #13#10 + ' Price='   + FloatToStr(Offer.sPrice);
    end;
end;

//******************************************************************************
//
//       Nome: btnSubscribeClick
//  Descrição: Subscriber em Ativo
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainMarketTest.btnSubscribeClick(Sender : TObject);
var
  nRes     : ShortInt;
  gtTicker : TGroupTicker;
begin
  if m_MainCanSet then
    begin
      // 0 = False
      //SetEnabledLogToDebug(0);
      SetChangeCotationCallback(ChangeCotation);
      SetAssetListCallback(AssetListCallback);
      SetChangeStateTickerCallback(ChangeStateTicker);
      SetAdjustHistoryCallback(AdjustHistoryCallback);
      m_MainCanSet := False;
    end;

  if (edtTicker.Text <> '') and (slst_SubscribedTickers.IndexOf(edtTicker.Text) < 0) then
    begin
        nRes := SubscribeTicker(PWideChar(edtTicker.Text), PWideChar(edtBolsa1.Text));

        if (slst_SubscribedTickers.Count = 0) then
          begin
            nRes := SubscribePriceBook(PWideChar(edtTicker.Text), PWideChar(edtBolsa1.Text));
            if nRes = NL_OK then
              gbOfferBook.Caption := 'OfferBook ' + edtTicker.Text;

            nRes := SubscribeOfferBook(PWideChar(edtTicker.Text), PWideChar(edtBolsa1.Text));
            if nRes = NL_OK then
              gbPriceBook.Caption := 'PriceBook ' + edtTicker.Text;
          end;

      if (nRes = NL_ERR_INIT) then
        ShowMessage('Please initialize.');

      if (nRes = NL_OK) then
        begin
          slst_SubscribedTickers.Add(edtTicker.Text);
          ListBoxSubscribed.Items.Add(edtTicker.Text);
        end
      else
        ShowMessage('Could not subscribe!');
    end
  else
    begin
      if edtTicker.Text = '' then
        ShowMessage('Ticker name should not be empty!')
      else
        ShowMessage('Ticker already subscribed.');
    end;

  if not m_lstTickers.ContainsKey(UpperCase(edtTicker.Text)) then
    begin
      gtTicker.AssetID.StrTicker := edtTicker.Text;
      gtTicker.AssetID.strBolsa  := edtBolsa1.Text;
      gtTicker.nRow              := m_lstTickers.Count;
      m_lstTickers.Add(UpperCase(edtTicker.Text), gtTicker);

      gridTickers.AddRow;
      gridTickers.Cells[0, gtTicker.nRow] := edtTicker.Text + '_' + edtBolsa1.Text;

      gridAdjust.AddRow;
      gridAdjust.Cells[0, gtTicker.nRow] := edtTicker.Text + '_' + edtBolsa1.Text;

      UpdateGridRow      (gtTicker.nRow, 0, '00:00:00');
      UpdateAdjustGridRow(gtTicker.nRow, 0, '00:00:00');
    end;
end;

//******************************************************************************
//
//       Nome:
//  Descrição:
//
//
//******************************************************************************
procedure TMainMarketTest.UpdateGridRow(nRow : Integer; sPrice : Single; strDate : String);
begin
  if (nRow < gridTickers.RowCount) then
    begin
      gridTickers.Cells[1, nRow] := FloatToStrF(sPrice, ffCurrency, 8, 2);
      gridTickers.Cells[2, nRow] := strDate;
    end;
end;

//******************************************************************************
//
//       Nome: UpdateAdjustGridRow
//
//
//******************************************************************************
procedure TMainMarketTest.UpdateAdjustGridRow(nRow : Integer; sPrice : Single; strDate : String);
begin
  if (nRow < gridAdjust.RowCount) then
    begin
      gridAdjust.Cells[1, nRow] := FloatToStrF(sPrice, ffCurrency, 8, 2);
      gridAdjust.Cells[2, nRow] := strDate;
    end;
end;

//******************************************************************************
//
//       Nome: PriceBookCallback
//  Descrição:
//
//
//******************************************************************************
procedure PriceBookCallback(                                 rAssetID : TAssetIDRec ;
                             nAction , nPosition, Side, nQtds, nCount : Integer;
                                                               sPrice : Double;
                                                pArraySell, pArrayBuy : Pointer) stdcall;
var
  lstBook : TList;
  Group   : PGroupPrice;
  nIndex  : Integer;
begin
  with MainForm2 do
    begin
      if  pArraySell <> nil
        then DescriptaPriceArray (pArraySell, m_lstPriceSell);

      if  pArrayBuy <> nil
        then DescriptaPriceArray (pArrayBuy, m_lstPriceBuy);

      if Side = 0
        then lstBook := m_lstPriceBuy
        else lstBook := m_lstPriceSell;

      Case TActionType(nAction) of
        atAdd        : begin
                        //////////////////////////////////////////////////////////////////////////////
                        // Pega a oferta
                        if (lstBook <> nil) and (nPosition >= 0) and (nPosition <= lstBook.Count) then
                          begin
                            //////////////////////////////////////////////////////////////////////////
                            // Cria a oferta
                            New(Group);
                            Group.sPrice   := sPrice;
                            Group.nQtd     := nQtds;
                            Group.nCount   := nCount;

                            lstBook.Insert(lstBook.Count - nPosition, Group);
                          end;
                       end;
        atEdit       : begin
                          if (lstBook <> nil) and (nPosition >= 0) and (nPosition < lstBook.Count) then
                            begin
                              Group := lstBook.Items[lstBook.Count - 1 - nPosition];
                              //////////////////////////////////////////////////////////////////////////
                              // Atualiza a oferta
                              Group.nQtd   := Group.nQtd + nQtds;
                              Group.nCount := Group.nCount + nCount;
                            end;
                       end;
        atDelete     : begin
                          if (lstBook <> nil) and (nPosition >= 0) and (nPosition < lstBook.Count) then
                            begin
                              //////////////////////////////////////////////////////////////////////////
                              // Apaga a oferta
                              Group := lstBook.Items[lstBook.Count - 1 - nPosition];
                              Dispose(Group);
                              lstBook.Delete(lstBook.Count - 1 - nPosition);
                            end
                       end;
        atDeleteFrom : begin
                         if (lstBook <> nil) and (nPosition >= 0) and (nPosition < lstBook.Count) then
                            begin
                              //////////////////////////////////////////////////////////////////////////
                              // Apaga as ofertas
                              For nIndex := lstBook.Count-1-nPosition to lstBook.Count-1 do
                                begin
                                  Group := lstBook.Items[nIndex];
                                  Dispose(Group);
                                end;
                              lstBook.Count := lstBook.Count-1-nPosition;
                            end
                       end;
      end;

      if (nPosition = StrToInt(edtMonitorPrice.Text)) and (nPosition > 0) and (nPosition <= lstBook.Count) then
        begin
          Group  := lstBook.Items[lstBook.Count - 1 - nPosition];
          memoPriceBook.Text := rAssetID.pchTicker + #13#10 + ' Ação=' + IntToStr(nAction) +
                                                     #13#10 + ' PosiçãoUp=' + IntToStr(nPosition) +
                                                     #13#10 + ' Side=' + IntToStr(Side) +
                                                     #13#10 + ' Qtd=' + IntToStr(Group.nQtd) +
                                                     #13#10 + ' Count=' + IntToStr(Group.nCount) +
                                                     #13#10 + ' Price=' + FloatToStr(Group.sPrice);
        end;
    end;
end;

//******************************************************************************
//
//       Nome: DescriptaPriceArray
//  Descrição:
//
//
//******************************************************************************
procedure TMainMarketTest.DescriptaPriceArray(pRetorno : Pointer; lstPrice : TList);
var
  nQtd      : Integer;
  nTam      : Integer;
  nIndex    : Integer;
  nStart    : Integer;
  pBuffer   : PByteArray;
  Group     : PGroupPrice;
begin
  for nIndex := 0 to lstPrice.Count - 1 do
    begin
      Group := lstPrice[nIndex];
      Dispose(Group);
    end;
  lstPrice.Clear;

  pBuffer := pRetorno;
  nQtd := PInteger(@pBuffer[0])^;
  nTam := PInteger(@pBuffer[4])^;
  nStart := 8;
  for nIndex := 0 to nQtd - 1 do
    begin
      New(Group);
      //////////////////////////////////////////////////////////////////
      // Copia sPrice
      Group.sPrice := PDouble(@pBuffer[nStart])^;
      nStart       := nStart + 8;

      //////////////////////////////////////////////////////////////////
      // Copia nQtd
      Group.nQtd := PInteger(@pBuffer[nStart])^;
      nStart     := nStart + 4;

      //////////////////////////////////////////////////////////////////
      // Copia nCount
      Group.nCount := PInteger(@pBuffer[nStart])^;
      nStart       := nStart + 4;

      lstPrice.Add(Group)
    end;
  FreePointer(pRetorno, nStart);
end;

//******************************************************************************
//
//       Nome: OfferBookCallback
//  Descrição:
//
//
//******************************************************************************
procedure OfferBookCallback(                       rAssetID : TAssetIDRec ;
                     nAction, nPosition, Side, nQtd, nAgent : Integer;
                                                   nOfferID : Int64;
                                                     sPrice : Double;
       bHasPrice, bHasQtd, bHasDate, bHasOfferID, bHasAgent : Char;
                                                   pwcDate  : PWideChar;
                                      pArraySell, pArrayBuy : Pointer
                                        ) stdcall; stdcall;

var
  Offer    : PGroupOffer;
  lstBook  : TList;
  nIndex   : Integer;
begin
with MainForm2 do
    begin
      if  pArraySell <> nil
        then DescriptaOfferArray (pArraySell, m_lstOfferSell);
      if  pArrayBuy <> nil
        then DescriptaOfferArray (pArrayBuy, m_lstOfferBuy);

      if Side = 0
        then lstBook := m_lstOfferBuy
        else lstBook := m_lstOfferSell;

      Case TActionType(nAction) of
        atAdd        : begin
                        if (lstBook <> nil) and (nPosition >= 0) and (nPosition <= lstBook.Count) then
                          begin
                            New(Offer);
                            Offer.nOfferID   := nOfferID;
                            Offer.nAgent     := nAgent;
                            Offer.nQtd       := nQtd;
                            Offer.nPosition  := nPosition;
                            Offer.sPrice     := sPrice;
                            Offer.strDtOffer := pwcDate;
                            //////////////////////////////////////////////////////////////////////////
                            // Cria a oferta
                            lstBook.Insert(lstBook.Count - nPosition, Offer);
                          end
                      end;
        atDelete     : begin
                         //////////////////////////////////////////////////////////////////////////////
                        // Pega a oferta
                        if (lstBook <> nil) and (nPosition >= 0) and (nPosition < lstBook.Count) then
                          begin
                            //////////////////////////////////////////////////////////////////////////
                            // Apaga a oferta
                            Offer := lstBook.Items[lstBook.Count - 1 - nPosition];
                            Dispose(Offer);
                            lstBook.Delete(lstBook.Count - 1 - nPosition);
                          end
                       end;
        atDeleteFrom : begin
                          //////////////////////////////////////////////////////////////////////////////
                          // Pega a oferta
                          if (lstBook <> nil) and (nPosition >= 0) and (nPosition < lstBook.Count) then
                            begin
                              //////////////////////////////////////////////////////////////////////////
                              // Apaga as ofertas
                              For nIndex := lstBook.Count-1-nPosition to lstBook.Count-1 do
                                begin
                                  Offer := lstBook.Items[nIndex];

                                  Dispose(Offer);
                                end;
                              lstBook.Count := lstBook.Count-1-nPosition;
                            end
                       end;

        atEdit       : begin
                        //////////////////////////////////////////////////////////////////////////////
                        // Pega a oferta
                        if (lstBook <> nil) and (nPosition >= 0) and (nPosition < lstBook.Count) then
                          begin
                            Offer    := lstBook.Items[lstBook.Count - 1 - nPosition];
                            //////////////////////////////////////////////////////////////////////////
                            // Atualiza a oferta
                            if Boolean(bHasQtd) then
                              Offer.nQtd := Offer.nQtd + nQtd;
                            if Boolean(bHasPrice) then
                              Offer.sPrice := Offer.sPrice;
                            if Boolean(bHasDate) then
                              Offer.strDtOffer := pwcDate;
                            if Boolean(bHasAgent) then
                              Offer.nAgent := nAgent;
                            if Boolean(bHasOfferID) then
                              Offer.nOfferID := nOfferID;
                          end;
                       end;
      end;

      if (nPosition > 0) and (nPosition <= lstBook.Count) and (nPosition = StrToInt(edtMonitor.Text)) then
        begin
          Offer  := lstBook.Items[lstBook.Count - 1 - nPosition];
          memoOfferBook.Text := rAssetID.pchTicker + #13#10 + ' Ação=' + IntToStr(nAction) +
                                                     #13#10 + ' PosiçãoUp=' + IntToStr(nPosition) +
                                                     #13#10 + ' Posição=' + IntToStr(Offer.nPosition) +
                                                     #13#10 + ' Side=' + IntToStr(Side) +
                                                     #13#10 + ' Qtd=' + IntToStr(Offer.nQtd) +
                                                     #13#10 + ' Agent=' + IntToStr(Offer.nAgent) +
                                                     #13#10 + ' Offer=' + IntToStr(Offer.nOfferID) +
                                                     #13#10 + ' Price=' + FloatToStr(Offer.sPrice) +
                                                     #13#10 + ' Date=' + Offer.strDtOffer;
        end;
    end;
end;

//******************************************************************************
//
//       Nome: DescriptaOfferArray
//  Descrição:
//
//
//******************************************************************************
procedure TMainMarketTest.DescriptaOfferArray(pRetorno  : Pointer; lstOffer : TList);
var
  nQtd      : Integer;
  nTam      : Integer;
  nIndex    : Integer;
  nStart    : Integer;
  strAux    : String;
  nLength   : Word;
  pBuffer   : PByteArray;
  Offer     : PGroupOffer;
begin
  for nIndex := 0 to lstOffer.Count - 1 do
    begin
      Offer := lstOffer[nIndex];
      Dispose(Offer);
    end;
  lstOffer.Clear;

  pBuffer := pRetorno;
  nQtd := PInteger(@pBuffer[0])^;
  nTam := PInteger(@pBuffer[4])^;
  nStart := 8;
  for nIndex := 0 to nQtd - 1 do
    begin
      New(Offer);
      //////////////////////////////////////////////////////////////////
      // Copia sPrice
      Offer.sPrice := PDouble(@pBuffer[nStart])^;
      nStart       := nStart + 8;

      //////////////////////////////////////////////////////////////////
      // Copia nQtd
      Offer.nQtd := PInteger(@pBuffer[nStart])^;
      nStart     := nStart + 4;

      //////////////////////////////////////////////////////////////////
      // Copia nAgent
      Offer.nAgent := PInteger(@pBuffer[nStart])^;
      nStart       := nStart + 4;

      //////////////////////////////////////////////////////////////////
      // Copia nOfferID
      Offer.nOfferID := PInteger(@pBuffer[nStart])^;
      nStart         := nStart + 4;

      //////////////////////////////////////////////////////////////////
      // Copia dtOffer
      nLength := PWord(@pBuffer[nStart])^;
      nStart  := nStart + 2;

      SetLength(strAux, nLength);
      if nLength > 0 then
        CopyMemoryToStr(strAux, @pBuffer[nStart], nLength);
      nStart := nStart + nLength;

      Offer.strDtOffer := strAux;

      lstOffer.Add(Offer);
    end;
  FreePointer(pRetorno, nStart);
end;

//******************************************************************************
//
//       Nome: DescriptaOfferArray
//  Descrição:
//
//
//******************************************************************************
function TMainMarketTest.FindRow(rAssetID : TAssetIDRec) : Integer;
var
  gtTicker : TGroupTicker;
begin
  if m_lstTickers.TryGetValue(UpperCase(rAssetID.pchTicker), gtTicker)
    then Result := gtTicker.nRow
    else Result := -1;
end;

//******************************************************************************
//
//       Nome: CopyMemoryToStr
//  Descrição:
//
//
//******************************************************************************
procedure CopyMemoryToStr(var strDest: String; Source: Pointer; Length: NativeUInt);
var
  nIndex  : Integer;
  pMyArray : PByteArray;
begin
  if Length > 0 then
    begin
      pMyArray := Source;
      SetLength(strDest, Length);

      For nIndex := 1 to Length do
        strDest[nIndex] := Chr(pMyArray[nIndex - 1]);
    end
  else
    strDest := '';
end;

//******************************************************************************
//
//       Nome: ProgressCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure ProgressCallback (rAssetID : TAssetIDRec; nProgress : Integer) stdcall;
begin
  MainForm2.lblProgress.Caption := 'Progresso: ' + rAssetID.pchTicker + ' ' + IntToStr(nProgress);
  if nProgress = 100 then
    ShowMessage('Progresso Concluido=' + rAssetID.pchTicker);
end;
//******************************************************************************
//
//       Nome: HistoryTradeCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure HistoryTradeCallback  (rAssetID : TAssetIDRec; pwcDate : PWideChar; sPrice, sVol : Double; nQtd, nBuyAgent, nSellAgent, nTradeType : Integer) stdcall;
var
  strTradeType : String;
begin
  case nTradeType of
    32 : strTradeType := '-';
    1 : strTradeType := 'Direto';
    2 : strTradeType := 'Comprador';
    4 : strTradeType := 'Leilão';
    3 : strTradeType := 'Vendedor';
    5 : strTradeType := 'Controle';
    7 : strTradeType := 'Exercício';
    8 : strTradeType := 'Balcão';
    6 : strTradeType := 'Expit';
  else
    strTradeType := '-';
  end;

  MainForm2.MemoCalback.Text := string(rAssetID.pchTicker) + ' ' + pwcDate + ' ' + IntToStr(nQtd) + ' ' + FloatToStr(sPrice)  + ' ' +
                               ' ' + strTradeType;
end;

//******************************************************************************
//
//       Nome: AdjustHistoryCallback
//  Descrição:
//
//
//******************************************************************************
procedure AdjustHistoryCallback (rAssetID : TAssetIDRec; sValue : Double; strAdjustType, strObserv, dtAjuste, dtDeliber, dtPagamento : PWideChar; nAffectPrice : Integer) stdcall;
var
  nIndex : Integer;
begin
  nIndex := MainForm2.FindRow(rAssetID);
  if (nIndex <> -1) then
    begin
      MainForm2.UpdateAdjustGridRow(nIndex, sValue, dtAjuste);
    end;
end;

//******************************************************************************
//
//       Nome:
//  Descrição:
//
//
//******************************************************************************
procedure ChangeCotation (rAssetID : TAssetIDRec; pwcDate : PWideChar; sPrice : Double) stdcall;
var
  nIndex : Integer;
begin
  nIndex := MainForm2.FindRow(rAssetID);
  if (nIndex <> -1) then
    begin
      MainForm2.UpdateGridRow(nIndex, sPrice, pwcDate);
    end;
end;

//******************************************************************************
//
//       Nome:
//  Descrição:
//
//
//******************************************************************************
procedure ChangeStateTicker(rAssetID : TAssetIDRec; pwcDate : PWideChar; nState : Integer) stdcall;
var
  nIndex : Integer;
begin
  MainForm2.memoStatusTicker.Text := rAssetID.pchTicker + ':' + pwcDate + ':' +  IntToStr(nState);
end;

//******************************************************************************
//
//       Nome:
//  Descrição:
//
//
//******************************************************************************
procedure AssetListCallback (rAssetID : TAssetIDRec; pwcName : PWideChar) stdcall;
var
  pAsset : PAssetID;
begin
  New(pAsset);
  pAsset.strTicker := rAssetID.pchTicker;
  pAsset.strBolsa  := rAssetID.pchBolsa;
  pAsset.strName   := pwcName;
  PostMessage(MainForm2.Handle, WM_ASSET_LIST, Cardinal(pAsset), 0);
end;

//******************************************************************************
//
//       Nome:
//  Descrição:
//
//
//******************************************************************************
procedure TMainMarketTest.ProcessAssetList(var Msg: TMessage);
var
  pAsset : PAssetID;
begin
  pAsset := PAssetID(Msg.wParam);
  Inc(m_nCountAsset);
  memoListAtivos.Text := pAsset.strTicker + ' : '+ pAsset.strName +  ' : ' +IntToStr(m_nCountAsset);
  Dispose(pAsset);
end;

//******************************************************************************
//
//       Nome: NewTradeCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure NewTradeCallback(              rAssetID : TAssetIDRec;
                                          pwcDate : PWideChar;
                                     sPrice, sVol : Double;
          nQtd, nBuyAgent, nSellAgent, nTradeType : Integer;
                                          bIsEdit : Char) stdcall;
var
  strTradeType : string;
begin
  case nTradeType of
    32 : strTradeType := '-';
    1 : strTradeType := 'Direto';
    2 : strTradeType := 'Comprador';
    4 : strTradeType := 'Leilão';
    3 : strTradeType := 'Vendedor';
    5 : strTradeType := 'Controle';
    7 : strTradeType := 'Exercício';
    8 : strTradeType := 'Balcão';
    6 : strTradeType := 'Expit';
  else
    strTradeType := '-';
  end;

  MainForm2.Memo1.Text :=  pwcDate + ' ' + rAssetID.pchTicker +  ' ' +
                 ' ' + FloatToStrF(sPrice, ffCurrency, 6, 2) + ' ' + IntToStr(nQtd) + ' ' +
                 ' ' + strTradeType;
end;

//******************************************************************************
//
//       Nome: NewTradeCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure NewDailyCallback(                                                                 rAssetID : TAssetIDRec;
                                                                                             pwcDate : PWideChar;
              sOpen, sHigh, sLow, sClose, sVol, sAjuste, sMaxLimit, sMinLimit, sVolBuyer, sVolSeller : Double;
                       nQtd, nNegocios, nContratosOpen, nQtdBuyer, nQtdSeller, nNegBuyer, nNegSeller : Integer) stdcall;
begin
    MainForm2.Edit1.Text := ( string(rAssetID.pchTicker)+ ' '+
    'Open: ' +
    floattostrf(sOpen, ffCurrency, 4, 2) +
    ' ' +
    'Close: ' +
    floattostrf(sClose, ffCurrency, 4, 2) +
    ' ' +
    'High: ' +
    floattostrf(sHigh, ffCurrency, 4, 2) +
    ' ' +
    'Low: ' +
    floattostrf(sLow, ffCurrency, 4, 2) +
    ' ' +
    'Vol: ' +
    floattostrf(sVol, ffCurrency, 4, 2) +
    ' ' +
    'Ajuste: ' +
    floattostrf(sAjuste, ffCurrency, 4, 2) +
    ' ' +
    'MaxLimit: ' +
    floattostrf(sMaxLimit, ffCurrency, 4, 2) +
    ' ' +
    'MinLimit: ' +
    floattostrf(sMinLimit, ffCurrency, 4, 2) +
    ' ' +
    'VolBuyer: ' +
    floattostrf(sVolBuyer, ffCurrency, 4, 2) +
    ' ' +
    'VolSeller: ' +
    floattostrf(sVolSeller, ffCurrency, 4, 2) +
    ' ' +
    'Qtd: ' +
    IntToStr(nQtd) +
    ' ' +
    'nNegocios: ' +
    IntToStr(nNegocios) +
    ' ' +
    'nContratosOpen: ' +
    IntToStr(nContratosOpen) +
    ' ' +
    'nQtdBuyer: ' +
    IntToStr(nQtdBuyer) +
    ' ' +
    'nQtdSeller: ' +
    IntToStr(nQtdSeller) +
    ' ' +
    'nNegBuyer: ' +
    IntToStr(nNegBuyer) +
    ' ' +
    'nNegSeller: ' +
    IntToStr(nNegSeller)
  );
end;

//******************************************************************************
//
//       Nome:
//  Descrição:
//
//
//******************************************************************************
procedure TinyBookCallback  (rAssetID  : TAssetIDRec;
                             sPrice    : Double;
                           nQtd, nSide : Integer);
begin
  if nSide = 0
    then MainForm2.memoTinnyBuy.Text  := string(rAssetID.pchTicker) + ' ' + FloatToStrF(sPrice, ffCurrency, 6, 2) + ' ' + IntToStr(nQtd)
    else MainForm2.memoTinnySell.Text := string(rAssetID.pchTicker) + ' ' + FloatToStrF(sPrice, ffCurrency, 6, 2) + ' ' + IntToStr(nQtd);
end;

//******************************************************************************
//
//       Nome: LerArquivo
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainMarketTest.LerArquivo;
var
  arq   : TextFile;
  linha : String;
  strB  : String;
  nRes  : Integer;
begin
  strB := 'B';
  AssignFile(arq, '');

  {$I-}         // desativa a diretiva de Input
  Reset(arq);   // [ 3 ] Abre o arquivo texto para leitura
  {$I+}         // ativa a diretiva de Input

  if (IOResult <> 0) then
    ShowMessage('Erro')
  else
    begin
      readln(arq, linha);
      while (not eof(arq)) do
        begin
          readln(arq, linha);

          nRes := SubscribeTicker(PWideChar(linha), PWideChar(strB));

          if (nRes = NL_OK) then
            begin
              slst_SubscribedTickers.Add(linha);
              ListBoxSubscribed.Items.Add(linha);
            end;
          Sleep(10);
        end;

      CloseFile(arq);
    end;
end;

//******************************************************************************
end.

