import 'data.dart';

class Football {
  final Data data;

  Football({required this.data});

  factory Football.fromJson(Map<String, dynamic> json) {
    return Football(
      data: Data.fromJson(json['data']),
    );
  }
}
