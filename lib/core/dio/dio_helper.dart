import 'package:dio/dio.dart';
import '../../features/data/datasources/post_remote_data_source.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> getData({required String url}) async {
    return await dio!.get(url);
  }

  static Future<Response> postData(
      {required String url, required Map<String, dynamic> data}) async {
    return await dio!.post(url, data: data);
  }
}
