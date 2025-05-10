import 'package:flutter/material.dart';
import '../globals.dart'; // Importa o historicoTransacoes correto
import '../models/transacaopage.dart'; // Classe Transacao

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({super.key});

  String _formatarData(DateTime data) {
    final dia = data.day.toString().padLeft(2, '0');
    final mes = data.month.toString().padLeft(2, '0');
    final ano = data.year;
    return '$dia/$mes/$ano';
  }

  Icon _iconeTipoTransacao(bool entrada, String descricao) {
    if (descricao.toLowerCase().contains('transferência')) {
      return Icon(Icons.swap_horiz, color: Colors.orange[700]);
    } else if (entrada) {
      return Icon(Icons.arrow_downward, color: Colors.green[700]);
    } else {
      return Icon(Icons.arrow_upward, color: Colors.red[700]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Transações')),
      body: ValueListenableBuilder<List<Transacao>>(
        valueListenable: historicoTransacoes,
        builder: (context, lista, _) {
          if (lista.isEmpty) {
            return Center(child: Text('Nenhuma transação realizada.'));
          }

          return ListView.separated(
            itemCount: lista.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (context, index) {
              final transacao = lista[index];

              return ListTile(
                leading: _iconeTipoTransacao(transacao.entrada, transacao.descricao),
                title: Text(
                  transacao.descricao,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(_formatarData(transacao.data)),
                trailing: Text(
                  'R\$ ${transacao.valor.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: transacao.entrada ? Colors.green[700] : Colors.red[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}