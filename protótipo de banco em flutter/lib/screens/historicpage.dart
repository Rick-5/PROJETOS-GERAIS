import 'package:flutter/material.dart';
import '../models/transacaopage.dart';
import 'package:flutter/foundation.dart';

// A variável 'historicoTransacoes' deve ser uma instância de ValueNotifier<List<Transacao>>
ValueNotifier<List<Transacao>> historicoTransacoes = ValueNotifier([]);

class HistoricoPage extends StatelessWidget {
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

    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        final transacao = lista[index];
        return ListTile(
          title: Text(transacao.descricao),
          subtitle: Text(
              '${transacao.data.toLocal().toString().split(' ')[0]} - ${transacao.entrada ? 'Entrada' : 'Saída'}'),
          trailing: Text('R\$ ${transacao.valor.toStringAsFixed(2)}'),
        );
      },
    );
  },
  ),
);
}
}