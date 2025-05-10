import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../globals.dart';

// Adicione as variáveis globais ou de outra parte do código onde estão definidas

ValueNotifier<List<Transacao>> historicoTransacoes = ValueNotifier([]);

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController _contaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  void _realizarTransferencia() {
  final conta = _contaController.text;
  final valorTexto = _valorController.text;
  final valor = double.tryParse(valorTexto);

  if (conta.isNotEmpty && valor != null) {
    if (saldoUsuario.value >= valor) {
      saldoUsuario.value -= valor;

      // Atualizando o histórico de transações
      historicoTransacoes.value = [
        ...historicoTransacoes.value,
        Transacao(
          descricao: 'Transferência para conta $conta',
          valor: valor,
          data: DateTime.now(),
          entrada: false,
        ),
      ];

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transferido R\$ ${valor.toStringAsFixed(2)} para conta $conta')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saldo insuficiente!')),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Preencha os campos corretamente!')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferência'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _contaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Conta destino'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),

              onSubmitted: (_) {
                _realizarTransferencia();
              }
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _realizarTransferencia,
              child: Text('Confirmar Transferência'),
            ),
          ],
        ),
      ),
    );
  }
}

// Classe de Transação (precisa estar definida em algum lugar do seu código)
class Transacao {
  final String descricao;
  final double valor;
  final DateTime data;
  final bool entrada;

  Transacao({
    required this.descricao,
    required this.valor,
    required this.data,
    required this.entrada,
  });
}