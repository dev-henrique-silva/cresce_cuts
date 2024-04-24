enum DiscountsType {
  precificacao('Precificação'),
  percentual('Percentual'),
  levePague('Leve pague');

  const DiscountsType(this.texto);
  final String texto;
}
