import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/services.dart';

class BoletoPage extends StatelessWidget {
  final double valor = 199.90;
  final String vencimento = '20/05/2025';
  final String codigo =
      '23793.38128 60001.237996 04000.040005 1 94750000019990';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Boleto Gerado')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Boleto para pagamento',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Text('Valor: R\$ ${valor.toStringAsFixed(2)}'),
            Text('Vencimento: $vencimento'),
            Text('Beneficiário: Banco Virtual'),
            SizedBox(height: 20),

            /// Código de barras
            BarcodeWidget(
              data: codigo,
              barcode: Barcode.code128(),
              width: 300,
              height: 80,
              drawText: false,
            ),

            SizedBox(height: 20),
            SelectableText(
              codigo,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: codigo));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Código copiado para a área de transferência!')),
                );
              },
              icon: Icon(Icons.copy),
              label: Text('Copiar Código'),
            ),
          ],
        ),
      ),
    );
  }
}