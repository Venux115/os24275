�
 TFRMHOME 0�  TPF0TfrmHomefrmHomeLeft!Top� Width(Height�CaptionfrmHomeColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderOnCreate
FormCreatePixelsPerInch`
TextHeight TcxGridgrdVeiculosLeft Top1Width�HeightWAlignalClientTabOrder  TcxGridDBTableViewgrdVeiculosDBTableView1DataController.DataSource
srcVeiculoDataController.Filter.Criteria
	   ����     /DataController.Summary.DefaultGroupSummaryItems )DataController.Summary.FooterSummaryItems $DataController.Summary.SummaryGroups NavigatorButtons.ConfirmDeleteOnCellClick grdVeiculosDBTableView1CellClickOptionsView.GroupByBox TcxGridDBColumn!grdVeiculosDBTableView1CD_VEICULOCaption   Código	SortOrdersoAscendingWidthQDataBinding.FieldName
CD_VEICULO  TcxGridDBColumn!grdVeiculosDBTableView1DS_VEICULOCaptionNomeWidthDataBinding.FieldName
DS_VEICULO  TcxGridDBColumn grdVeiculosDBTableView1BL_IMAGEMCaptionimagemDataBinding.FieldName	BL_IMAGEM   TcxGridLevelgrdVeiculosLevel1GridViewgrdVeiculosDBTableView1Options.DetailTabsPositiondtpTop   TPanelpnlInformacaoLeft�Top1WidthqHeightWAlignalRightTabOrder TLabellblCodigoVeiculoLeftTop Width!HeightCaption   CódigoEnabled  TLabellblNomeVeiculoLeftTopPWidthMHeightCaption   Nome do VículoEnabled  TLabellblImagemVeiculoLeftTop� Width%HeightCaptionImagemEnabled  TImage
imgVeiculoLeftxTop� Width� Height� Center	EnabledProportional	  TSpeedButtonbtnCancelarLeft5Top(WidthdHeight!CaptionCancelarEnabledOnClickbtnCancelarClick  TSpeedButton	BtnSalvarLeft� Top'WidthdHeight!CaptionSalvarEnabledOnClickBtnSalvarClick  TLabellblDescLeftxTop� WidthHeight  TEditedtCodigoVeiculoLeftxTopWidth� HeightEnabledTabOrder   TEditedtNomeVeiculoLeftyTopLWidth� HeightEnabledTabOrder  TPanelpnlAcessoriosLeftTopWidthAHeight	TabOrder TButtonbtnNovoAcessorioLeftTop� WidthKHeightCaptionNovoEnabledTabOrder OnClickbtnNovoAcessorioClick  TButtonbtnEditarAcessorioLeft� Top� WidthKHeightCaptionEditarEnabledTabOrderOnClickbtnEditarAcessorioClick  TButtonbtnExcluirAcessorioLeft� Top� WidthKHeightCaptionExcluirEnabledTabOrderOnClickbtnExcluirAcessorioClick  TcxGridgrdAcessoriosLeftTopWidth1Height� EnabledTabOrder TcxGridDBTableViewgrdAcessoriosDBTableView1DataController.DataSourcesrcAcessorioDataController.Filter.Criteria
	   ����     /DataController.Summary.DefaultGroupSummaryItems )DataController.Summary.FooterSummaryItems $DataController.Summary.SummaryGroups NavigatorButtons.ConfirmDeleteOptionsView.GroupByBox TcxGridDBColumn grdAcessoriosDBTableView1CD_ITEMCaption   CódigoDataBinding.FieldNameCD_ITEM  TcxGridDBColumn%grdAcessoriosDBTableView1DS_ACESSORIOCaption
   Acessório	SortOrdersoAscendingWidth� DataBinding.FieldNameDS_ACESSORIO   TcxGridLevelgrdAcessoriosLevel1GridViewgrdAcessoriosDBTableView1    TButtonbtnBuscaImgLeftTop� WidthKHeightCaptionBuscar fotoEnabledTabOrderOnClickbtnBuscaImgClick   TPanel	pnlHeaderLeft Top WidthHeight1AlignalTopTabOrder TSpeedButtonbtnAdicionarVeiculoLeftTopWidthdHeight!Caption	AdicionarOnClickbtnAdicionarVeiculoClick  TSpeedButtonbtnEditarVeiculoLeftxTopWidthdHeight!CaptionEditarOnClickbtnEditarVeiculoClick  TSpeedButtonbtnExcluirVeiculoLeft� TopWidthdHeight!CaptionExcluirOnClickbtnExcluirVeiculoClick  TEditedtPesquisaLeft�TopWidthqHeightTabOrder TextPesquisaOnChangeedtPesquisaChangeOnClickedtPesquisaClick  TButtonbtnLimparPesqLeft8TopWidthQHeightCaptionMostrar todosTabOrderOnClickbtnLimparPesqClick   TIBCDataSource
srcVeiculoDataSet
qryVeiculoLeft�TopH  	TIBCQuery
qryVeiculo	KeyFields
CD_VEICULOKeyGeneratorGEN_VEICULOSQLInsert.StringsINSERT INTO VEICULO2  (CD_VEICULO, DS_VEICULO, BL_IMAGEM, DS_EXTENCAO)VALUES6  (:CD_VEICULO, :DS_VEICULO, :BL_IMAGEM, :DS_EXTENCAO) SQLDelete.StringsDELETE FROM VEICULOWHERE  CD_VEICULO = :Old_CD_VEICULO SQLUpdate.StringsUPDATE VEICULOSETh  CD_VEICULO = :CD_VEICULO, DS_VEICULO = :DS_VEICULO, BL_IMAGEM = :BL_IMAGEM, DS_EXTENCAO = :DS_EXTENCAOWHERE  CD_VEICULO = :Old_CD_VEICULO SQLRefresh.StringsBSELECT CD_VEICULO, DS_VEICULO, BL_IMAGEM, DS_EXTENCAO FROM VEICULOWHERE  CD_VEICULO = :CD_VEICULO SQLLock.StringsSELECT NULL FROM VEICULOWHERECD_VEICULO = :Old_CD_VEICULOFOR UPDATE WITH LOCK 
Connection	conectionSQL.StringsSELECT * FROM VEICULO Active	IndexFieldNames
CD_VEICULOLeft�TopH TIntegerFieldqryVeiculoCD_VEICULO	FieldName
CD_VEICULO  TStringFieldqryVeiculoDS_VEICULO	FieldName
DS_VEICULOSize�   
TBlobFieldqryVeiculoBL_IMAGEM	FieldName	BL_IMAGEM  TStringFieldqryVeiculoDS_EXTENCAO	FieldNameDS_EXTENCAORequired	Size(   TIBCConnection	conectionDatabaseDC:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os24275\BANCO.FDBClientLibraryGC:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os24275\fbclient.dllPort3050UsernameSYSDBAPassword19983101Server	localhost	Connected	LeftXTopH  TOpenPictureDialogOpenPictureDialogFilter~All (.jpg;*.jpeg;*.bmp)|*.jpg;*.jpeg;*.bmp|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmpLeft�Top  	TIBCQueryqryAcessorio	KeyFieldsCD_ITEMKeyGeneratorGEN_ACESSORIOSQLInsert.StringsINSERT INTO ACESSORIO%  (CD_ITEM, DS_ACESSORIO, CD_VEICULO)VALUES(  (:CD_ITEM, :DS_ACESSORIO, :CD_VEICULO) SQLDelete.StringsDELETE FROM ACESSORIOWHERE  CD_ITEM = :Old_CD_ITEM SQLUpdate.StringsUPDATE ACESSORIOSETL  CD_ITEM = :CD_ITEM, DS_ACESSORIO = :DS_ACESSORIO, CD_VEICULO = :CD_VEICULOWHERE  CD_ITEM = :Old_CD_ITEM SQLRefresh.Strings7SELECT CD_ITEM, DS_ACESSORIO, CD_VEICULO FROM ACESSORIOWHERE  CD_ITEM = :Old_CD_ITEM SQLLock.StringsSELECT NULL FROM ACESSORIOWHERECD_ITEM = :Old_CD_ITEMFOR UPDATE WITH LOCK 
Connection	conectionSQL.StringsSELECT * FROM ACESSORIO CachedUpdates	Active	IndexFieldNamesCD_ITEMLeftTopH TIntegerFieldqryAcessorioCD_ITEM	FieldNameCD_ITEM  TStringFieldqryAcessorioDS_ACESSORIO	FieldNameDS_ACESSORIOSize�   TIntegerFieldqryAcessorioCD_VEICULO	FieldName
CD_VEICULO   TIBCDataSourcesrcAcessorioDataSetqryAcessorioLeft`TopH   