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
  Res.Status(201).Send(TJSONObject.Create().AddPair('message', 'NFe emitida com sucesso...'));
end;

procedure PostCancelarNFe(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceManagement;
  LConfig: TNFeConfigurator;
begin
  LService := TServiceManagement.Create(nil);
  LConfig := TNFeConfigurator.Create(LService.ACBrNFe);
  LConfig.Configure;

  //Rotina de cancelamento...

  Res.Status(201).Send(TJSONObject.Create().AddPair('message', 'NFe cancelada com sucesso...'));
end;

procedure Registry;
begin
  THorse.Post('nfe/emitir', PostEmitirNFe);
  THorse.Post('nfe/cancelar/:id', PostCancelarNFe);
end;

end.
