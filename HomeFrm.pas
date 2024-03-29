unit HomeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, DBAccess, IBC, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls, Buttons,
  MemDS, ExtDlgs, JPEG;

type
  TfrmHome = class(TForm)
    grdVeiculosDBTableView1: TcxGridDBTableView;
    grdVeiculosLevel1: TcxGridLevel;
    grdVeiculos: TcxGrid;
    srcVeiculo: TIBCDataSource;
    pnlInformacao: TPanel;
    pnlHeader: TPanel;
    btnAdicionarVeiculo: TSpeedButton;
    btnEditarVeiculo: TSpeedButton;
    btnExcluirVeiculo: TSpeedButton;
    lblCodigoVeiculo: TLabel;
    lblNomeVeiculo: TLabel;
    edtNomeVeiculo: TEdit;
    lblImagemVeiculo: TLabel;
    imgVeiculo: TImage;
    pnlAcessorios: TPanel;
    btnNovoAcessorio: TButton;
    btnEditarAcessorio: TButton;
    btnExcluirAcessorio: TButton;
    btnCancelar: TSpeedButton;
    BtnSalvar: TSpeedButton;
    edtPesquisa: TEdit;
    edtCodigoVeiculo: TEdit;
    qryVeiculo: TIBCQuery;
    qryVeiculoCD_VEICULO: TIntegerField;
    qryVeiculoDS_VEICULO: TStringField;
    qryVeiculoBL_IMAGEM: TBlobField;
    conection: TIBCConnection;
    btnLimparPesq: TButton;
    OpenPictureDialog: TOpenPictureDialog;
    btnBuscaImg: TButton;
    qryVeiculoDS_EXTENCAO: TStringField;
    lblDesc: TLabel;
    qryAcessorio: TIBCQuery;
    qryAcessorioCD_ITEM: TIntegerField;
    qryAcessorioDS_ACESSORIO: TStringField;
    srcAcessorio: TIBCDataSource;
    grdAcessoriosDBTableView1: TcxGridDBTableView;
    grdAcessoriosLevel1: TcxGridLevel;
    grdAcessorios: TcxGrid;
    grdVeiculosDBTableView1CD_VEICULO: TcxGridDBColumn;
    grdVeiculosDBTableView1DS_VEICULO: TcxGridDBColumn;
    grdVeiculosDBTableView1BL_IMAGEM: TcxGridDBColumn;
    qryAcessorioCD_VEICULO: TIntegerField;
    grdAcessoriosDBTableView1CD_ITEM: TcxGridDBColumn;
    grdAcessoriosDBTableView1DS_ACESSORIO: TcxGridDBColumn;
    procedure btnAdicionarVeiculoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure btnEditarVeiculoClick(Sender: TObject);
    procedure btnExcluirVeiculoClick(Sender: TObject);
    procedure grdVeiculosDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edtPesquisaChange(Sender: TObject);
    procedure edtPesquisaClick(Sender: TObject);
    procedure btnLimparPesqClick(Sender: TObject);
    procedure btnBuscaImgClick(Sender: TObject);
    procedure btnNovoAcessorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirAcessorioClick(Sender: TObject);
    procedure btnEditarAcessorioClick(Sender: TObject);
  private

    procedure ativaInformacoes(value:boolean);
    procedure ativaBotoesAlteracao(value:boolean);
    procedure ativaBotoesInformacao(value:boolean);
    procedure ativaBotoesAcessorios(value:boolean);
    procedure limpaInformacoes;

  public
     mode:integer;
  end;


var
  frmHome: TfrmHome;
  fotoEditada:
  boolean;

implementation

{$R *.dfm}

uses
  DM, acessorioAddFrm, acessorioEditarfrm;

procedure TfrmHome.ativaBotoesAcessorios(value:boolean);
begin
  btnNovoAcessorio.Enabled := value;
  btnEditarAcessorio.Enabled :=value;
  btnExcluirAcessorio.Enabled := value;
end;

procedure TfrmHome.ativaInformacoes(value:boolean);
begin
  edtNomeVeiculo.Enabled := value;
  lblNomeVeiculo.Enabled := value;
  lblImagemVeiculo.Enabled:= value;
end;

procedure TfrmHome.ativaBotoesInformacao(value:boolean);
begin
  btnCancelar.Enabled:=value;
  BtnSalvar.Enabled:=value;
  btnBuscaImg.Enabled:=value;
  grdAcessorios.Enabled := value;
end;

procedure TfrmHome.limpaInformacoes;
begin
   edtNomeVeiculo.clear;
   edtCodigoVeiculo.clear;
   imgVeiculo.Picture := nil;
end;

procedure TfrmHome.ativaBotoesAlteracao(value:boolean);
begin
  btnAdicionarVeiculo.Enabled := value;
  btnEditarVeiculo.Enabled := value;
  btnExcluirVeiculo.Enabled := value;
end;

procedure TfrmHome.btnAdicionarVeiculoClick(Sender: TObject);
begin
  ativaInformacoes(true);
  ativaBotoesAlteracao(false);
  ativaBotoesInformacao(true);
  ativaBotoesAcessorios(true);
  limpaInformacoes;
  qryAcessorio.SQL.Text := 'SELECT * FROM ACESSORIO WHERE CD_VEICULO =  -1';
  qryAcessorio.Execute;
  mode:= 0;
end;

procedure TfrmHome.btnCancelarClick(Sender: TObject);
begin
  limpaInformacoes;
  ativaInformacoes(false);
  ativaBotoesAlteracao(true);
  ativaBotoesInformacao(false);
  ativaBotoesAcessorios(false);
  qryVeiculo.Open;
  qryVeiculo.Insert;
end;

procedure TfrmHome.BtnSalvarClick(Sender: TObject);
var
extensao:string;
procedure CarregarImagemVeiculo;
  begin
    if not (OpenPictureDialog.FileName = '') then
    begin
      qryVeiculoBL_IMAGEM.LoadFromFile(OpenPictureDialog.FileName);
      extensao := ExtractFileExt(OpenPictureDialog.FileName);
      qryVeiculoDS_EXTENCAO.AsString := extensao;
    end
    else
    begin
      qryVeiculoDS_EXTENCAO.AsString := 'none';
    end;
  end;
begin
  try
    qryVeiculo.Open;
    if mode = 0 then
    begin
      qryVeiculo.Insert;
    end
    else
    begin
      qryVeiculo.Edit;

    end;
    CarregarImagemVeiculo;
    qryVeiculoDS_VEICULO.AsString := edtNomeVeiculo.text;


    qryVeiculo.Post;
    qryVeiculo.Transaction.CommitRetaining;

    qryAcessorio.Open;
    qryAcessorio.ApplyUpdates;
    qryAcessorio.Transaction.CommitRetaining;

    showmessage('salvo');
    fotoEditada := true;
    qryVeiculo.Open;

  except
    qryVeiculo.Transaction.RollbackRetaining;
    qryAcessorio.Transaction.RollbackRetaining;
    showmessage('erro');
  end;

  limpaInformacoes;
  ativaInformacoes(false);
  ativaBotoesAlteracao(true);
  ativaBotoesInformacao(false);
  ativaBotoesAcessorios(false);
end;

procedure TfrmHome.btnEditarVeiculoClick(Sender: TObject);
begin
  ativaInformacoes(true);
  ativaBotoesAlteracao(false);
  ativaBotoesInformacao(true);
  ativaBotoesAcessorios(true);
  mode:=1;

end;

procedure TfrmHome.btnExcluirVeiculoClick(Sender: TObject);
begin
if MessageDlg('Confirma exclus�o?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  try
    qryVeiculo.Delete;
    qryVeiculo.execute;
    qryVeiculo.Transaction.CommitRetaining;
  except
    qryVeiculo.Transaction.RollbackRetaining;
  end;
end;
end;

procedure TfrmHome.grdVeiculosDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  BlobStream: TStream;
  MS: TMemoryStream;
  JPG : TJPEGImage;
  extensao: string;
begin
  edtNomeVeiculo.Text := qryVeiculoDS_VEICULO.value;
  edtCodigoVeiculo.Text := inttostr(qryVeiculoCD_VEICULO.value);

  if qryVeiculoBL_IMAGEM.BlobSize <> 0 then
  begin
    extensao := qryVeiculoDS_EXTENCAO.value;

    imgVeiculo.Picture.Assign(nil);
    lblDesc.Caption := 'Formato n�o suportado para exibi��o: ' + extensao;


    if extensao = '.bmp' then
    begin
      lblDesc.Caption := '';
      BlobStream := qryVeiculo.CreateBlobStream(qryVeiculoBL_IMAGEM,bmRead);
      try
        imgVeiculo.Picture.Bitmap.LoadFromStream(BlobStream);
        //frmArquivos.imgArquivo.Picture.Bitmap.LoadFromStream(BlobStream);
      finally
        BlobStream.Free;
      end;
    end;
    if (extensao = '.jpeg') or (extensao = '.jpg') then
    begin
      lblDesc.Caption := '';
      MS := TMemoryStream.Create;
      qryVeiculoBL_IMAGEM.SaveToStream(MS);
      JPG := TJPEGImage.Create;
      JPG.Assign(qryVeiculoBL_IMAGEM);
      imgVeiculo.Picture.Assign(JPG);
    end;


  end
  else
    imgVeiculo.Picture := nil;

  try
    qryAcessorio.SQL.Text := 'SELECT * FROM ACESSORIO WHERE CD_VEICULO =  :id;';
    qryAcessorio.ParamByName('id').AsInteger := qryVeiculoCD_VEICULO.Value;
    qryAcessorio.Execute;
  except
  end;
end;

procedure TfrmHome.edtPesquisaChange(Sender: TObject);
begin
  qryVeiculo.Open;
  qryVeiculo.SQL.Text := 'Select * from VEICULO where DS_VEICULO CONTAINING :nome ;';
  qryVeiculo.ParamByName('nome').AsString := edtPesquisa.Text;
  qryVeiculo.execute;
end;

procedure TfrmHome.edtPesquisaClick(Sender: TObject);
begin
  edtPesquisa.text := '';
end;

procedure TfrmHome.btnLimparPesqClick(Sender: TObject);
begin
  qryVeiculo.Open;
  qryVeiculo.SQL.Text := 'Select * from VEICULO;';
  qryVeiculo.execute;
end;

procedure TfrmHome.btnBuscaImgClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    imgVeiculo.Picture.LoadFromFile(OpenPictureDialog.FileName);
  end;
  fotoEditada:=true;
end;

procedure TfrmHome.btnNovoAcessorioClick(Sender: TObject);
begin
  application.CreateForm(TFrmAdicionaAcessorio, FrmAdicionaAcessorio);
  frmAdicionaAcessorio.ShowModal;
end;

procedure TfrmHome.FormCreate(Sender: TObject);
begin
  fotoEditada:=false;
  
end;

procedure TfrmHome.btnExcluirAcessorioClick(Sender: TObject);
begin
if MessageDlg('Confirma exclus�o?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  try
    qryAcessorio.open;
    qryAcessorio.Delete;
    qryAcessorio.Transaction.CommitRetaining;
    qryAcessorio.ApplyUpdates;
  except
    qryAcessorio.Transaction.RollbackRetaining;
  end;
end
end;

  procedure TfrmHome.btnEditarAcessorioClick(Sender: TObject);
begin
  Application.CreateForm(TfrmEditarAcessorio,FrmEditarAcessorio);
  frmEditarAcessorio.showmodal;
end;

end.
