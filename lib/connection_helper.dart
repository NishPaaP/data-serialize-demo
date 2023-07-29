import 'package:dio/dio.dart';

class ConnectionHelper{
    Future<Response<dynamic>?> getApprovedTripDetailsList(String url) async {
    
    try {
      Dio _dio = Dio();
      var response = await _dio.get(url);
      print("-------------------------------------->${response}");
      return response;
    } on DioError catch (error) {
      return error.response;
    }
  }
}