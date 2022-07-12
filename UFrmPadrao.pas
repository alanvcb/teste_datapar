unit UFrmPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmPadrao = class(TForm)
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTitulo,FSubTitulo: String;
    procedure SetSubTitulo(const Value: String);
    procedure SetTitulo(const Value: String);
    { Private declarations }
  public
    property Titulo: String read FTitulo write SetTitulo;
    property SubTitulo: String read FSubTitulo write SetSubTitulo;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TFrmPadrao.SetSubTitulo(const Value: String);
begin
  FSubTitulo := Value;
  lblSubTitulo.Caption := Value;
  lblSubTitulo.Visible := not FSubTitulo.IsEmpty;
end;

procedure TFrmPadrao.SetTitulo(const Value: String);
begin
  FTitulo := Value;
  Self.Caption := Value;
  lblTitulo.Caption := Value;
end;

end.
