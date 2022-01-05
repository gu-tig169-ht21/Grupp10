class SnusAlternativ {
  final int pris;
  final String snusNamn;

  SnusAlternativ(this.pris, this.snusNamn);

  static List<SnusAlternativ> get allaDosor => [
        SnusAlternativ(20, 'General Classic Portion'),
        SnusAlternativ(30, 'Lundgrens Norrland'),
        SnusAlternativ(10, 'Ettan Original Portion'),
      ];
}
