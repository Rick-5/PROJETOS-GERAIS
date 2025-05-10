import 'package:flutter/material.dart';
import 'screens/loginpage.dart';
import 'package:flutter/foundation.dart';
import 'globals.dart';
import 'screens/saldo.dart'; // Importar a tela de saldo

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: temaAtual,
      builder: (context, modo, _) {
        return MaterialApp(
          title: 'Banco Virtual',
          themeMode: modo,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.yellow,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(color: Colors.yellow[700]),
            textTheme: TextTheme(
              titleLarge: TextStyle(
                color: Colors.grey[900],
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: TextStyle(color: Colors.grey[800]),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              filled: true,
              fillColor: Colors.yellow[100],
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.grey,
            scaffoldBackgroundColor: Colors.grey[900],
            appBarTheme: AppBarTheme(color: Colors.grey[850]),
            textTheme: TextTheme(
              titleLarge: TextStyle(
                color: Colors.grey[100],
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: TextStyle(color: Colors.white),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[800],
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              filled: true,
              fillColor: Colors.grey[800],
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          home: LoginPage(),
          routes: {
            '/login': (context) => LoginPage(),
            '/saldo': (context) => SaldoPage(),  // Adiciona a rota da tela de saldo
            // Adicione outras rotas conforme necessário, como '/transferencia', etc.
          },
        );
      },
    );
  }
}