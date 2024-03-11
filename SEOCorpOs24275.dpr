program SEOCorpOs24275;

uses
  Forms,
  HomeFrm in 'HomeFrm.pas' {frmHome},
  DM in 'DM.pas' {dmPrincipal: TDataModule},
  AcessorioAddFrm in 'AcessorioAddFrm.pas' {frmAdicionaAcessorio},
  AcessorioEditarfrm in 'AcessorioEditarfrm.pas' {frmEditarAcessorio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmAdicionaAcessorio, frmAdicionaAcessorio);
  Application.CreateForm(TfrmEditarAcessorio, frmEditarAcessorio);
  Application.Run;
end.
