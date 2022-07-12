unit UAmortizacao;

interface

uses UPeriodo,UListaPeriodos;

type TAmortizacao = class
  private
    FNO_Periodos: Word;
    FPE_Juros: Extended;
    FVL_Montante: Currency;
    FListaPeriodos: TListaPeriodos;
  public
    property NO_Periodos: Word read FNO_Periodos write FNO_Periodos;
    property PE_Juros: Extended read FPE_Juros write FPE_Juros;
    property VL_Montante: Currency read FVL_Montante write FVL_Montante;
    property Periodos: TListaPeriodos read FListaPeriodos write FListaPeriodos;
    constructor Create(const ANO_Periodos: Word;const APE_Juros: Extended;const AVL_Montante: Currency); reintroduce;
    destructor Destroy; override;
    procedure CalculaAmortizacao; virtual; abstract;
end;

implementation

{ TAmortizacao }

constructor TAmortizacao.Create(const ANO_Periodos: Word;const APE_Juros: Extended;const AVL_Montante: Currency);
begin
  FNO_Periodos := ANO_Periodos;
  FPE_Juros := APE_Juros;
  FVL_Montante := AVL_Montante;
  FListaPeriodos := TListaPeriodos.Create;
end;

destructor TAmortizacao.Destroy;
begin
  FListaPeriodos.DisposeOf;
  inherited;
end;

end.
