unit UEditHelper;

interface

uses
  Vcl.StdCtrls;

type TEditHelper = class helper for TEdit
  private
    procedure ValidaDigitacaoNumero(Sender: TObject; var Key: Char);
    procedure FormataSaida(Sender: TObject);
    procedure FormataEntrada(Sender: TObject);
  public
    procedure AceitarApenasValoresNumericos;
    function ValorNumerico: Extended;
    function ValorInteiro: Integer;
end;




implementation

uses
  System.SysUtils, UConstantes;

{ TEditHelper }


procedure TEditHelper.AceitarApenasValoresNumericos;
begin
  Self.OnKeyPress := ValidaDigitacaoNumero;
  Self.OnExit :=  FormataSaida;
  Self.OnEnter := FormataEntrada;
end;

procedure TEditHelper.FormataEntrada(Sender: TObject);
begin
  if Self.Text <> '' then
    Self.Text := FormatFloat('0',ValorNumerico);
end;

procedure TEditHelper.FormataSaida(Sender: TObject);
begin
  if Self.Text <> '' then
    Self.Text := FormatFloat(FormatoMonetario,ValorNumerico);
end;

procedure TEditHelper.ValidaDigitacaoNumero(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8,#9,#13,#27]) then
  begin
    if key in [FormatSettings.ThousandSeparator ,FormatSettings.DecimalSeparator] then
    begin
      if String(Self.Text).Contains(FormatSettings.DecimalSeparator) then
        Key := #0
      else
        Key := FormatSettings.DecimalSeparator;
    end
    else
      Key := #0;
  end;
end;

function TEditHelper.ValorInteiro: Integer;
begin
  Result := StrToIntDef(Self.Text,0);
end;

function TEditHelper.ValorNumerico: Extended;
var tmp: string;
begin
  tmp := StringReplace(Self.Text,FormatSettings.ThousandSeparator,'',[rfReplaceAll]); //remove os separadores de milhar

  while (tmp.CountChar(FormatSettings.DecimalSeparator) > 1) and //se deixaram um separador decimal no final remove
      tmp.EndsWith(FormatSettings.DecimalSeparator) do
    tmp := tmp.Remove(tmp.Length-1,1);

   while tmp.CountChar(FormatSettings.DecimalSeparator) > 1 do //remove separadores decimais extras
    tmp := tmp.Replace(FormatSettings.DecimalSeparator,'',[]);

  Result := StrToFloatDef(tmp,0);
end;

end.
