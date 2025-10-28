unit Controllers.NFe.Management;

interface

procedure Registry;

implementation

uses Horse, ACBrNFe, System.JSON, Services.NFe.Management, Providers.NFe.NFeConfig;

procedure PostEmitirNFe(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceManagement;
  LConfig: TNFeConfigurator;
begin
  LService := TServiceManagement.Create(nil);
  LConfig := TNFeConfigurator.Create(LService.ACBrNFe);
  LConfig.Configure;
  Res.Send<TJSONObject>(TJSONObject.Create().AddPair('status', 'ok'));
end;

procedure GetNFeById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin

end;

procedure PostCancelarNFe(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceManagement;
  LConfig: TNFeConfigurator;
begin
  LService := TServiceManagement.Create(nil);
  LConfig := TNFeConfigurator.Create(LService.ACBrNFe);
  LConfig.Configure;
end;

procedure Registry;
begin
  THorse.Post('nfe/emitir', PostEmitirNFe);
  THorse.Get('nfe/:id', GetNFeById);
  THorse.Post('nfe/cancelar/:id', PostCancelarNFe);
end;

end.
