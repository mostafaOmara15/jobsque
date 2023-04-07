import 'package:dio/dio.dart';
import '../../constants/end_points.dart';

class DioHelper {
  static Dio? dio;
  static String baseUrl = 'http://134.209.132.80/api/';

  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status)=> true,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          connectTimeout: 30000,
          sendTimeout: 3,
          receiveTimeout: 30000
      ),
    );
  }

  static Future<Response> postData(
    {
      required String endPoint,
      Map<String, dynamic>? data,
      String? token
    }
  ) async {
    dio!.options.headers = {
      'Content-Type': "application/json",
      'Authorization': "Bearer ${EndPoint.userToken}"
    };
    return await dio!.post(endPoint, data: data);
  }

  static Future<Response> getData(
    {required String endPoint,
        String? token,
        Map<String, dynamic>? header
    }
  ) async {
    dio!.options.headers = header ??
     {
       'Content-Type': 'application/json',
       'Authorization': "Bearer ${EndPoint.userToken}",
     };
    return await dio!.get(endPoint);
  }

  static Future<Response> putData(
      {
        required String endPoint,
        Map<String, dynamic>? data,
        String? token
      }
      ) async {
    dio!.options.headers = {
      'Content-Type': "application/json",
      'Authorization': "Bearer ${EndPoint.userToken}"
    };
    return await dio!.put(endPoint, data: data);
  }
}
