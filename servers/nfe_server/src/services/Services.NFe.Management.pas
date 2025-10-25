unit Services.NFe.Management;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe;

type
  TServiceManagement = class(TDataModule)
    ACBrNFe: TACBrNFe;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServiceManagement: TServiceManagement;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
