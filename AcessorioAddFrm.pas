unit AcessorioAddFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, IBC;

type
  TfrmAdicionaAcessorio = class(TForm)
    edtAcessorio: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    lblAcessorio: TLabel;
    qryGenerator: TIBCQuery;
    qryGeneratorGEN_ID: TLargeintField;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    descAcessorio:string;
  end;

var
  frmAdicionaAcessorio: TfrmAdicionaAcessorio;


implementation

{$R *.dfm}

uses
  HomeFrm;


procedure TfrmAdicionaAcessorio.btnSalvarClick(Sender: TObject);
begin
  descAcessorio:=edtAcessorio.Text;
   try

    frmHome.qryAcessorio.Open;
    frmHome.qryAcessorio.Insert;
    frmHome.qryAcessorioDS_ACESSORIO.AsString := edtAcessorio.text;
    qryGenerator.SQL.Text := 'SELECT GEN_ID( GEN_VEICULO, 0) FROM RDB$DATABASE';
    qryGenerator.Open;

    if frmHome.mode = 0 then
      frmHome.qryAcessorioCD_VEICULO.AsInteger := qryGeneratorGEN_ID.value + 1
    else
      frmHome.qryAcessorioCD_VEICULO.AsInteger := frmhome.qryVeiculoCD_VEICULO.value;
      
    frmHome.qryAcessorio.Post;
    frmHome.qryAcessorio.Transaction.CommitRetaining;
    except
  frmHome.qryAcessorio.Transaction.RollbackRetaining;
  end;
  self.Close;

end;

procedure TfrmAdicionaAcessorio.btnCancelarClick(Sender: TObject);
begin
  self.close;
end;

end.
