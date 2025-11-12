unit Controllers.Boleto.Management;

interface

procedure Registry;

implementation

uses
  Horse, System.JSON, ACBrBoleto, System.SysUtils, System.Classes,
  ACBrBoletoConversao, ACBrBoletoFPDF;

procedure PostBoletos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LJSONObject: TJSONObject;
  LACBrBoleto: TACBrBoleto;
  LACBrBoletoFPDF: TACBrBoletoFPDF;
  LTitulo: TACBrTitulo;
  LFileName: string;
begin
  try
    LJSONObject := Req.Body<TJSONObject>;
    LACBrBoleto := TACBrBoleto.Create(nil);
    LACBrBoletoFPDF   := TACBrBoletoFPDF.Create(nil);
    try
      LACBrBoleto.ACBrBoletoFC := LACBrBoletoFPDF;
      LACBrBoleto.Banco.TipoCobranca := cobBancoDoBrasil;
      LACBrBoleto.Cedente.Agencia := '1234';
      LACBrBoleto.Cedente.AgenciaDigito := '0';
      LACBrBoleto.Cedente.Conta := '56789';
      LACBrBoleto.Cedente.ContaDigito := '1';
      LACBrBoleto.Cedente.CodigoCedente := '123456';
      LACBrBoleto.Cedente.CNPJCPF := '41.969.905/0001-51';
      LACBrBoleto.Cedente.Nome := 'Minha Empresa LTDA';
      LACBrBoleto.Cedente.Logradouro := 'Rua Exemplo, 123';
      LACBrBoleto.Cedente.Cidade := 'Campo Grande';
      LACBrBoleto.Cedente.UF := 'MS';
      LACBrBoleto.Cedente.CEP := '79000-000';
      LACBrBoleto.Cedente.Convenio := '1234567';

      LTitulo := LACBrBoleto.CriarTituloNaLista;
      LTitulo.Carteira := '17';
      LTitulo.NossoNumero := LJSONObject.GetValue<string>('nosso_numero');
      LTitulo.NumeroDocumento := LJSONObject.GetValue<string>('numero_documento');
      LTitulo.ValorDocumento := LJSONObject.GetValue<Double>('valor');
      LTitulo.DataDocumento := StrToDate(LJSONObject.GetValue<string>('vencimento'));
      LTitulo.Sacado.NomeSacado := LJSONObject.GetValue<string>('sacado_nome');
      LTitulo.Sacado.CNPJCPF := LJSONObject.GetValue<string>('sacado_cpf');
      LTitulo.Sacado.Logradouro := LJSONObject.GetValue<string>('sacado_endereco');
      LTitulo.Sacado.Cidade := LJSONObject.GetValue<string>('sacado_cidade');
      LTitulo.Sacado.UF := LJSONObject.GetValue<string>('sacado_uf');
      LTitulo.Sacado.CEP := LJSONObject.GetValue<string>('sacado_cep');

      LTitulo.EspecieDoc := 'DM';
      LTitulo.Aceite := atNao;
      LTitulo.DataDocumento := Date;
      LTitulo.DataProcessamento := Date;

      LTitulo.Mensagem.Add('Obrigado pela preferência!');

      LFileName := IncludeTrailingPathDelimiter(GetCurrentDir) + 'boleto.pdf';
      LACBrBoleto.GerarPDF;

      LACBrBoletoFPDF.MostrarPreview := False;
      LACBrBoletoFPDF.MostrarSetup := False;
      LACBrBoletoFPDF.DirLogo := EmptyStr;

      Res.ContentType('application/pdf').SendFile(LFileName);
    finally
        LACBrBoleto.Free;
        LACBrBoletoFPDF.Free;
    end;
    except on E: Exception do
      Res.Status(500).Send<TJSONObject>(TJSONObject.Create.AddPair('error', E.Message));
  end;
end;

procedure Registry;
begin
  THorse.Post('/boletos', PostBoletos);
end;

end.
