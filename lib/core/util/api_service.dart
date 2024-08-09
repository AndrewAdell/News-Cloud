import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  final String baseUrl = 'https://newsapi.org/v2/';
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response response = await dio.get('$baseUrl$endpoint');

    return response.data;
  }
}
