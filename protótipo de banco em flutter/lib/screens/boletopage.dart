import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/services.dart';

class BoletoPage extends StatelessWidget {
  final double valor = 199.90;
  final String vencimento = '20/05/2025';
  final String codigoBarras =
      '23793.38128 60001.237996 04000.040005 1 94750000019990';
  final String linhaDigitavel =
      '23791.60068 60001.237996 04000.040005 1 94750000019990';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Boleto Bancário')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Cabeçalho com ícone
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_balance, size: 40, color: Colors.yellow[800]),
                  SizedBox(width: 10),
                  Text(
                    'Banco Virtual',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Cedente: Banco Virtual S.A.'),
              Text('CNPJ: 12.345.678/0001-90'),
              Text('Agência: 0001'),
              Text('Código do Cedente: 123456'),
              SizedBox(height: 20),

              // Dados do boleto
              Text('Valor: R\$ ${valor.toStringAsFixed(2)}'),
              Text('Vencimento: $vencimento'),
              Text('Nosso Número: 123456789012'),
              SizedBox(height: 20),

              // Linha digitável
              Text('Linha Digitável:', style: TextStyle(fontWeight: FontWeight.w600)),
              SelectableText(
                linhaDigitavel,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Código de barras
              BarcodeWidget(
                data: codigoBarras,
                barcode: Barcode.code128(),
                width: 300,
                height: 80,
                drawText: false,
              ),
              SizedBox(height: 20),

              // Instruções
              Text(
                'Após o vencimento, pagar com juros e multa conforme contrato.',
                style: TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Dados do pagador
              Text('Pagador:', style: TextStyle(fontWeight: FontWeight.w600)),
              Text('João da Silva'),
              Text('CPF: 123.456.789-00'),
              Text('Rua das Flores, 123 - Salvador - BA'),
              Text('CEP: 40000-000'),
              SizedBox(height: 20),

              // Botão de copiar
              TextButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: codigoBarras));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Código copiado para a área de transferência!')),
                  );
                },
                icon: Icon(Icons.copy),
                label: Text('Copiar Código de Barras'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
