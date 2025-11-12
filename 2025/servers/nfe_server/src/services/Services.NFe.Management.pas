unit Services.NFe.Management;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe;

type
  TServiceManagement = class(TDataModule)
    ACBrNFe: TACBrNFe;
  end;

implementation

{$R *.dfm}

end.
