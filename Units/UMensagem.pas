unit UMensagem;

interface

type TMensagem = class
   public
     class procedure Erro(Mensagem: string);
end;

implementation

uses
  Vcl.Dialogs;

{ TMensagem }

class procedure TMensagem.Erro(Mensagem: string);
begin
  MessageDlg(Mensagem,TMsgDlgType.mtError,[TMsgDlgBtn.mbCancel],0);
end;

end.
