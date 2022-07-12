unit UListaPeriodos;

interface

uses System.Generics.Collections,UPeriodo,System.SysUtils;

type TListaPeriodos = class(TObjectList<TPeriodo>)
  private
    function GetPeriodos(Index: Word): TPeriodo;
    procedure SetPeriodos(Index: Word; const Value: TPeriodo);
  public
    function Add(AObject: TPeriodo): Word;
    property Periodos[Index: Word]: TPeriodo read GetPeriodos write SetPeriodos; default;
end;

EPeriodoInexistente = class(EArgumentOutOfRangeException);


implementation

{ TListaPeriodos }

function TListaPeriodos.Add(AObject: TPeriodo): Word;
begin
  Result := inherited Add(AObject);
end;

function TListaPeriodos.GetPeriodos(Index: Word): TPeriodo;
begin
  Result := Nil;

  if Index >= Self.Count then
    raise EPeriodoInexistente.Create('Período inexistente.');

  Result := TPeriodo(inherited Items[Index]);
end;


procedure TListaPeriodos.SetPeriodos(Index: Word; const Value: TPeriodo);
begin
  if Index >= Self.Count then
    raise EPeriodoInexistente.Create('Período inexistente.');

  inherited Items[Index] := Value
end;


end.
