import 'package:flutter/material.dart';
import '../globals.dart'; // saldoUsuario e historicoTransacoes
import '../models/transacaopage.dart';

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController _contaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  void _realizarTransferencia() {
    final conta = _contaController.text.trim();
    final valor = double.tryParse(_valorController.text.replaceAll(',', '.'));

    if (conta.isEmpty || valor == null || valor <= 0) {
      _mostrarMensagem('⚠️ Preencha os campos corretamente.');
      return;
    }

    if (saldoUsuario.value < valor) {
      _mostrarMensagem('❌ Saldo insuficiente!');
      return;
    }

    // Atualiza o saldo
    saldoUsuario.value -= valor;

    // Adiciona a transferência ao histórico
    historicoTransacoes.value = [
      ...historicoTransacoes.value,
      Transacao(
        descricao: 'Transferência para conta $conta',
        valor: valor,
        data: DateTime.now(),
        entrada: false,
      ),
    ];

    _mostrarMensagem('✅ R\$ ${valor.toStringAsFixed(2)} transferidos para conta $conta!');
    Navigator.pop(context);
  }

  void _mostrarMensagem(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferência'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Preencha os dados da conta de destino e o valor da transferência.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            TextField(
              controller: _contaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Conta destino',
                prefixIcon: Icon(Icons.account_balance),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: _valorController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _realizarTransferencia(),
            ),
            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _realizarTransferencia,
                icon: Icon(Icons.send),
                label: Text('Confirmar Transferência'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}