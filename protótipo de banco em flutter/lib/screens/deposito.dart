import 'package:flutter/material.dart';
import '../globals.dart';
import '../models/transacaopage.dart';

class DepositoPage extends StatefulWidget {
  @override
  _DepositoPageState createState() => _DepositoPageState();
}

class _DepositoPageState extends State<DepositoPage> {
  final TextEditingController _valorController = TextEditingController();

  void _realizarDeposito() {
    final valorTexto = _valorController.text;
    final valor = double.tryParse(valorTexto);

    if (valor != null && valor > 0) {
      saldoUsuario.value += valor;

      historicoTransacoes.value = [
        ...historicoTransacoes.value,
        Transacao(
          descricao: 'Depósito realizado',
          valor: valor,
          data: DateTime.now(),
          entrada: true,
        ),
      ];

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Depósito de R\$ ${valor.toStringAsFixed(2)} realizado com sucesso!')),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Insira um valor válido!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Depósito')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor do depósito (R\$)'),
              onSubmitted: (_) => _realizarDeposito(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _realizarDeposito,
              child: Text('Confirmar Depósito'),
            ),
          ],
        ),
      ),
    );
  }
}