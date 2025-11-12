unit Controllers.Principal.Monitoring;

interface

procedure Registry;

implementation

uses Horse, System.JSON, Providers.Request, System.SysUtils;

function CheckContainerStatus(const AURL: string): string;
var
  LResponse: IResponse;
begin
  Result := 'offline';
  LResponse := TRequest.New
    .BaseURL(AURL + '/ping')
    .Get;
  if LResponse.StatusCode = 200 then
    Result := 'online';
end;

procedure GetStatus(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.Create;
  LJSONObject.AddPair('api_nfe', CheckContainerStatus('http://localhost:9051'));
  LJSONObject.AddPair('api_boleto', CheckContainerStatus('http://localhost:9052'));
  Res.Send<TJSONObject>(LJSONObject);
end;

procedure GetMetrics(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.Create;
  LJSONObject.AddPair('notas_emitidas', TJSONNumber.Create(124));
  LJSONObject.AddPair('boletos_gerados', TJSONNumber.Create(89));
  LJSONObject.AddPair('ultima_atualizacao', DateTimeToStr(Now));
  Res.Send<TJSONObject>(LJSONObject);
end;


procedure Registry;
begin
  THorse.Get('monitoring/status', GetStatus);
  THorse.Get('monitoring/metrics', GetMetrics);
end;

end.
