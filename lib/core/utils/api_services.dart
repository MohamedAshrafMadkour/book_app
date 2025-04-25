import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  ApiServices(this.dio);
  Future<Map<String, dynamic>> get({required String endPoints}) async {
    var response = await dio.get('$_baseUrl$endPoints');
    return response.data;
  }
}
