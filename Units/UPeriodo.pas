unit UPeriodo;

interface

type TPeriodo = class
  private
    FVL_Juros: Currency;
    FVL_Pagamento: Currency;
    FVL_Amortizacao: Currency;
    FNO_Periodo: Word;
    FVL_SaldoDevedor: Currency;
  public
    property NO_Periodo: Word read FNO_Periodo write FNO_Periodo;
    property VL_Juros: Currency read FVL_Juros write FVL_Juros;
    property VL_Amortizacao: Currency read FVL_Amortizacao write FVL_Amortizacao;
    property VL_Pagamento: Currency read FVL_Pagamento write FVL_Pagamento;
    property VL_SaldoDevedor: Currency read FVL_SaldoDevedor write FVL_SaldoDevedor;
    constructor Create(const ANO_Periodo: Word;const AVL_Juros,AVL_Amortizacao,
      AVL_Pagamento,AVL_SaldoDevedor: Currency); reintroduce;
end;

implementation
{ TPeriodo }

constructor TPeriodo.Create(const ANO_Periodo: Word;const AVL_Juros,AVL_Amortizacao,
      AVL_Pagamento,AVL_SaldoDevedor: Currency);
begin
  FNO_Periodo := ANO_Periodo;
  FVL_Juros := AVL_Juros;
  FVL_Amortizacao := AVL_Amortizacao;
  FVL_Pagamento := AVL_Pagamento;
  FVL_SaldoDevedor := AVL_SaldoDevedor;
end;

end.
