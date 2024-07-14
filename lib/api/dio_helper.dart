// ignore_for_file: non_constant_identifier_names, dead_code, avoid_print, deprecated_member_use

import 'dart:convert';
import 'dart:typed_data';
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
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) {
              return true;
              return status! < 500;
            }));
  }

  static Future<Response> tips(
      {required String description, required int category_id}) async {
    return await dio.post(
      'addadvice',
      queryParameters: {'description': description, 'category_id': category_id},
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> deits({
    required String time,
    required int day_id,
    required String description,
    required Uint8List image,
  }) async {
    String base64Image = base64Encode(image);

    return await dio.post(
      'addrecipe',
      data: {
        'time': time,
        'day_id': day_id,
        'description': description,
        'image': base64Image, // Send the image as a base64 string
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: true,
        validateStatus: (status) {
          print('the status is $status');
          return true;
        },
      ),
    );
  }

  static Future<Response> userdetal(int id) async {
    return await dio.get(
      'userdetal',
      queryParameters: {'id': id},
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> numuser() async {
    return await dio.get(
      'numuser',
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
          return status! < 500;
        },
      ),
    );
  }
}
