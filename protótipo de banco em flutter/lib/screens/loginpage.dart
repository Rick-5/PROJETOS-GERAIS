import 'package:flutter/material.dart';
import 'welcomepage.dart'; // Importa a tela Welcome

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _senhaController = TextEditingController();

  void _login() {
    String senha = _senhaController.text;

    if (senha == '12345') { // Senha para passar o login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } else {
      _mostrarErro('Senha inválida');
    }
  }

  void _mostrarErro(String mensagem) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), // Ajusta a altura do AppBar
        child: AppBar(
          title: Text(
            'Banco Virtual',
            style: TextStyle(color: Colors.yellow[700]),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Saudação à esquerda
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Olá, usuário!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700],
                ),
              ),
            ),
            SizedBox(height: 20), // Espaço reduzido entre a saudação e o campo de senha

            // Campo de senha
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[700]!, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[700]!, width: 1),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12), // Menor altura
              ),
              onSubmitted: (_) => _login(),
            ),
            SizedBox(height: 16), // Espaçamento entre o campo de senha e o botão

            // Botão de login
            ElevatedButton(
              onPressed: _login,
              child: Text(
                'Entrar',
                style: TextStyle(fontSize: 18), // Aumenta o tamanho da fonte
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 30), // Mais compacto (altura 50)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0, // Remove o contorno
              ),
            ),
          ],
        ),
      ),
    );
  }
}