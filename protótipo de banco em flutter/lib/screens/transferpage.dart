import 'package:flutter/material.dart';
import '../globals.dart'; // Usa saldoUsuario e historicoTransacoes globais
import '../models/transacaopage.dart'; // Classe Transacao importada corretamente

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
              onSubmitted: (_) => _realizarTransferencia(),
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