object frmAdicionaAcessorio: TfrmAdicionaAcessorio
  Left = 703
  Top = 353
  Width = 457
  Height = 306
  Caption = 'Adicionar Acessorio'
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
    Left = 48
    Top = 56
    Width = 46
    Height = 13
    Caption = 'Acess'#243'rio'
  end
  object edtAcessorio: TEdit
    Left = 48
    Top = 80
    Width = 361
    Height = 21
    TabOrder = 0
  end
  object btnSalvar: TButton
    Left = 48
    Top = 152
    Width = 145
    Height = 41
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 254
    Top = 152
    Width = 153
    Height = 41
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object qryGenerator: TIBCQuery
    SQL.Strings = (
      'SELECT GEN_ID( GEN_VEICULO, 0) FROM RDB$DATABASE')
    Left = 144
    Top = 24
    object qryGeneratorGEN_ID: TLargeintField
      FieldName = 'GEN_ID'
      ReadOnly = True
    end
  end
end
