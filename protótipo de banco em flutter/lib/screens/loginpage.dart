import 'package:flutter/material.dart';
import 'welcomepage.dart'; // Importa a tela Welcome

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _login() {
    String usuario = _usuarioController.text;
    String senha = _senhaController.text;

    if (usuario == 'usuario' && senha == '12345') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } else {
      _mostrarErro('Usuário ou senha inválidos');
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
      appBar: AppBar(
        title: Text(
          'Banco Virtual',
          style: TextStyle(color: Colors.yellow[700]),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
            controller: _usuarioController,
            decoration: InputDecoration(
              labelText: 'Usuário',
              labelStyle: TextStyle(color: Colors.yellow),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow, width: 1),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            ),
            onEditingComplete: () {
              FocusScope.of(context).nextFocus(); // Para alternar para o próximo campo ao pressionar Enter
            },
          ),
            SizedBox(height: 16),
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
                contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              ),
              onSubmitted: (_) => _login(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0, // Remove o contorno
              ),
            ),
          ],
        ),
      ),
    );
  }
}