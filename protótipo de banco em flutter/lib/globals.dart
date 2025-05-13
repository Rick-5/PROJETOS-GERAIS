import 'package:flutter/material.dart';
import 'models/transacaopage.dart';

// Variáveis globais
ValueNotifier<double> saldoUsuario = ValueNotifier(5234.78);
ValueNotifier<ThemeMode> temaAtual = ValueNotifier(ThemeMode.system);
ValueNotifier<List<Transacao>> historicoTransacoes = ValueNotifier([]);
