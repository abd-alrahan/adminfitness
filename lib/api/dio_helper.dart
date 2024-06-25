// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
   static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8000/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> login(
      {required String email, required String password}) async {
    return await dio.post('admin/login',
        data: {'email': email, 'password': password},
        options: Options(
            // headers: {
            //   "Access-Control-Allow-Origin": "*",
            //   "Access-Control-Allow-Credentials": true,
            // },
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }

    static Future<Response> tips(
      {required String description, required int category_id}) async {
    return await dio.post('admin/addadvice',
        data: {'description': description, 'category_id': category_id},
        options: Options(
            // headers: {
            //   "Access-Control-Allow-Origin": "*",
            //   "Access-Control-Allow-Credentials": true,
            // },
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }

}
