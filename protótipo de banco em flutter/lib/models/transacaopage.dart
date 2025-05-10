class Transacao {
  final String descricao;
  final double valor;
  final DateTime data;
  final bool entrada;

  Transacao({
    required this.descricao,
    required this.valor,
    required this.data,
    required this.entrada,
  });
}
