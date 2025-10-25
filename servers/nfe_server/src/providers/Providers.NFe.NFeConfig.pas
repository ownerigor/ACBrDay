unit Providers.NFe.NFeConfig;

interface

uses
  ACBrNFe, ACBrUtil, ACBrNFeDANFEClass, ACBrDFeSSL, ACBrDFe, System.SysUtils;

type
  TNFeConfigurator = class
  private
    FACBrNFe: TACBrNFe;
  public
    constructor Create(AACBrNFe: TACBrNFe);
    procedure Configure;
  end;

implementation

uses
  pcnConversaoNFe, pcnConversao, blcksock;

{ TNFeConfigurator }

constructor TNFeConfigurator.Create(AACBrNFe: TACBrNFe);
begin
  FACBrNFe := AACBrNFe;
end;

procedure TNFeConfigurator.Configure;
begin
  FACBrNFe.Configuracoes.Geral.SSLLib := libWinCrypt;
  FACBrNFe.Configuracoes.Geral.SSLCryptLib := cryWinCrypt;
  FACBrNFe.Configuracoes.Geral.SSLHttpLib := httpWinHttp;
  FACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;

  FACBrNFe.Configuracoes.Geral.ModeloDF := moNFe;
  FACBrNFe.Configuracoes.Geral.VersaoDF := ve400;
  FACBrNFe.Configuracoes.Geral.FormaEmissao := teNormal;

  FACBrNFe.Configuracoes.Certificados.ArquivoPFX := '/certs/meucertificado.pfx';
  FACBrNFe.Configuracoes.Certificados.Senha := '123456';
  FACBrNFe.Configuracoes.Certificados.NumeroSerie := '';

  FACBrNFe.Configuracoes.WebServices.UF := 'SP';
  FACBrNFe.Configuracoes.WebServices.Ambiente := taHomologacao;
  FACBrNFe.Configuracoes.WebServices.TimeOut := 60000;
  FACBrNFe.Configuracoes.WebServices.Visualizar := False;
  FACBrNFe.SSL.SSLType := LT_all;

  if Assigned(FACBrNFe.DANFE) then
  begin
    FACBrNFe.DANFE.Logo := '/assets/logo_empresa.bmp';
    FACBrNFe.DANFE.MostraPreview := False;
  end;

  FACBrNFe.Configuracoes.Arquivos.Salvar := True;
  FACBrNFe.Configuracoes.Arquivos.PathNFe := '/data/nfe/';
  FACBrNFe.Configuracoes.Arquivos.PathEvento := '/data/nfe/eventos/';
end;

end.

