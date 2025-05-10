import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  final Map<String, String> dadosConta = {
    'Nome': 'João da Silva',
    'Conta': '123456-7',
    'Agência': '0001',
    'CPF': '123.456.789-00',
    'Tipo de Conta': 'Corrente',
    'E-mail': 'joao@email.com',
  };

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
          children: dadosConta.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.yellow[800]),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${entry.key}: ${entry.value}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}