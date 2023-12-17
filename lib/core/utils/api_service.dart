import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';

  final Dio _dio;

  ApiService(this._dio);

  // static late Dio _dio;
  // static init() {
  //    _dio = Dio(
  //     BaseOptions(
  //       baseUrl:'https://www.googleapis.com/books/v1/',
  //         receiveDataWhenStatusError: true ,
  //         headers: {
  //           "Content-Type" : "application/json" ,
  //           "lang" : "en" ,
  //         }
  //     ),
  //   );
  // }

  Future<Map<String, dynamic>> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    var result = await _dio.get('$_baseUrl$endPoint', queryParameters: query);

    return result.data;
  }
}
