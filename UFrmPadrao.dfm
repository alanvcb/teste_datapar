object frmPadrao: TfrmPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmPadrao'
  ClientHeight = 320
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 47
    Align = alTop
    AutoSize = True
    TabOrder = 0
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 432
      Height = 19
      Align = alTop
      Caption = 'Titulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 40
    end
    object lblSubTitulo: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 29
      Width = 432
      Height = 14
      Align = alTop
      Caption = 'SubTitulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 50
    end
  end
end
