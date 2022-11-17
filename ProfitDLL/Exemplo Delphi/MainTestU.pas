//******************************************************************************
//
//       Nome: MainTestU
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
unit MainTestU;

interface

uses
  Windows,
  Classes,
  Messages,
  Controls,
  Forms,
  StdCtrls,
  Vcl.ExtCtrls,
  ScrollView,
  CustomGridViewControl,
  CustomGridView,
  GridView,
  Vcl.ComCtrls,
  NumericEditU,
  Vcl.Samples.Spin,
  ConnectorInterfaceU, SysUtils,
  System.Generics.Collections, System.Types,System.StrUtils,
  REST.JSON, System.JSON;

type
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

  TMainForm = class(TForm)
    pnlGlobal : TPanel;
    btnInterface : TButton;
    edtCode : TEdit;
    lblActivation : TLabel;
    pnlActivate: TPanel;
    lblPriceRot: TLabel;
    lblAmountRot: TLabel;
    lblTickerRot: TLabel;
    lblSenha: TLabel;
    btnBuy: TButton;
    edtPrice: TEdit;
    edtAmount: TEdit;
    btnSell: TButton;
    edtTickerRot: TEdit;
    edtSenha: TEdit;
    cbbAccount: TComboBox;
    cbbBolsa: TComboBox;
    GridOrder: TGridView;
    btnModifica: TButton;
    btnLoadOrder: TButton;
    pnlRot: TPanel;
    cbbGetAccount: TButton;
    Button1: TButton;
    btnZerar: TButton;
    btnGetOrder: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    dateEnd: TDateTimePicker;
    edtGetOrder: TEdit;
    gbTradeDayle: TGroupBox;
    edtTicker: TEdit;
    ListBoxSubscribed: TListBox;
    GridPosition: TGridView;
    btnGetPosition: TButton;
    dateStart: TDateTimePicker;
    gbOfferBook: TGroupBox;
    Label3: TLabel;
    btnUnsubBook: TButton;
    ListBox1: TListBox;
    gbPriceBook: TGroupBox;
    ListBox2: TListBox;
    lblTicker: TLabel;
    btnUnsubTrade: TButton;
    btnUnsubMiniBook: TButton;
    pnlMarket: TPanel;
    pnlLogin: TPanel;
    Edit3: TEdit;
    btnSubBook: TButton;
    btnSubMiniBook: TButton;
    btnSubTrade: TButton;
    gbTradeHistory: TGroupBox;
    dateHistoryStart: TDateTimePicker;
    dateHistoryEnd: TDateTimePicker;
    btnGetTradesHistory: TButton;
    Label6: TLabel;
    MemoCalback: TMemo;
    Edit2: TEdit;
    MemoTrades: TMemo;
    memoTinnySell: TMemo;
    memoTinnyBuy: TMemo;
    Label7: TLabel;
    lblProgress: TLabel;
    Edit4: TEdit;
    memoOfferBook: TMemo;
    memoPriceBook: TMemo;
    edtMonitor: TEdit;
    Label8: TLabel;
    edtMonitorPrice: TEdit;
    Label9: TLabel;
    Button11: TButton;
    Button12: TButton;
    gbLogin: TGroupBox;
    gbRoteamento: TGroupBox;
    lblOrderID: TLabel;
    lblTickerTrade: TLabel;
    cbbBolsa2: TComboBox;
    cbbBolsa1: TComboBox;
    Edit8: TComboBox;
    Edit6: TComboBox;
    lblTickerHist: TLabel;
    btnStopSell: TButton;
    btnStopBuy: TButton;
    edtStopPrice: TEdit;
    lblStopRot: TLabel;
    lblAccount: TLabel;
    gbMarketData: TGroupBox;
    gbOrderControl: TGroupBox;
    gbOrders: TGroupBox;
    gbPositions: TGroupBox;
    MemoDaily: TMemo;
    cbDayTrade: TCheckBox;
    gbAdjustHistory: TGroupBox;
    MemoAdjustHistory: TMemo;
    btnClearAdjustHistory: TButton;
    MemoAssetState: TMemo;
    gbAssetInfo: TGroupBox;
    btnAssetInfo: TButton;
    MemoAssetInfo: TMemo;
    cbBolsaAssetInfo: TComboBox;
    edtTickerAssetInfo: TEdit;
    Label1: TLabel;
    MemoChangeCotation: TMemo;
    edtUser: TEdit;
    edtAccPassword: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    procedure btnInterfaceClick(Sender : TObject);
    procedure btnBuyClick(Sender: TObject);
    procedure btnSellClick(Sender: TObject);
    procedure btnModificaClick(Sender: TObject);
    procedure btnLoadOrderClick(Sender: TObject);
    procedure cbbGetAccountClick(Sender: TObject);
    procedure btnZerarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnGetPositionClick(Sender: TObject);
    procedure btnGetOrderClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure GridOrderCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure btnUnsubMiniBookClick(Sender : TObject);
    procedure btnSubMiniBookClick(Sender : TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGetTradesHistoryClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure btnStopSellClick(Sender: TObject);
    procedure btnStopBuyClick(Sender: TObject);
    procedure cbDayTradeClick(Sender: TObject);
    procedure btnClearAdjustHistoryClick(Sender: TObject);
    procedure btnAssetInfoClick(Sender: TObject);

  private
    m_MainCanSet                : Boolean;
    b_Connected                 : Boolean;
    slst_SubscribedTickers      : TStringList;
    slst_SubscribedTickers2     : TStringList;
    slst_SubscribedTickers3     : TStringList;
    m_ExecGo                    : Boolean;
    m_Count                     : Int64;

    m_lstOfferBuy               : TList;             // Exemplo para 1 Ativo somente
    m_lstOfferSell              : TList;             // Exemplo para 1 Ativo somente

    m_lstPriceBuy               : TList;             // Exemplo para 1 Ativo somente
    m_lstPriceSell              : TList;             // Exemplo para 1 Ativo somente

    procedure DescriptaPositionArray(pRetorno   : Pointer);
    procedure DescriptaOfferArray(pRetorno   : Pointer; lstOffer : TList);
    procedure DescriptaPriceArray(pRetorno   : Pointer; lstPrice : TList);
    procedure SetConnectionReady(nError : Integer);
    procedure SetConnectionFailed;

  public
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
  end;

var
  MainForm : TMainForm;
////////////////////////////////////////////////////////////////////////////////
//Callback do stato das diferentes conexões
procedure StateCallback(nConnStateType , nResult : Integer) stdcall; forward;
////////////////////////////////////////////////////////////////////////////////
//Callback  do stado do hystorico
procedure HistoryCallback    (                                       rAssetID  : TAssetIDRec;
                              nCorretora , nQtd, nTradedQtd, nLeavesQtd, nSide : Integer;
                                                 sPrice, sStopPrice, sAvgPrice : Double;
                                                                     nProfitID : Int64;
                              TipoOrdem, Conta, Titular, ClOrdID, Status, Date : PWideChar) stdcall; forward;
procedure ProgressCallback( rAssetID  : TAssetIDRec ; nProgress : Integer) stdcall; forward;
////////////////////////////////////////////////////////////////////////////////
//Callback de alterãção em ordens
procedure OrderChangeCallback(                                       rAssetID  : TAssetIDRec;
                              nCorretora , nQtd, nTradedQtd, nLeavesQtd, nSide : Integer;
                                                 sPrice, sStopPrice, sAvgPrice : Double;
                                                                     nProfitID : Int64;
                 TipoOrdem, Conta, Titular, ClOrdID, Status, Date, TextMessage : PWideChar) stdcall; forward;

////////////////////////////////////////////////////////////////////////////////
//Callback com a lista de contas
procedure AccountCallback(             nCorretora : Integer;
    CorretoraNomeCompleto, AccountID, NomeTitular : PWideChar) stdcall; forward;

////////////////////////////////////////////////////////////////////////////////
//Callback de configs
procedure AssetListCallback     (rAssetID : TAssetIDRec; pwcName : PWideChar) stdcall; forward;
procedure AssetListInfoCallback (rAssetID : TAssetIDRec; strName, strDescription : PWideChar; nMinOrderQtd, nMaxOrderQtd, nLote, stSecurityType, ssSecuritySubType : Integer; sMinPriceIncrement, sContractMultiplier : Double; strDate, strISIN : PWideChar); stdcall; forward;
procedure ChangeCotation        (rAssetID : TAssetIDRec; pwcDate : PWideChar; nTradeNumber : Cardinal; sPrice : Double) stdcall; forward;
procedure ChangeStateTicker     (rAssetID : TAssetIDRec; pwcDate   : PWideChar; nState : Integer) stdcall; forward;
procedure AdjustHistoryCallback (rAssetID : TAssetIDRec; sValue : Double; strAdjustType, strObserv, dtAjuste, dtDeliber, dtPagamento : PWideChar; nAffectPrice : Integer) stdcall; forward;

////////////////////////////////////////////////////////////////////////////////
//Callback com informações marketData
procedure NewTradeCallback      (rAssetID : TAssetIDRec;
                                  pwcDate : PWideChar;
                             nTradeNumber : Cardinal;
                             sPrice, sVol : Double;
  nQtd, nBuyAgent, nSellAgent, nTradeType : Integer;
                                  bIsEdit : Char) stdcall; forward;

//procedure NewQuoteCallback          (rDataSerieID : TDataSerieIDRec;
//                                          pwcDate : PWideChar;
//               dOpen, dMax, dMin, dClose, sVolume : Double;
//                                             nQtd : Int64;
//                                        nNegocios : Integer;
//                          sAgrVolBuy, sAgrVolSell : Double;
//                          nAgrQtdBuy, nAgrQtdSell : Int64;
//                          nAgrNegBuy, nAgrNegSell : Cardinal;
//                                          sAjuste : Double;
//                                        nContOpen : Int64;
//                                          bIsEdit : Char) stdcall; forward;

procedure NewDailyCallback      (rAssetID : TAssetIDRec; pwcDate : PWideChar; sOpen, sHigh, sLow, sClose, sVol, sAjuste, sMaxLimit, sMinLimit, sVolBuyer, sVolSeller : Double; nQtd, nNegocios, nContratosOpen, nQtdBuyer, nQtdSeller, nNegBuyer, nNegSeller : Integer) stdcall; forward;


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

procedure HistoryTradeCallback  (rAssetID : TAssetIDRec;
                                  pwcDate : PWideChar;
                             nTradeNumber : Cardinal;
                             sPrice, sVol : Double;
  nQtd, nBuyAgent, nSellAgent, nTradeType : Integer) stdcall; forward;

procedure TinyBookCallback  (rAssetID  : TAssetIDRec;
                             sPrice    : Double;
                           nQtd, nSide : Integer) stdcall; forward;

function ColorDistance(C1, C2: Integer): Single;

////////////////////////////////////////////////////////////////////////////////
// Functions
////////////////////////////////////////////////////////////////////////////////
// General
procedure CopyMemoryToStr(var strDest: String; Source: Pointer; Length: NativeUInt);

function DLLInitializeLogin(
    const pwcActivationKey  : PWideChar;
    const pwcUser           : PWideChar;
    const pwcPassword       : PWideChar;
    StateCallback           : TStateCallback;
    HistoryCallback         : THistoryCallback;
    OrderChangeCallback     : TOrderChangeCallback ;
    AccountCallback         : TAccountCallback;
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
// Configs
function SetAdjustHistoryCallback     (AdjustHistory : TAdjustHistoryCallback) : ShortInt; stdcall; forward;
external 'ProfitDLL.dll';
function SetEnabledHistOrder          (nEnabled : Integer): ShortInt; stdcall;
external 'ProfitDLL.dll';
function SetEnabledLogToDebug         (nEnabled : Integer): ShortInt; stdcall;
external 'ProfitDLL.dll';
function SetChangeCotationCallback    (ChangeCotation : TChangeCotation): ShortInt; stdcall;
external 'ProfitDLL.dll';
function SetChangeStateTickerCallback (ChangeState : TChangeStateTicker): ShortInt; stdcall;
external 'ProfitDLL.dll';
function SetAssetListCallback         (AssetListCallback : TAssetListCallback) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function SetAssetListInfoCallback     (AssetListInfoCallback : TAssetListInfoCallback) : ShortInt; stdcall;
external 'ProfitDLL.dll';

////////////////////////////////////////////////////////////////////////////////
// Market Data
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
function GetSerieHistory            (const pwcTicker : PWideChar; const pwcBolsa : PWideChar; dtDateStart, dtDateEnd : PWideChar; const nQuoteNumberStart, nQuoteNumberEnd : Cardinal) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function GetAllTicker          (const pwcBolsa : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
function RequestTickerInfo     (const pwcTicker : PWideChar; const pwcBolsa : PWideChar) : ShortInt; stdcall;
external 'ProfitDLL.dll';
////////////////////////////////////////////////////////////////////////////////
// Roteamento
function SendBuyOrder(pwcIDAccount, pwcIDCorretora, sSenha, pwcTicker, pwcBolsa : PWideChar;  nPrice : Double; nAmount : integer) : Int64; stdcall;
external 'ProfitDLL.dll';
function SendSellOrder(pwcIDAccount, pwcIDCorretora, sSenha, pwcTicker, pwcBolsa  : PWideChar;  nPrice : Double; nAmount : integer) : Int64; stdcall;
external 'ProfitDLL.dll';
function SendChangeOrder(pwcIDAccount, pwcIDCorretora, sSenha, pwcstrClOrdID : PWideChar; nPrice : Double ; nAmount : Integer) : ShortInt; stdcall; forward;
external 'ProfitDLL.dll';
function SendCancelOrder (pwcIDAccount, pwcIDCorretora, pwcClOrdId, pwcSenha: PWideChar ): ShortInt; stdcall; forward;
external 'ProfitDLL.dll';
function SendCancelOrders(pwcIDAccount, pwcIDCorretora, pwcSenha, pwcTicker,pwcBolsa: PWideChar ): ShortInt; stdcall; forward;
external 'ProfitDLL.dll';
function SendCancelAllOrders (pwcIDAccount, pwcIDCorretora, pwcSenha: PWideChar ): ShortInt; stdcall; forward;
external 'ProfitDLL.dll';
function SendZeroPosition(pwcIDAccount, pwcIDCorretora, pwcTicker, pwcBolsa, pwcSenha: PWideChar; sPrice: Double): Int64;  stdcall; forward;
external 'ProfitDLL.dll';
function GetAccount : ShortInt; stdcall; forward;
external 'ProfitDLL.dll';
function GetOrders(pwcIDAccount, pwcIDCorretora, dtStart, dtEnd : PWideChar) : ShortInt; stdcall; forward;
external 'ProfitDLL.dll';
function GetOrder( pwcClOrdId : PWideChar ): ShortInt; stdcall; forward;
external 'ProfitDLL.dll';
function GetOrderProfitID(nProfitId : Int64): ShortInt stdcall; forward;
external 'ProfitDLL.dll';
function GetPosition(pwcIDAccount, pwcIDCorretora,  pwcTicker, pwcBolsa: PWideChar ): Pointer; stdcall; forward;
external 'ProfitDLL.dll';
function FreePointer(pPointer :Pointer; nStart : Integer): ShortInt ;stdcall; forward;
external 'ProfitDLL.dll';
function SendStopBuyOrder(pwcIDAccount, pwcIDCorretora, sSenha, pwcTicker,pwcBolsa : PWideChar; sPrice, sStopPrice: Double; nAmount: integer ): Int64; stdcall; forward;
external 'ProfitDLL.dll';
function SendStopSellOrder(pwcIDAccount, pwcIDCorretora, sSenha, pwcTicker,pwcBolsa: PWideChar; sPrice, sStopPrice : Double; nAmount: integer ): Int64; stdcall; forward;
external 'ProfitDLL.dll';
function SetDayTrade(bUseDayTrade : Integer ): ShortInt ;stdcall; forward;
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
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
constructor TMainForm.Create(AOwner : TComponent);
begin
  inherited;
  slst_SubscribedTickers := TStringList.Create;
  slst_SubscribedTickers2 := TStringList.Create;
  slst_SubscribedTickers3 := TStringList.Create;
end;

//******************************************************************************
//
//       Nome: Destroy
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
destructor TMainForm.Destroy;
begin
  slst_SubscribedTickers.Free;
  slst_SubscribedTickers2.Free;
  slst_SubscribedTickers3.Free;
  DLLFinalize;
  inherited;
end;

//******************************************************************************
//
//       Nome: FormCreate
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.FormCreate(Sender: TObject);

begin
  m_Count        := 0;
  m_lstOfferBuy  := TList.Create;
  m_lstOfferSell := TList.Create;

  m_lstPriceBuy  := TList.Create;
  m_lstPriceSell := TList.Create;

  m_ExecGo := True;

  dateStart.Date := Now;
  dateEnd.Date := Now;

  dateHistoryStart.Date := Today;
  dateHistoryEnd.Date := Today;
end;

//******************************************************************************
//
//       Nome: GridOrderCellClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.GridOrderCellClick(Sender: TObject; ACol, ARow: Integer);
begin
  if (GridOrder.SelectedRow>-1) then
    edtGetOrder.Text := GridOrder.Cell[7, GridOrder.SelectedRow].AsString;
end;

//******************************************************************************
//
//       Nome: btnBuyClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnAssetInfoClick(Sender: TObject);
begin
  if edtTickerAssetInfo.Text <> ''
    then RequestTickerInfo(PWideChar(edtTickerAssetInfo.Text), PWideChar(cbBolsaAssetInfo.Text))
    else GetAllTicker(PWideChar(cbBolsaAssetInfo.Text));
end;

procedure TMainForm.btnBuyClick(Sender: TObject);
var
  nRes          : Int64;
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    nRes := SendBuyOrder(pwcIdAccount, pwcIdCorretora, PWideChar(edtSenha.Text),PWideChar(edtTickerRot.Text),
                        PWideChar(cbbBolsa.Text), StrToFloat(edtPrice.Text) , StrToInt(edtAmount.Text));

    if (nRes <> NL_ERR_INVALID_ARGS) or (nRes <> NL_ERR_INTERNAL_ERROR) or (nRes <> NL_ERR_INIT) then
      ShowMessage('ProfitID ' + IntToStr(nRes)  + '!')
    else
      ShowMessage('Could not from ' + edtTickerRot.Text  + '!');
  end;
end;

//******************************************************************************
//
//       Nome: btnInterfaceClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnInterfaceClick(Sender : TObject);
var
  nRes : ShortInt;
begin
  nRes := DLLInitializeLogin(
    PWideChar(edtCode.Text),
    PWideChar(edtUser.Text),
    PWideChar(edtAccPassword.Text),
    StateCallback, 
    HistoryCallback,
    OrderChangeCallback,
    AccountCallback,
    NewTradeCallback,
    NewDailyCallback,
    PriceBookCallback,
    OfferBookCallback,
    HistoryTradeCallback,
    ProgressCallback,
    TinyBookCallback);

  if (nRes <> NL_OK) then
    ShowMessage('Could not initialize!')
  else
    begin
      SetEnabledHistOrder(0);
      SetAdjustHistoryCallback(AdjustHistoryCallback);
      SetChangeStateTickerCallback(ChangeStateTicker);
      SetChangeCotationCallback(ChangeCotation);
      SetAssetListCallback(AssetListCallback);
      SetAssetListInfoCallback(AssetListInfoCallback);
    end;
end;


//******************************************************************************
//
//       Nome: btnModificaClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnModificaClick(Sender: TObject);
var
  nRes          : ShortInt;
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    nRes := SendChangeOrder(pwcIdAccount, pwcIdCorretora, PWideChar(edtSenha.Text),
      PWideChar( GridOrder.Cell[7, GridOrder.SelectedRow].AsString ), StrToFloat(edtPrice.Text) , StrToInt(edtAmount.Text));
   if (nRes = NL_OK) then
      ShowMessage('ClId ' + IntToStr(nRes)  + '!')
    else
      ShowMessage('Could not from ' + edtTickerRot.Text  + '!');
  end;
end;


//******************************************************************************
//
//       Nome: btnSellClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnSellClick(Sender: TObject);
var
  nRes          : Int64;
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    nRes := SendSellOrder(pwcIdAccount, pwcIdCorretora, PWideChar(edtSenha.Text),PWideChar(edtTickerRot.Text),
                 PWideChar(cbbBolsa.Text), StrToFloat(edtPrice.Text) ,StrToInt(edtAmount.Text));
    if (nRes <> NL_ERR_INVALID_ARGS) or (nRes <> NL_ERR_INTERNAL_ERROR) or (nRes <> NL_ERR_INIT) then
      ShowMessage('ProfitID ' + IntToStr(nRes)  + '!')
    else
      ShowMessage('Could not from ' + edtTickerRot.Text  + '!');
  end;
end;

//******************************************************************************
//
//       Nome: btnStopBuyClick
//  Descrição: Envia ordem stop de compra
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnStopBuyClick(Sender: TObject);
var
  nRes          : Int64;
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    nRes := SendStopBuyOrder(pwcIdAccount, pwcIdCorretora, PWideChar(edtSenha.Text),PWideChar(edtTickerRot.Text),
                 PWideChar(cbbBolsa.Text), StrToFloat(edtPrice.Text), StrToFloat(edtStopPrice.Text), StrToInt(edtAmount.Text));
    if (nRes <> NL_ERR_INVALID_ARGS) or (nRes <> NL_ERR_INTERNAL_ERROR) or (nRes <> NL_ERR_INIT) then
      ShowMessage('ProfitID ' + IntToStr(nRes)  + '!')
    else
      ShowMessage('Could not from ' + edtTickerRot.Text  + '!');
  end;
end;

//******************************************************************************
//
//       Nome: btnStopSellClick
//  Descrição: Envia ordem stop de venda
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnStopSellClick(Sender: TObject);
var
  nRes          : Int64;
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    nRes := SendStopSellOrder(pwcIdAccount, pwcIdCorretora, PWideChar(edtSenha.Text),PWideChar(edtTickerRot.Text),
                 PWideChar(cbbBolsa.Text), StrToFloat(edtPrice.Text), StrToFloat(edtStopPrice.Text), StrToInt(edtAmount.Text));
    if (nRes <> NL_ERR_INVALID_ARGS) or (nRes <> NL_ERR_INTERNAL_ERROR) or (nRes <> NL_ERR_INIT) then
      ShowMessage('ProfitID ' + IntToStr(nRes)  + '!')
    else
      ShowMessage('Could not from ' + edtTickerRot.Text  + '!');
  end;
end;

//******************************************************************************
//
//       Nome: btnLoadOrderClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnLoadOrderClick(Sender: TObject);
var
  retorno       : ShortInt;
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    GridOrder.ClearRows;
    retorno := GetOrders(pwcIdAccount, pwcIdCorretora, PWideChar(DateToStr(dateStart.Date)), PWideChar(DateToStr(dateEnd.Date)));
  end;
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
procedure TMainForm.btnGetTradesHistoryClick(Sender: TObject);
begin
  GetSerieHistory(PWideChar(Edit4.Text), PWideChar(cbbBolsa1.Text), PWideChar(DateToStr(dateHistoryStart.Date) + ' ' + TimeToStr(dateHistoryEnd.Time)), PWideChar(DateToStr(IncDay(dateHistoryStart.Date))), 0, 0);
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
procedure TMainForm.Button1Click(Sender: TObject);
var
  nRes    : ShortInt;
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    nRes := SendCancelOrder(pwcIdAccount, pwcIdCorretora,  PWideChar( GridOrder.Cell[7, GridOrder.SelectedRow].AsString ) , PWideChar(edtSenha.Text) );
    if (nRes = NL_OK) then
      ShowMessage('ProfitID ' + IntToStr(nRes)  + '!')
    else
      ShowMessage('Could not from ' + edtTickerRot.Text  + '!');
  end;
end;

//******************************************************************************
//
//       Nome: btnZerarClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnZerarClick(Sender: TObject);
var
  nRes          : Int64;
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    nRes := SendZeroPosition(pwcIdAccount,pwcIdCorretora, PWideChar(edtTickerRot.Text),PWideChar(cbbBolsa.Text), PWideChar(edtSenha.Text), strToFloat(edtPrice.Text));
    if not (nRes in [NL_ERR_INVALID_ARGS, NL_ERR_INTERNAL_ERROR, NL_ERR_INIT]) then
      ShowMessage('ProfitID ' + IntToStr(nRes)  + '!')
    else
      ShowMessage('Could not from ' + edtTickerRot.Text  + '! (' + IntToStr(nRes) + ')');
  end;
end;


//******************************************************************************
//
//       Nome: Button3Click
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnGetPositionClick(Sender: TObject);
var
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
  pwcRetorno2   : PByteArray;
  index: Integer;
begin
  for index := 0 to 2000 do
    begin
      aux2           := SplitString(cbbAccount.Text, ',');
      if(Length(aux2)= 4) then
      begin
        pwcIdAccount   := PWideChar(aux2[0]);
        pwcIdCorretora := PWideChar(aux2[2]);
        pwcRetorno2     := GetPosition(pwcIdAccount,pwcIdCorretora, PWideChar(edtTickerRot.Text), PWideChar(cbbBolsa.Text));
        try
          GridPosition.ClearRows;
          DescriptaPositionArray(pwcRetorno2);
        except
        end;
      end;
    end;
end;

//******************************************************************************
//
//       Nome: Button11Click
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.Button11Click(Sender: TObject);
var
  Offer : PGroupOffer;
begin
  if (StrToInt(edtMonitor.Text) < m_lstOfferBuy.Count) and (StrToInt(edtMonitor.Text) >= 0) then
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
end;

//******************************************************************************
//
//       Nome: Button12Click
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.Button12Click(Sender: TObject);
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
end;

//******************************************************************************
//
//       Nome: DescriptaPositionArray
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.DescriptaPositionArray(pRetorno : Pointer);
var
  nQtd      : Integer;
  nTam      : Integer;
  nIndex    : Integer;
  nStart    : Integer;
  strAux    : String;
  strCombo  : String;
  nLength   : Word;
  pBuffer   : PByteArray;
begin
  pBuffer := pRetorno;
  nQtd    := pBuffer[0];
  nTam    := PInteger(@pBuffer[4])^;
  nStart  := 8;
  for nIndex := 0 to nQtd - 1 do
    begin
      GridPosition.InsertRow(0);
      //////////////////////////////////////////////////////////////////
      // Copia a ID corretora
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;
      GridPosition.Cell[2, 0].AsString  := strAux;

      //////////////////////////////////////////////////////////////////
      // Copia a string de Conta
      nLength := PWord(@pBuffer[nStart])^;;
      nStart  := nStart + 2;

      SetLength(strAux, nLength);
      if nLength > 0 then
        CopyMemoryToStr(strAux, @pBuffer[nStart], nLength);
      strCombo := strAux;
      nStart := nStart + nLength;
      GridPosition.Cell[0, 0].AsString  := strCombo;

      //////////////////////////////////////////////////////////////////
      // Copia a string do Titular
      nLength := PWord(@pBuffer[nStart])^;;
      nStart  := nStart + 2;

      SetLength(strAux, nLength);
      if nLength > 0 then
        CopyMemoryToStr(strAux, @pBuffer[nStart], nLength);
      strCombo := strAux;
      nStart := nStart + nLength;
      GridPosition.Cell[1, 0].AsString  := strCombo;

      //////////////////////////////////////////////////////////////////
      // Copia a string do Ticker
      nLength := PWord(@pBuffer[nStart])^;;
      nStart  := nStart + 2;

      SetLength(strAux, nLength);
      if nLength > 0 then
        CopyMemoryToStr(strAux, @pBuffer[nStart], nLength);
      strCombo := strAux;
      nStart := nStart + nLength;
      GridPosition.Cell[3, 0].AsString  := strCombo;

      //////////////////////////////////////////////////////////////////
      // Copia TodayPosition nQtd
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;
      GridPosition.Cell[4, 0].AsString  := strAux;

      //////////////////////////////////////////////////////////////////
      // Copia TodayPosition sPrice
      strAux := FloatToStr(PDouble(@pBuffer[nStart])^);
      nStart := nStart + 8;
      GridPosition.Cell[5, 0].AsString  := strAux;

      //utilizado no Day
      //////////////////////////////////////////////////////////////////////
      // Salva SellAvgPriceToday
      strAux := FloatToStr(PDouble(@pBuffer[nStart])^);
      nStart := nStart + 8;

      //////////////////////////////////////////////////////////////////////
      // Salva SellQtdToday
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;

      //////////////////////////////////////////////////////////////////////
      // Salva BuyAvgPriceToday
      strAux := FloatToStr(PDouble(@pBuffer[nStart])^);
      nStart := nStart + 8;


      //////////////////////////////////////////////////////////////////////
      // Salva BuyQtdToday
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;

      //Custodia
      //////////////////////////////////////////////////////////////////////
      // Salva Quantidade em D+1
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;

      //////////////////////////////////////////////////////////////////////
      // Salva Quantidade em D+2
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;

      //////////////////////////////////////////////////////////////////////
      // Salva Quantidade em D+3
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;

      //////////////////////////////////////////////////////////////////////
      // Salva Quantidade bloqueada
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;

      //////////////////////////////////////////////////////////////////////
      // Salva Quantidade Pending
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;

      //////////////////////////////////////////////////////////////////////
      // Salva Quantidade alocada
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;
      GridPosition.Cell[6, 0].AsString  := strAux;

      //////////////////////////////////////////////////////////////////////
      // Salva Quantidade provisionada
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;
      GridPosition.Cell[7, 0].AsString  := strAux;

      //////////////////////////////////////////////////////////////////////
      // Salva Quantidade da posição
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;
      GridPosition.Cell[8, 0].AsString  := strAux;

      //////////////////////////////////////////////////////////////////////
      // Salva Quantidade Disponível
      strAux := IntToStr(PInteger(@pBuffer[nStart])^);
      nStart := nStart + 4;
      GridPosition.Cell[9, 0].AsString  := strAux;
   end;
   FreePointer(pRetorno,nTam);
end;

//******************************************************************************
//
//       Nome: Button4Click
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnClearAdjustHistoryClick(Sender: TObject);
begin
  MemoAdjustHistory.Lines.Clear;
end;

procedure TMainForm.btnGetOrderClick(Sender: TObject);
var
  retorno : ShortInt;
begin
  GridOrder.ClearRows;
  retorno := GetOrder( PWideChar(edtGetOrder.Text) );
end;

//******************************************************************************
//
//       Nome: Button5Click
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.Button5Click(Sender: TObject);
var
  nRes : ShortInt;
begin
  nRes := DLLFinalize;
  if (nRes <> NL_OK) then
    ShowMessage('Finalize!');
end;

//******************************************************************************
//
//       Nome: Button6Click
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.Button6Click(Sender: TObject);
var
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
  nRes          : Integer;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    nRes := SendCancelAllOrders(pwcIdAccount, pwcIdCorretora, PWideChar(edtSenha.Text) );
    if (nRes = NL_OK) then
      ShowMessage('ClId ' + IntToStr(nRes)  + '!')
    else
      ShowMessage('Could not from ' + edtTickerRot.Text  + '!');
  end;
end;


//******************************************************************************
//
//       Nome: Button7Click
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.Button7Click(Sender: TObject);
var
  pwcIdAccount  : PWideChar;
  pwcIdCorretora: PWideChar;
  aux2          : TStringDynArray ;
  nRes          : Integer;
begin
  aux2           := SplitString(cbbAccount.Text, ',');
  if(Length(aux2)= 4) then
  begin
    pwcIdAccount   := PWideChar(aux2[0]);
    pwcIdCorretora := PWideChar(aux2[2]);
    nRes := SendCancelOrders(pwcIdAccount, pwcIdCorretora, PWideChar(edtSenha.Text), PWideChar(edtTickerRot.Text),PWideChar(cbbBolsa.Text) );
    if (nRes <> NL_OK) then
      ShowMessage('Could not from ' + edtTickerRot.Text  + '!')
    else
      ShowMessage('ClId ' + IntToStr(nRes)  + '!');
  end;
end;


//******************************************************************************
//
//       Nome: cbbGetAccountClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.cbbGetAccountClick(Sender: TObject);
var
  pwcRetorno2   : ShortInt;
begin
  cbbAccount.Clear;
  pwcRetorno2 := GetAccount;
end;

//******************************************************************************
//
//       Nome: cbDayTradeClick
//  Descrição:
//
//
//
//******************************************************************************
procedure TMainForm.cbDayTradeClick(Sender: TObject);
var
  nResult : Integer;
begin
  if cbDayTrade.Checked
    then nResult := SetDayTrade(1)   // True
    else nResult := SetDayTrade(0);  // False

  //Falha na tentativa de alterar para DayTrade
  if nResult = NL_ERR_INIT then
    ShowMessage('Inicialize a DLL');
end;

//******************************************************************************
//
//       Nome: SetConnectionReady
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.SetConnectionReady(nError : Integer);
begin
  b_Connected := True;

  if (nError <> 0) then
    begin
      pnlLogin.Caption := 'Login Connected - ERROR:(' + IntToStr(nError) + ')';
      pnlLogin.Color := clYellow;
    end
  else
    begin
      pnlLogin.Caption := 'Login Connected';
      pnlLogin.Color := clGreen;
    end;

  if ColorDistance(pnlLogin.Color, clWhite) < ColorDistance(pnlLogin.Color, clBlack)
    then pnlLogin.Font.Color := clBlack
    else pnlLogin.Font.Color := clWhite;
end;


//******************************************************************************
//
//       Nome: SetConnectionFailed
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.SetConnectionFailed;
begin
  b_Connected := False;

  pnlLogin.Caption := 'Logoff';
  pnlLogin.Color := clRed;

  if ColorDistance(pnlLogin.Color, clWhite) < 0.5
    then pnlLogin.Font.Color := clBlack
    else pnlLogin.Font.Color := clWhite;
end;


//******************************************************************************
//
//       Nome: OrderChangeCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure OrderChangeCallback(                                       rAssetID  : TAssetIDRec;
                              nCorretora , nQtd, nTradedQtd, nLeavesQtd, nSide : Integer;
                                                 sPrice, sStopPrice, sAvgPrice : Double;
                                                                     nProfitID : Int64;
                 TipoOrdem, Conta, Titular, ClOrdID, Status, Date, TextMessage : PWideChar) stdcall;
begin
  with MainForm do
    begin
      with GridOrder do
        begin
          InsertRow(0);
          Cell[0, 0].AsString  := Conta;
          Cell[1, 0].AsString  := Titular;
          Cell[2, 0].AsString  := IntToStr(nCorretora);
          Cell[3, 0].AsString  := FloatToStr(sPrice);
          Cell[4, 0].AsString  := Status;
          Cell[5, 0].AsString  := IntToStr(nQtd);
          Cell[6, 0].AsString  := FloatToStr(sAvgPrice);
          Cell[7, 0].AsString  := ClOrdID;
          Cell[8, 0].AsString  := IntToStr(nProfitID);
          Cell[9, 0].AsString  := Date;
          Cell[10, 0].AsString := IntToStr(nSide);
          Cell[11, 0].AsString := TextMessage;
          Cell[12, 0].AsString := IntToStr(nTradedQtd);
          Cell[13, 0].AsString := IntToStr(nLeavesQtd);
        end;
    end;
end;


//******************************************************************************
//
//       Nome: AccountCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure AccountCallback(nCorretora : Integer;
    CorretoraNomeCompleto, AccountID, NomeTitular : PWideChar) stdcall;
begin
  MainForm.cbbAccount.Items.Add(AccountID+','+NomeTitular+','+IntToStr(nCorretora)+','+CorretoraNomeCompleto);
end;


//******************************************************************************
//
//       Nome: StateCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure StateCallback(nConnStateType , nResult : Integer) stdcall;
begin
  if (nConnStateType = Ord(connStLogin)) then
    begin
      if nResult = Ord(connArLoginInvalid) then
        MainForm.SetConnectionFailed
      else
        MainForm.SetConnectionReady(Ord(nResult));
    end;
  if (nConnStateType = Ord(connStActv)) then
    begin
      if (nResult = Ord(connArSuccess))  then
        begin
          MainForm.pnlActivate.Caption  := 'Ativado';
          MainForm.pnlActivate.Color  := clGreen
        end
      else
        begin
          MainForm.pnlActivate.Caption  := 'Desativado';
          MainForm.pnlActivate.Color := clPurple;
        end;
    end;
  if (nConnStateType = Ord(connStBroker)) then
    begin
      if (nResult = Ord(connHcsConnected)) or (nResult = Ord(connHcsBrokerConnected))  then
        begin
          MainForm.pnlRot.Caption  := 'Roteamento Connectado';
          MainForm.pnlRot.Color  := clGreen
        end
      else
        begin
          MainForm.pnlRot.Caption  := 'Roteamento Desconectado';
          MainForm.pnlRot.Color := clPurple;
        end;
    end;
  if (nConnStateType = Ord(connStMarket)) then
    begin
      if (nResult = Ord(conncsConnectedLogged))  then
        begin
          MainForm.pnlMarket.Caption  := 'MarketData Connectado';
          MainForm.pnlMarket.Color     := clGreen
        end
      else
        begin
          MainForm.pnlMarket.Caption  := 'MarketData Desconectado';
          MainForm.pnlMarket.Color := clPurple;
        end;
    end;

  if ColorDistance(MainForm.pnlActivate.Color, clWhite) < ColorDistance(MainForm.pnlActivate.Color, clBlack)
    then MainForm.pnlActivate.Font.Color := clBlack
    else MainForm.pnlActivate.Font.Color := clWhite;

  if ColorDistance(MainForm.pnlRot.Color, clWhite) < ColorDistance(MainForm.pnlRot.Color, clBlack)
    then MainForm.pnlRot.Font.Color := clBlack
    else MainForm.pnlRot.Font.Color := clWhite;

  if ColorDistance(MainForm.pnlMarket.Color, clWhite) < ColorDistance(MainForm.pnlMarket.Color, clBlack)
    then MainForm.pnlMarket.Font.Color := clBlack
    else MainForm.pnlMarket.Font.Color := clWhite;
end;


//******************************************************************************
//
//       Nome: btnGoClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnUnsubMiniBookClick(Sender : TObject);
var
  nIndex : Integer;
  strTicker : string;
  nRes : ShortInt;
  bClear : LongBool;
begin
  bClear := True;
  m_ExecGo := False;
  if (Sender = btnUnsubTrade) then
    begin
      for nIndex := 0 to slst_SubscribedTickers.Count - 1 do
        begin
          strTicker := slst_SubscribedTickers[nIndex];
          nRes := UnsubscribeTicker(PWideChar(edtTicker.Text), PWideChar(cbbBolsa1.Text));

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
    end;
  if (Sender = btnUnsubMiniBook) then
    begin
      for nIndex := 0 to slst_SubscribedTickers.Count - 1 do
        begin
          strTicker := slst_SubscribedTickers3[nIndex];
          nRes := UnSubscribePriceBook(PWideChar(Edit3.Text), PWideChar(Edit8.Text));

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
            ListBox2.Clear;
          end;
    end;

    if (Sender = btnUnsubBook) then
      begin
        for nIndex := 0 to slst_SubscribedTickers2.Count - 1 do
          begin
            strTicker := slst_SubscribedTickers2[nIndex];
            nRes := UnsubscribeOfferBook(PWideChar(Edit2.Text), PWideChar(Edit6.Text));

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
              slst_SubscribedTickers2.Clear;
              ListBox1.Clear;
            end;
      end;

end;

//******************************************************************************
//
//       Nome: btnSubscribeClick
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.btnSubMiniBookClick(Sender : TObject);
var
  nRes : ShortInt;
begin
  if m_MainCanSet then
    begin
      // 0 = False
      //SetEnabledLogToDebug(0);
      //SetChangeCotationCallback(ChangeCotation);
      //SetAssetListCallback(AssetListCallback);
      //SetChangeStateTickerCallback(ChangeStateTicker);
      //SetAdjustHistoryCallback(AdjustHistoryCallback);
      m_MainCanSet := False;
    end;

  nRes  := NL_ERR_INVALID_ARGS;

  if (Sender = btnSubMiniBook) and (Edit3.Text <> '') then
    begin
      if (slst_SubscribedTickers3.IndexOf(Edit3.Text) < 0)then
        begin
          nRes := SubscribePriceBook(PWideChar(Edit3.Text), PWideChar(Edit8.Text));
          if (nRes = NL_OK) then
            begin
              slst_SubscribedTickers3.add(Edit3.Text);
              ListBox2.Items.Add(Edit3.Text);
            end;
        end;
    end
  else if (Sender = btnSubBook) and (Edit2.Text<>'')then
    begin
      if (slst_SubscribedTickers2.IndexOf(Edit2.Text) < 0)then
        begin
          nRes := SubscribeOfferBook(PWideChar(Edit2.Text), PWideChar(Edit6.Text));
          if (nRes = NL_OK) then
            begin
              slst_SubscribedTickers2.add(Edit2.Text);
              ListBox1.Items.Add(Edit2.Text);
            end;
        end;
    end
  else if (Sender = btnSubTrade) and (edtTicker.Text<>'')then
    begin
      if (slst_SubscribedTickers.IndexOf(edtTicker.Text) < 0)then
        begin
          nRes := SubscribeTicker(PWideChar(edtTicker.Text), PWideChar(cbbBolsa2.Text));
          if (nRes = NL_OK) then
            begin
              slst_SubscribedTickers.Add(edtTicker.Text);
              ListBoxSubscribed.Items.Add(edtTicker.Text);
            end;
        end;
    end;

  if (nRes = NL_ERR_INIT) then
    ShowMessage('Please initialize.')
  else if (nRes<>NL_OK) then
    ShowMessage('Could not subscribe!');
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
procedure NewTradeCallback(            rAssetID : TAssetIDRec;
                                        pwcDate : PWideChar;
                                   nTradeNumber : Cardinal;
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

 MainForm.MemoTrades.Text := string(rAssetID.pchTicker) + ' ' + pwcDate + ' (' + IntToStr(nTradeNumber) + ') ' + IntToStr(nQtd) + ' ' + FloatToStr(sPrice)  + ' ' +
                             ' ' + strTradeType;
end;

//******************************************************************************
//
//       Nome: NewQuoteCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure NewQuoteCallback          (rDataSerieID : TDataSerieIDRec;
                                          pwcDate : PWideChar;
               dOpen, dMax, dMin, dClose, sVolume : Double;
                                             nQtd : Int64;
                                        nNegocios : Integer;
                          sAgrVolBuy, sAgrVolSell : Double;
                          nAgrQtdBuy, nAgrQtdSell : Int64;
                          nAgrNegBuy, nAgrNegSell : Cardinal;
                                          sAjuste : Double;
                                        nContOpen : Int64;
                                          bIsEdit : Char) stdcall;
var
  strType : String;
begin
  case rDataSerieID.Level of
    0  : strType := 'Trade';
    1  : strType := 'Minute';
    2  : strType := 'Daily';
    3  : strType := 'Weekly';
    4  : strType := 'Monthly';
    5  : strType := 'Yearly';
    6  : strType := 'Aggressor';
    7  : strType := 'Lote';
    8  : strType := 'Variation';
    9  : strType := 'Inversion';
    10 : strType := 'Qtd';
    11 : strType := 'Renko';
    12 : strType := 'Range';
    13 : strType := 'PointFigure';
    14 : strType := 'KagiChart';
    16 : strType := 'VarInv';
    17 : strType := 'Second';
  else
    strType := 'None';
  end;

  MainForm.MemoTrades.Text := string(rDataSerieID.pchTicker) + ' ' +  strType + ' ' + string(rDataSerieID.Offset) + ' ' + pwcDate + ' ' +
    FloatToStr(dOpen)   + ' ' +
    FloatToStr(dMax)    + ' ' +
    FloatToStr(dMin)    + ' ' +
    FloatToStr(dClose)  + ' ' +
    FloatToStr(sVolume) + ' ' +
    IntToStr(nQtd)      + ' ' +
    IntToStr(nNegocios);
end;

//******************************************************************************
//
//       Nome: TinyBookCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TinyBookCallback  (rAssetID  : TAssetIDRec;
                             sPrice    : Double;
                           nQtd, nSide : Integer) stdcall;
begin
  if nSide = 0
    then MainForm.memoTinnyBuy.Text  := string(rAssetID.pchTicker) + ' ' + FloatToStrF(sPrice, ffCurrency, 6, 2) + ' ' + IntToStr(nQtd)
    else MainForm.memoTinnySell.Text := string(rAssetID.pchTicker) + ' ' + FloatToStrF(sPrice, ffCurrency, 6, 2) + ' ' + IntToStr(nQtd);
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
procedure HistoryTradeCallback  (rAssetID : TAssetIDRec; pwcDate : PWideChar; nTradeNumber : Cardinal; sPrice, sVol : Double; nQtd, nBuyAgent, nSellAgent, nTradeType : Integer) stdcall;
var
  strTradeType : String;
begin
  try
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
    MainForm.MemoCalback.Text := string(rAssetID.pchTicker) + ' ' + pwcDate + ' (' + IntToStr(nTradeNumber) + ') ' + IntToStr(nQtd) + ' ' + FloatToStr(sPrice)  + ' ' + strTradeType;
  except
    On E : Exception do
      begin
        strTradeType := 'Erro';
      end;
  end;
end;

//******************************************************************************
//
//       Nome: NewDailyCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure NewDailyCallback(rAssetID : TAssetIDRec; pwcDate : PWideChar; sOpen, sHigh, sLow, sClose, sVol, sAjuste, sMaxLimit, sMinLimit, sVolBuyer, sVolSeller : Double; nQtd, nNegocios, nContratosOpen, nQtdBuyer, nQtdSeller, nNegBuyer, nNegSeller : Integer) stdcall;
begin
    MainForm.MemoDaily.Text := ( string(rAssetID.pchTicker)+ ' '+
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
//       Nome: HistoryCallback
//  Descrição:
//
//    Criação:
// Modificado:
//
//******************************************************************************
procedure HistoryCallback    (                                       rAssetID  : TAssetIDRec;
                              nCorretora , nQtd, nTradedQtd, nLeavesQtd, nSide : Integer;
                                                 sPrice, sStopPrice, sAvgPrice : Double;
                                                                     nProfitID : Int64;
                              TipoOrdem, Conta, Titular, ClOrdID, Status, Date : PWideChar) stdcall;
begin
  with MainForm do
    begin
      with GridOrder do
      begin
        InsertRow(0);
        Cell[0 , 0].AsString  := Conta;
        Cell[1 , 0].AsString  := Titular;
        Cell[2 , 0].AsString  := IntToStr(nCorretora);
        Cell[3 , 0].AsString  := FloatToStr(sPrice);
        Cell[4 , 0].AsString  := Status;
        Cell[5 , 0].AsString  := IntToStr(nQtd);
        Cell[6 , 0].AsString  := FloatToStr(sAvgPrice);
        Cell[7 , 0].AsString  := ClOrdID;
        Cell[8 , 0].AsString  := IntToStr(nProfitID);
        Cell[9 , 0].AsString  := Date;
        Cell[10, 0].AsString  := IntToStr(nSide);
//        Cell[11, 0].AsString  := TextMessage;
        Cell[12, 0].AsString  := IntToStr(nTradedQtd);
        Cell[13, 0].AsString  := IntToStr(nLeavesQtd);
      end;
    end;
end;



//******************************************************************************
//
//       Nome: PriceBookCallback
//  Descrição:
//
//    Criação:
// Modificado:
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
  with MainForm do
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
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.DescriptaPriceArray(pRetorno : Pointer; lstPrice : TList);
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
//    Criação:
// Modificado:
//
//******************************************************************************
procedure OfferBookCallback(                       rAssetID : TAssetIDRec ;
                     nAction, nPosition, Side, nQtd, nAgent : Integer;
                                                   nOfferID : Int64;
                                                     sPrice : Double;
       bHasPrice, bHasQtd, bHasDate, bHasOfferID, bHasAgent : Char;
                                                   pwcDate  : PWideChar;
                                      pArraySell, pArrayBuy : Pointer
                                        ) stdcall;

var
  Offer    : PGroupOffer;
  lstBook  : TList;
  nIndex   : Integer;
begin
with MainForm do
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

      if (nPosition = StrToInt(edtMonitor.Text)) then
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
//    Criação:
// Modificado:
//
//******************************************************************************
procedure TMainForm.DescriptaOfferArray(pRetorno  : Pointer; lstOffer : TList);
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
      Offer.nOfferID := PInt64(@pBuffer[nStart])^;
      nStart         := nStart + 8;

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
//       Nome: CopyMemoryToStr
//  Descrição:
//
//    Criação:
// Modificado:
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
  MainForm.lblProgress.Caption := 'Progresso: ' + rAssetID.pchTicker + ' ' + IntToStr(nProgress);
  if nProgress = 100 then
    ShowMessage('Progresso Concluido=' + rAssetID.pchTicker);
end;

//******************************************************************************
//
//       Nome: AdjustHistoryCallback
//  Descrição:
//
//
//******************************************************************************
procedure AdjustHistoryCallback (rAssetID : TAssetIDRec; sValue : Double; strAdjustType, strObserv, dtAjuste, dtDeliber, dtPagamento : PWideChar; nAffectPrice : Integer) stdcall;
begin
  MainForm.MemoAdjustHistory.Lines.Insert(0, rAssetID.pchTicker + ' ' + strAdjustType + ' ' + dtAjuste + ' ' + FloatToStr(sValue));
end;

//******************************************************************************
//
//       Nome:
//  Descrição:
//
//
//******************************************************************************
procedure ChangeCotation (rAssetID : TAssetIDRec; pwcDate : PWideChar; nTradeNumber : Cardinal; sPrice : Double) stdcall;
begin
  MainForm.MemoChangeCotation.Text := rAssetID.pchTicker + ' ' + pwcDate + '(' + IntToStr(nTradeNumber) + ') ' + FloatToStr(sPrice);
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
  strState : String;
begin
  case nState of
    0:  strState := 'tsOpened';
    1:  strState := 'tsSuspended';
    2:  strState := 'tsFrozen';
    3:  strState := 'tsInhibited';
    4:  strState := 'tsAuctioned';
    5:  strState := 'tsOpenReprogramed';
    6:  strState := 'tsClosed';
    7:  strState := 'tsUnknown';
    8:  strState := 'tsNightProcess';
    9:  strState := 'tsPreparation';
    10: strState := 'tsPreClosing';
    11: strState := 'tsPromoter';
    12: strState := 'tsEODConsulting';
    13: strState := 'tsPreOpening';
    14: strState := 'tsAfterMarket';
    15: strState := 'tsTrading';
    16: strState := 'tsImpedido';
    17: strState := 'tsBovespa';
    18: strState := 'tsInterrupted';
  else
    strState := 'None';
  end;

  MainForm.MemoAssetState.Text := rAssetID.pchTicker + ' ' + pwcDate + ' ' + strState;
end;

//******************************************************************************
//
//       Nome:
//  Descrição:
//
//
//******************************************************************************
procedure AssetListCallback (rAssetID : TAssetIDRec; pwcName : PWideChar) stdcall;
begin
  if (MainForm.edtTickerAssetInfo.Text = '') or (MainForm.edtTickerAssetInfo.Text = String(rAssetID.pchTicker)) then
    MainForm.MemoAssetInfo.Lines.Add('AssetList: ' + String(rAssetID.pchTicker) + ' Name: ' + String(pwcName));
end;

procedure AssetListInfoCallback (rAssetID  : TAssetIDRec; strName, strDescription : PWideChar; nMinOrderQtd, nMaxOrderQtd, nLote, stSecurityType, ssSecuritySubType : Integer; sMinPriceIncrement, sContractMultiplier : Double; strDate, strISIN : PWideChar); stdcall;
begin
  if (MainForm.edtTickerAssetInfo.Text = '') or (MainForm.edtTickerAssetInfo.Text = String(rAssetID.pchTicker)) then
    MainForm.MemoAssetInfo.Lines.Add('AssetInfo: ' + String(rAssetID.pchTicker) + ' Name: ' + String(strName) + ' ISIN: ' + String(strISIN));
end;

//******************************************************************************
//
//       Nome: ColorDistance
//  Descrição: Verifica a distancia entre as cores
//
//    Criação: 
// Modificado:
//
//******************************************************************************
function ColorDistance(C1, C2: Integer): Single;
const
  WeightR: single = 0.764706;
  WeightG: single = 1.52941;
  WeightB: single = 0.254902;
var
  DR, DG, DB: Integer;
begin
  DR := (C1 and $FF) - (C2 and $FF);
  Result := Sqr(DR * WeightR);
  DG := (C1 shr 8 and $FF) - (C2 shr 8 and $FF);
  Result := Result + Sqr(DG * WeightG);
  DB := (C1 shr 16) - (C2 shr 16);
  Result := Result + Sqr(DB * WeightB);
  Result := SqRt(Result);
end;

end.

