unit Controllers.NFe.Management;

interface

procedure Registry;

implementation

uses Horse, ACBrNFe, Services.NFe.Management;

procedure GetEmitirNFe(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServiceManagement;
begin
  LService := TServiceManagement.Create();
  //LService.NFe
end;

procedure GetNFeById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin

end;

procedure PostCancelarNFe(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin

end;

procedure Registry;
begin
  THorse.Get('nfe/emitir', GetEmitirNFe);
  THorse.Get('nfe/:id', GetNFeById);
  THorse.Post('nfe/cancelar/:id', PostCancelarNFe);
end;

end.
