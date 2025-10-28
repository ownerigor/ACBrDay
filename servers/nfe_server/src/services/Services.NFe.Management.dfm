object ServiceManagement: TServiceManagement
  Height = 284
  Width = 396
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 120
    Top = 72
  end
  object Connection: TFDConnection
    Params.Strings = (
      'Database=nfe_db'
      'User_Name=postgres'
      'Password=postdba'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 192
    Top = 72
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 192
    Top = 136
  end
end
