unit Services.NFe.Management;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TServiceManagement = class(TDataModule)
    ACBrNFe: TACBrNFe;
    Connection: TFDConnection;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
  end;

implementation

{$R *.dfm}

end.
