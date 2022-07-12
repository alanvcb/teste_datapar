unit UPagamentoUnico;

interface

uses UAmortizacao;

type TPagamentoUnico = class(TAmortizacao)
  public
    procedure CalculaAmortizacao; override;
end;

implementation

uses System.Math,UPeriodo;


{ TPagamentoUnico }

procedure TPagamentoUnico.CalculaAmortizacao;
var Periodo: TPeriodo;
VL_Anterior,VL_Juros, VL_SaldoDevedor,VL_Amortizacao,VL_Pagamento: Currency;
NO_Periodo: Word;
TaxaJuros: Extended;
begin
  VL_Anterior := VL_Montante;
  VL_Amortizacao := 0;
  VL_Pagamento := 0;

  TaxaJuros := 1+RoundTo(PE_Juros / 100,-4); //17,48% = 0,1748;

  Periodos.Clear;

  //sempre começamos do zero com o montante inicial;
  Periodo := TPeriodo.Create(0,0,0,0,VL_Montante);
  Periodos.Add(Periodo);
  for NO_Periodo := 1 to NO_Periodos do
  begin
    VL_SaldoDevedor := VL_Montante*IntPower(TaxaJuros,NO_Periodo);
    VL_Juros := VL_SaldoDevedor - VL_Anterior;

    //O pagamento é feito unica,exclusiva e totalmente na ultima parcela
    if NO_Periodo = NO_Periodos then
    begin
      VL_Amortizacao := VL_Montante;
      VL_Pagamento := VL_SaldoDevedor;
    end;

    VL_Anterior := VL_SaldoDevedor;

    Periodo := TPeriodo.Create(NO_Periodo,VL_Juros,VL_Amortizacao,VL_Pagamento,VL_SaldoDevedor);
    Periodos.Add(Periodo);
  end;
end;

end.
