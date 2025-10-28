program boleto_server;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.SysUtils,
  Controllers.Boleto.Status in 'src\controllers\Controllers.Boleto.Status.pas',
  Controllers.Boleto.Management in 'src\controllers\Controllers.Boleto.Management.pas';

begin
  const
    FPort = 9052;

  THorse.Use(Jhonson());

  Controllers.Boleto.Status.Registry;
  Controllers.Boleto.Management.Registry;

  THorse.Listen(FPort, '0.0.0.0',
    procedure
    begin
      Writeln('API para emissão de boletos');
      Writeln('Rodando na porta ' + FPort.ToString);
    end);
end.
