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
  String? _resultado;

  final Map<String, double> _taxas = {
    'Poupança': 0.005,
    'CDB': 0.011,
    'Tesouro Direto': 0.009,
  };

  void _simularInvestimento() {
    final double? valor = double.tryParse(_valorController.text);
    final int? meses = int.tryParse(_prazoController.text);

    if (valor == null || meses == null || valor <= 0 || meses <= 0) {
      setState(() {
        _resultado = '⚠️ Por favor, insira valores válidos.';
      });
      return;
    }

    final double taxa = _taxas[_tipoInvestimento]!;
    final double montante = valor * pow((1 + taxa), meses);
    final double rendimento = montante - valor;

    setState(() {
      _resultado = '''
💰 Valor investido: R\$ ${valor.toStringAsFixed(2)}
📈 Tipo: $_tipoInvestimento
🗓 Prazo: $meses meses

📊 Retorno estimado: R\$ ${montante.toStringAsFixed(2)}
📈 Rendimento: R\$ ${rendimento.toStringAsFixed(2)}
''';
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Preencha os dados abaixo para simular seu investimento.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),

            // Valor
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor a investir (R\$)',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Prazo
            TextField(
              controller: _prazoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Prazo (em meses)',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Tipo de investimento
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
                prefixIcon: Icon(Icons.trending_up),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            // Botão
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _simularInvestimento,
                icon: Icon(Icons.play_arrow),
                label: Text('Simular'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Resultado
            if (_resultado != null)
              Card(
                elevation: 4,
                margin: EdgeInsets.only(top: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _resultado!,
                    style: TextStyle(fontSize: 16, color: Colors.green[900]),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
