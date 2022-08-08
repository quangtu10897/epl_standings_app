import 'dart:developer';
import 'package:bloc2/dio/endpoint.dart';
import 'package:dio/dio.dart';
import '../models/football.dart';

class DioClient {
  late final Dio _dio;
  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: EndPoint.baseUrl,
          connectTimeout: EndPoint.connectionTimeout,
          receiveTimeout: EndPoint.receiveTimeout,
        ));

  Future<List<Football>> fetchData(String season) async {
    List<Football> lstFootball = [];
    try {
      var response = await _dio.get(season);
      var fbs = Football.fromJson(response.data);
      lstFootball.add(fbs);
      return lstFootball;
    } on DioError catch (e) {
      log(e.message);
      throw Exception(e.message);
    }
  }
}
