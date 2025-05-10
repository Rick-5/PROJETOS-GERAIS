import 'package:flutter/material.dart';
import 'dart:math';

class SimuladorPage extends StatefulWidget {
  @override
  _SimuladorPageState createState() => _SimuladorPageState();
}

class _SimuladorPageState extends State<SimuladorPage> {
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _prazoController = TextEditingController();

  String _tipoInvestimento = 'Poupança';
  String _resultado = '';

  // Taxas fictícias mensais para o simulador
  final Map<String, double> _taxas = {
    'Poupança': 0.005,         // 0.5% ao mês
    'CDB': 0.011,              // 1.1% ao mês
    'Tesouro Direto': 0.009,   // 0.9% ao mês
  };

  void _simularInvestimento() {
    final double? valor = double.tryParse(_valorController.text);
    final int? meses = int.tryParse(_prazoController.text);

    if (valor == null || meses == null || valor <= 0 || meses <= 0) {
      setState(() {
        _resultado = 'Por favor, insira valores válidos.';
      });
      return;
    }

    final double taxa = _taxas[_tipoInvestimento]!;
    final double montante = valor * pow((1 + taxa), meses);
    final double rendimento = montante - valor;

    setState(() {
      _resultado =
          'Valor investido: R\$ ${valor.toStringAsFixed(2)}\n'
          'Tipo: $_tipoInvestimento\n'
          'Prazo: $meses meses\n\n'
          'Retorno estimado: R\$ ${montante.toStringAsFixed(2)}\n'
          'Rendimento: R\$ ${rendimento.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulador de Investimentos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor a investir (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _prazoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Prazo (em meses)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _tipoInvestimento,
              items: _taxas.keys.map((tipo) {
                return DropdownMenuItem(
                  value: tipo,
                  child: Text(tipo),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _tipoInvestimento = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Tipo de Investimento',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _simularInvestimento,
              child: Text('Simular'),
            ),
            SizedBox(height: 30),
            Text(
              _resultado,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}