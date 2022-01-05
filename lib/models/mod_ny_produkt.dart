class SnusAlternativ {
  final int pris;
  final String snusNamn;

  SnusAlternativ(this.pris, this.snusNamn);

  static List<SnusAlternativ> get allaDosor => [
        SnusAlternativ(48, 'General Classic Portion'),
        SnusAlternativ(34, 'Lundgrens Norrland'),
        SnusAlternativ(34, 'XR Göteborgs Rapé White'),
        SnusAlternativ(31, 'Knox White Portion'),
        SnusAlternativ(43, 'Lyft Slim Ice Cool'),
      ];
}
