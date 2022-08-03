import 'team.dart';


class Standing {
  final Team team;
  final List<Stats>? stats;
  final Note? note;

  Standing({required this.team, required this.stats, required this.note});

  factory Standing.fromJson(Map<String, dynamic> json) {
    List<dynamic> listStats = json['stats'];
    return Standing(
      team: Team.fromJson(json['team']),
      note: json['note'] != null ? Note.fromJson(json['note']) : null,
      stats: listStats.map<Stats>((item) => Stats.fromJson(item)).toList(),
    );
  }
}
class Stats {
  final String name;
  final dynamic value;
  Stats({required this.name, required this.value});

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(name: json['name'], value: json['value']);
  }
}

class Note {
  final int rank;
  Note({required this.rank});

  factory Note.fromJson(Map<String, dynamic> json) {
    return (Note(rank: json['rank']));
  }
}
