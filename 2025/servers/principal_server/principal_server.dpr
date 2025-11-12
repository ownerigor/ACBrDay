program principal_server;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.SysUtils,
  Controllers.Principal.Monitoring in 'src\controllers\Controllers.Principal.Monitoring.pas',
  Server.Response.Handler.Intf in 'src\providers\handler\Server.Response.Handler.Intf.pas',
  Server.Response.Handler in 'src\providers\handler\Server.Response.Handler.pas',
  Server.Response.Intf in 'src\providers\handler\Server.Response.Intf.pas',
  Server.Response in 'src\providers\handler\Server.Response.pas',
  Arrays.Helpers in 'src\providers\helpers\Arrays.Helpers.pas',
  JSON.Helpers in 'src\providers\helpers\JSON.Helpers.pas',
  Providers.Request.Intf in 'src\providers\request\Providers.Request.Intf.pas',
  Providers.Request in 'src\providers\request\Providers.Request.pas',
  Providers.Session in 'src\providers\Providers.Session.pas',
  Providers.Models.Token in 'src\providers\models\Providers.Models.Token.pas';

begin
  const
    FPort = 9050;

  THorse.Use(Jhonson());

  Controllers.Principal.Monitoring.Registry;

  THorse.Listen(FPort, '0.0.0.0',
    procedure
    begin
      Writeln('API para observabilidade de notas e boletos emitidos');
      Writeln('Rodando na porta ' + FPort.ToString);
    end);
end.
