import 'package:dio/dio.dart';

class ApiService{
  final baseUrl ="https://www.googleapis.com/books/v1/";
 final  Dio dio;

  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint})async {
    print('response $baseUrl$endPoint');

    var response = await dio.get('$baseUrl$endPoint');
    print('response $baseUrl$endPoint');
    return response.data;
  }
}