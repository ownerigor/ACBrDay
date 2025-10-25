program nfe_server;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.SysUtils,
  Controllers.NFe.Management in 'src\controllers\Controllers.NFe.Management.pas',
  Services.NFe.Management in 'src\services\Services.NFe.Management.pas' {DataModule1: TDataModule},
  Controllers.NFe.Status in 'src\controllers\Controllers.NFe.Status.pas';

begin
  const
    FPort = 9051;

  THorse.Use(Jhonson());

  Controllers.NFe.Status.Registry;
  Controllers.NFe.Management.Registry;

  THorse.Listen(FPort, '0.0.0.0',
    procedure
    begin
      Writeln('API para emissão de notas');
      Writeln('Rodando na porta ' + FPort.ToString);
    end);
end.
