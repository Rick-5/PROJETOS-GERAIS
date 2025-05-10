import 'package:flutter/material.dart';
import 'account_infopage.dart'; // Importa a tela de dados da conta
import 'transferpage.dart'; // Importa a tela de transferência
import 'historicpage.dart'; // Importa a tela de histórico
import '../globals.dart';

class WelcomePage extends StatelessWidget {
  final List<Map<String, dynamic>> opcoes = [
    {'icon': Icons.account_balance_wallet, 'title': 'Ver Saldo'},
    {'icon': Icons.person, 'title': 'Dados da Conta'},
    {'icon': Icons.send, 'title': 'Transferir'},
    {'icon': Icons.receipt_long, 'title': 'Pagamentos'},
    {'icon': Icons.history, 'title': 'Histórico de Transações'}, // Alteração aqui
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
                    elevation: 0, // Remove o sombreado
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    // Corrigir aqui: usar Border.all()
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Seu saldo atual é: R\$ ${saldoUsuario.value.toStringAsFixed(2)}')),
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