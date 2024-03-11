unit AcessorioEditarfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, IBC, StdCtrls;

type
  TfrmEditarAcessorio = class(TForm)
    edtAcessorio: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    lblAcessorio: TLabel;
    qryGenerator: TIBCQuery;
    qryGeneratorGEN_ID: TLargeintField;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditarAcessorio: TfrmEditarAcessorio;

implementation

{$R *.dfm}

uses
  homefrm;

procedure TfrmEditarAcessorio.btnSalvarClick(Sender: TObject);
begin
   try
    frmHome.qryAcessorio.Open;
    frmHome.qryAcessorio.edit;
    frmHome.qryAcessorioDS_ACESSORIO.AsString := edtAcessorio.Text;
    frmHome.qryAcessorio.Post;
    frmHome.qryAcessorio.Transaction.CommitRetaining;
    except
  frmHome.qryAcessorio.Transaction.RollbackRetaining;
  end;
  self.Close;

end;

procedure TfrmEditarAcessorio.btnCancelarClick(Sender: TObject);
begin
self.Close;
end;

end.
