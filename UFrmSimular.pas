unit UFrmSimular;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmPadrao, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.ImageList, Vcl.ImgList, Vcl.Grids, Data.DB, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.DBCtrls,UListaPeriodos;

type
  TFrmSimular = class(TfrmPadrao)
    pgcSimulacao: TPageControl;
    tshParametros: TTabSheet;
    Panel1: TPanel;
    Button2: TButton;
    lstSimulacao: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCapital: TEdit;
    edtTaxaJuros: TEdit;
    edtMeses: TEdit;
    cbxForma: TComboBox;
    tshVisualizacao: TTabSheet;
    GroupBox1: TGroupBox;
    lblResumoCapital: TLabel;
    lblResumoTaxaJuros: TLabel;
    lblResumoMeses: TLabel;
    lblResumoForma: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cdsView: TClientDataSet;
    cdsViewNO_Mes: TWordField;
    cdsViewVL_Juros: TCurrencyField;
    cdsViewVL_Amortizacao: TCurrencyField;
    cdsViewVL_Pagamento: TCurrencyField;
    cdsViewVL_SaldoDevedor: TCurrencyField;
    cdsViewVL_TotalJuros: TAggregateField;
    cdsViewVL_TotalAmortizacao: TAggregateField;
    cdsViewVL_TotalPagamentos: TAggregateField;
    dbgView: TDBGrid;
    sView: TDataSource;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edtCapitalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Simular;
    function Validar: Boolean;
    function Calcular(ACapital,AJuros: Currency;AMeses: Word;AForma: Byte): TListaPeriodos;
    procedure Exibir(Resultado: TListaPeriodos);
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  UEditHelper,UMensagem, UAmortizacao, UPagamentoUnico, UConstantes;

{$R *.dfm}

procedure TFrmSimular.Button2Click(Sender: TObject);
begin
  inherited;
  Simular;
end;

function TFrmSimular.Calcular(ACapital, AJuros: Currency; AMeses: Word;
  AForma: Byte): TListaPeriodos;
var Calculo: TAmortizacao;
begin

  case AForma of
    0: Calculo := TPagamentoUnico.Create(AMeses,AJuros,ACapital);
  end;

  try
    Calculo.CalculaAmortizacao;

    lblResumoCapital.Caption := FormatSettings.CurrencyString+' '+FormatFloat(FormatoMonetario ,ACapital);
    lblResumoTaxaJuros.Caption := FormatFloat(FormatoPercentual,AJuros)+' %';
    lblResumoMeses.Caption := IntToStr(AMeses);

    Exibir(Calculo.Periodos);
  finally
    Calculo.DisposeOf;
  end;

end;

procedure TFrmSimular.edtCapitalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
  begin
    key := 0;
    SelectNext(Sender as TWinControl,True,True);
  end;
end;

procedure TFrmSimular.Exibir(Resultado: TListaPeriodos);
Var Idx: Word;
begin
  cdsView.Close;
  cdsView.CreateDataSet;
  cdsView.Open;

  for Idx := 0 to Resultado.Count -1 do
  begin
    cdsView.Append;
    cdsViewNO_Mes.AsInteger := Resultado[Idx].NO_Periodo;
    cdsViewVL_Juros.AsFloat := Resultado[Idx].VL_Juros;
    cdsViewVL_Amortizacao.AsFloat := Resultado[Idx].VL_Amortizacao;
    cdsViewVL_Pagamento.AsFloat := Resultado[Idx].VL_Pagamento;
    cdsViewVL_SaldoDevedor.AsFloat := Resultado[Idx].VL_SaldoDevedor;
    cdsView.Post;
  end;

  pgcSimulacao.ActivePage := tshVisualizacao;
end;

procedure TFrmSimular.FormCreate(Sender: TObject);
begin
  inherited;
  Titulo := 'Simular Financiamento';
  SubTitulo := 'Escolha as opções para simulação';
  edtCapital.AceitarApenasValoresNumericos;
  edtTaxaJuros.AceitarApenasValoresNumericos;
  pgcSimulacao.ActivePage := tshParametros;
  Self.ActiveControl := edtCapital;
end;

procedure TFrmSimular.Simular;
var Capital,TaxaJuros: Currency;
Meses: Word;
Forma: Byte;
begin
  if Validar then
  begin
    Capital := edtCapital.ValorNumerico;
    TaxaJuros := edtTaxaJuros.ValorNumerico;
    Meses := edtMeses.ValorInteiro;
    Forma := cbxForma.ItemIndex;
    SubTitulo := 'Resultado simulação';
    Calcular(Capital,TaxaJuros,Meses,Forma);
  end;
end;

function TFrmSimular.Validar: Boolean;
begin
  Result := False;
  if edtCapital.ValorNumerico = 0 then
  begin
    TMensagem.Erro('Preencha o valor do capital');
    edtCapital.SetFocus;
    Exit;
  end;

  if edtTaxaJuros.ValorNumerico = 0 then
  begin
    TMensagem.Erro('Preencha o valor da taxa de juros');
    edtTaxaJuros.SetFocus;
    Exit;
  end;

  if edtMeses.ValorInteiro = 0 then
  begin
    TMensagem.Erro('Preencha a quantidade de meses');
    edtMeses.SetFocus;
    Exit;
  end;

  if cbxForma.ItemIndex = -1 then
  begin
    TMensagem.Erro('Preencha a forma de amortização');
    cbxForma.SetFocus;
    Exit;
  end;

  Result := True;

end;

initialization
  RegisterClass(TFrmSimular);

end.


