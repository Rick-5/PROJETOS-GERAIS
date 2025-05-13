import 'package:flutter/material.dart';

class CartoesPage extends StatelessWidget {
  final List<Map<String, String>> cartoes = [
    {'nome': 'Cartão Virtual', 'numero': '**** **** **** 1234', 'status': 'Ativo'},
    {'nome': 'Cartão Físico', 'numero': '**** **** **** 5678', 'status': 'Bloqueado'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Cartões'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cartoes.length,
          itemBuilder: (context, index) {
            final cartao = cartoes[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.credit_card, color: Colors.blue),
                title: Text(cartao['nome']!),
                subtitle: Text(cartao['numero']!),
                trailing: Chip(
                  label: Text(cartao['status']!),
                  backgroundColor: cartao['status'] == 'Ativo' ? Colors.green : Colors.red,
                ),
                onTap: () {
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
