import 'package:flutter/material.dart';
import 'account_infopage.dart';
import 'transferpage.dart';
import 'historicpage.dart';
import 'simulador.dart';
import 'deposito.dart';
import 'boletopage.dart';
import '../globals.dart';
import 'saldo.dart'; // Adicionada a importação da SaldoPage

class WelcomePage extends StatelessWidget {
  final List<Map<String, dynamic>> opcoes = [
    {'icon': Icons.account_balance_wallet, 'title': 'Ver Saldo'},
    {'icon': Icons.person, 'title': 'Dados da Conta'},
    {'icon': Icons.send, 'title': 'Transferir'},
    {'icon': Icons.receipt_long, 'title': 'Pagamentos'},
    {'icon': Icons.history, 'title': 'Histórico de Transações'},
    {'icon': Icons.show_chart, 'title': 'Simular Investimento'},
    {'icon': Icons.picture_as_pdf, 'title': 'Gerar Boleto'},
    {'icon': Icons.attach_money, 'title': 'Depósito'},
  ];

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
            Center(
              child: Column(
                children: [
                  Icon(Icons.account_circle, size: 80, color: Colors.yellow[700]),
                  SizedBox(height: 10),
                  Text(
                    'Bem-vindo ao Banco Virtual!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
            SizedBox(height: 10),
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
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          // Navegar para a tela de saldo
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SaldoPage()),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AccountInfoPage()),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TransferPage()),
                          );
                        } else if (index == 3) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Você não tem contas a pagar :)')));
                        } else if (index == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HistoricoPage()),
                          );
                        } else if (index == 5) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SimuladorPage()),
                          );
                        } else if (index == 6) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BoletoPage()),
                          );
                        } else if (index == 7) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DepositoPage()),
                          );
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(opcoes[index]['icon'], color: Colors.yellow[700]),
                          Text(
                            opcoes[index]['title'],
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow[800]),
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