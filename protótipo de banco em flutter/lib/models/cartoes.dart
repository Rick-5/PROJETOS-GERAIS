class Cartao {
  final String id;
  final String nome;
  final String numero;
  final double limite;
  final double saldoAtual;
  bool bloqueado;

  Cartao({
    required this.id,
    required this.nome,
    required this.numero,
    required this.limite,
    required this.saldoAtual,
    this.bloqueado = false,
  });

  void alterarStatusBloqueio() {
    bloqueado = !bloqueado;
  }
}
