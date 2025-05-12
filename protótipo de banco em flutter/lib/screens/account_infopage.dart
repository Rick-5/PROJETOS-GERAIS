import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  final Map<String, String> dadosConta = {
    'Conta': '123456-7',
    'Agência': '0001',
    'CPF': '123.456.789-00',
    'Tipo de Conta': 'Corrente',
    'E-mail': 'joao@email.com',
  };

  final String nome = 'João da Silva';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados da Conta'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho com ícone e nome
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.yellow[700],
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    nome,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Cartões de dados
            Expanded(
              child: ListView(
                children: dadosConta.entries.map((entry) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.info_outline, color: Colors.yellow[800]),
                      title: Text(
                        entry.key,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(entry.value),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}