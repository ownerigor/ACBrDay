unit Providers.NFe.NFeConfig;

interface

uses
  ACBrNFe, ACBrNFeDANFEClass, ACBrDFeSSL, ACBrDFe, System.SysUtils;

type
  TNFeConfigurator = class
  private
    FACBrNFe: TACBrNFe;
  public
    constructor Create(AACBrNFe: TACBrNFe);
    destructor Destroy; override;
    procedure Configure;
  end;

implementation

uses
  pcnConversaoNFe, pcnConversao, blcksock;

constructor TNFeConfigurator.Create(AACBrNFe: TACBrNFe);
begin
  FACBrNFe := AACBrNFe;
end;

destructor TNFeConfigurator.Destroy;
begin
  FACBrNFe.Destroy;
end;

procedure TNFeConfigurator.Configure;
begin
  FACBrNFe.Configuracoes.Geral.SSLLib        := libCustom;
  FACBrNFe.Configuracoes.Geral.SSLCryptLib   := cryNone;
  FACBrNFe.Configuracoes.Geral.SSLHttpLib    := httpNone;
  FACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;

  FACBrNFe.Configuracoes.Geral.ModeloDF     := moNFe;
  FACBrNFe.Configuracoes.Geral.VersaoDF     := ve400;
  FACBrNFe.Configuracoes.Geral.FormaEmissao := teNormal;

  FACBrNFe.Configuracoes.Certificados.ArquivoPFX  := GetEnvironmentVariable('CERT_PATH');
  FACBrNFe.Configuracoes.Certificados.Senha       := GetEnvironmentVariable('CERT_PASSWORD');
  FACBrNFe.Configuracoes.Certificados.NumeroSerie := GetEnvironmentVariable('CERT_SERIAL');

  FACBrNFe.Configuracoes.WebServices.UF := GetEnvironmentVariable('UF');

  if GetEnvironmentVariable('AMBIENTE').Equals('HOMOLOGACAO') then
    FACBrNFe.Configuracoes.WebServices.Ambiente := taHomologacao
  else
    FACBrNFe.Configuracoes.WebServices.Ambiente := taProducao;

  FACBrNFe.Configuracoes.WebServices.TimeOut    := StrToIntDef(GetEnvironmentVariable('TIMEOUT'), 60000);
  FACBrNFe.Configuracoes.WebServices.Visualizar := GetEnvironmentVariable('VISUALIZAR').Equals('true');
  FACBrNFe.SSL.SSLType := LT_all;

  if Assigned(FACBrNFe.DANFE) then
  begin
    FACBrNFe.DANFE.Logo          := GetEnvironmentVariable('LOGO_PATH');
    FACBrNFe.DANFE.MostraPreview := GetEnvironmentVariable('MOSTRA_PREVIEW').Equals('true');
  end;

  FACBrNFe.Configuracoes.Arquivos.Salvar      := True;
  FACBrNFe.Configuracoes.Arquivos.PathNFe     := GetEnvironmentVariable('PATH_NFE');
  FACBrNFe.Configuracoes.Arquivos.PathSchemas := GetEnvironmentVariable('PATH_SCHEMAS');
  FACBrNFe.Configuracoes.Arquivos.PathEvento  := GetEnvironmentVariable('PATH_EVENTOS');
end;

end.

