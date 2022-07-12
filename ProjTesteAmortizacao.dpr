program ProjTesteAmortizacao;

uses
  Vcl.Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {frmPrincipal},
  UFrmPadrao in 'UFrmPadrao.pas' {frmPadrao},
  UFrmSimular in 'UFrmSimular.pas' {FrmSimular},
  UAmortizacao in 'Units\UAmortizacao.pas',
  UEditHelper in 'Units\UEditHelper.pas',
  UListaPeriodos in 'Units\UListaPeriodos.pas',
  UPagamentoUnico in 'Units\UPagamentoUnico.pas',
  UPeriodo in 'Units\UPeriodo.pas',
  UMensagem in 'Units\UMensagem.pas',
  UConstantes in 'Units\UConstantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
