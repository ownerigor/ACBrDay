unit Controllers.Boleto.Status;

interface

procedure Registry;

implementation

uses Horse, System.JSON, System.SysUtils;

procedure GetStatusBoleto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.Create;
  LJSONObject.AddPair('status', 'online');
  LJSONObject.AddPair('data_hora_atualizacao', DateTimeToStr(Now));
  Res.Send<TJSONObject>(LJSONObject);
end;

procedure Registry;
begin
  THorse.Get('/ping', GetStatusBoleto);
end;

end.
