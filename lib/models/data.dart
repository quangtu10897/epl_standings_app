import 'standing.dart';

class Data {
  final String name;
  final int season;
  final List<Standing>? standings;

  Data({required this.name, required this.season, required this.standings});
  factory Data.fromJson(Map<String, dynamic> json) {
    List<dynamic> listStanding = json['standings'];

    return Data(
      name: json['name'],
      season: json['season'],
      standings: listStanding.map<Standing>((item) => Standing.fromJson(item)).toList(),
    );
  }
}
