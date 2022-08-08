// import 'dart:developer';

// import 'models/football.dart';
// import 'package:dio/dio.dart';
// import 'dart:async';

// Future<List<Football>> fetchData(String season) async {
//   List<Football> lstFootball = [];
//   var apiStanding =
//       'https://api-football-standings.azharimm.site/leagues/eng.1/standings?season=$season';
//   try {
//     var response = await Dio().get(apiStanding);
//     var fbs = Football.fromJson(response.data);
//     lstFootball.add(fbs);
//     return lstFootball;
//   } 
//   on DioError catch (e) {
//     log(e.message);
//     throw Exception(e.message);
//   }
// }