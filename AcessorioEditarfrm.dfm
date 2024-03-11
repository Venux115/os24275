object frmEditarAcessorio: TfrmEditarAcessorio
  Left = 441
  Top = 274
  Width = 434
  Height = 340
  Caption = 'frmEditarAcessorio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblAcessorio: TLabel
    Left = 24
    Top = 104
    Width = 46
    Height = 13
    Caption = 'Acess'#243'rio'
  end
  object lblCodigo: TLabel
    Left = 24
    Top = 40
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    Enabled = False
  end
  object edtAcessorio: TEdit
    Left = 24
    Top = 128
    Width = 361
    Height = 21
    TabOrder = 0
  end
  object btnSalvar: TButton
    Left = 24
    Top = 200
    Width = 145
    Height = 41
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 230
    Top = 200
    Width = 153
    Height = 41
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object edtCodigo: TEdit
    Left = 24
    Top = 64
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object qryGenerator: TIBCQuery
    SQL.Strings = (
      'SELECT GEN_ID( GEN_VEICULO, 0) FROM RDB$DATABASE')
    Left = 376
    Top = 8
    object qryGeneratorGEN_ID: TLargeintField
      FieldName = 'GEN_ID'
      ReadOnly = True
    end
  end
end
