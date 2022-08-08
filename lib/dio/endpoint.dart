class EndPoint {
  EndPoint._();

  static const String baseUrl =
      'https://api-football-standings.azharimm.site/leagues/eng.1/standings?season=';
  static const int receiveTimeout = 5000;

  static const int connectionTimeout = 3000;
}
