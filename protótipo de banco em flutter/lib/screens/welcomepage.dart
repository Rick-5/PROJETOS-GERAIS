import 'package:flutter/material.dart';
import 'account_infopage.dart';
import 'transferpage.dart';
import 'historicpage.dart';
import 'simulador.dart';
import 'deposito.dart';
import 'boletopage.dart';
import '../globals.dart';

class WelcomePage extends StatelessWidget {
  final double saldo = 5234.78; // Simulação de valor de saldo

  final List<Map<String, dynamic>> opcoes = [
    {'icon': Icons.person, 'title': 'Dados da Conta'},
    {'icon': Icons.send, 'title': 'Transferir'},
    {'icon': Icons.receipt_long, 'title': 'Pagamentos'},
    {'icon': Icons.history, 'title': 'Histórico de Transações'},
    {'icon': Icons.show_chart, 'title': 'Simular Investimento'},
    {'icon': Icons.picture_as_pdf, 'title': 'Gerar Boleto'},
    {'icon': Icons.attach_money, 'title': 'Depósito'},
  ];

  void _handleOptionTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => AccountInfoPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => TransferPage()));
        break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Você não tem contas a pagar :)')),
        );
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => HistoricoPage()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_) => SimuladorPage()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (_) => BoletoPage()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (_) => DepositoPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Saldo + botão de tema
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Saldo destacado
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo disponível',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'R\$ ${saldo.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  onPressed: () {
                    temaAtual.value = temaAtual.value == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark;
                  },
                  tooltip: 'Alternar Tema',
                ),
              ],
            ),

            SizedBox(height: 30),

            // Grade de opções
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: opcoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => _handleOptionTap(context, index),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(opcoes[index]['icon'], color: Colors.yellow[700]),
                          SizedBox(height: 8),
                          Text(
                            opcoes[index]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.yellow[800],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
