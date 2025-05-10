import 'package:flutter/material.dart';
import '../globals.dart';
import '../screens/transferpage.dart';
import '../screens/deposito.dart';
import '../models/transacaopage.dart';

class SaldoPage extends StatelessWidget {
  const SaldoPage({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[900],
    appBar: AppBar(
      title: Text('Saldo'),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Texto "Saldo disponível"
          Text(
            'Saldo disponível',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontWeight: FontWeight.w400,
            ),
          ),

          // Valor do saldo
          ValueListenableBuilder<double>(
            valueListenable: saldoUsuario,
            builder: (context, saldo, _) {
              return Text(
                'R\$ ${saldo.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // Botões Transferir e Depositar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => TransferPage()));
                  },
                  icon: Icon(Icons.send),
                  label: Text('Transferir'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => DepositoPage()));
                  },
                  icon: Icon(Icons.attach_money),
                  label: Text('Depositar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Título das transações
          Text(
            'Últimas transações',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),

          // Lista das transações
          Expanded(
            child: ValueListenableBuilder<List<Transacao>>(
              valueListenable: historicoTransacoes,
              builder: (context, lista, _) {
                if (lista.isEmpty) {
                  return Center(
                    child: Text(
                      'Nenhuma transação ainda.',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  );
                }

                final ultimasTransacoes = lista.reversed.take(5).toList();

                return ListView.builder(
                  itemCount: ultimasTransacoes.length,
                  itemBuilder: (context, index) {
                    final transacao = ultimasTransacoes[index];
                    return Card(
                      color: Colors.grey[850],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: Icon(
                          transacao.entrada
                              ? Icons.arrow_downward
                              : Icons.arrow_upward,
                          color: transacao.entrada ? Colors.green : Colors.red,
                        ),
                        title: Text(
                          transacao.descricao,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${transacao.data.day.toString().padLeft(2, '0')}/${transacao.data.month.toString().padLeft(2, '0')}/${transacao.data.year}',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        trailing: Text(
                          'R\$ ${transacao.valor.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: transacao.entrada ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
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