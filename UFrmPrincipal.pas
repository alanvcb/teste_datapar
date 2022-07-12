unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.AppEvnts, Vcl.ButtonGroup;

type
  TfrmPrincipal = class(TForm)
    pgcPrincipal: TPageControl;
    tshPrincipal: TTabSheet;
    grpAmortizacoes: TGroupBox;
    btnUnico: TButton;
    imgLst: TImageList;
    procedure btnUnicoClick(Sender: TObject);
  private
    function CreateForm(const AClassName: string): TForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


procedure TfrmPrincipal.btnUnicoClick(Sender: TObject);
begin
  CreateForm('TFrmSimular');
end;

function TfrmPrincipal.CreateForm(const AClassName: string): TForm;
var
  FFormClass: TFormClass;
  FPersClass: TPersistentClass;
begin
  Assert(not(AClassName.Trim.IsEmpty), 'A classe do formulário deve ser informada');
  FPersClass := GetClass(AClassName);
  Assert(Assigned(FPersClass), 'Classe não localizada/registrada: ' + AClassName);
  FFormClass  := TFormClass(FPersClass);
  Result      := FFormClass.Create(nil);
  Result.Name := AClassName+Random(9999).ToString;
  Result.Show;
end;

end.

