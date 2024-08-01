// ignore_for_file: non_constant_identifier_names, dead_code, avoid_print, deprecated_member_use, avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'dart:typed_data';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8000/api/',
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
  required html.File image,
}) async {
  final formData = FormData();

  formData.fields
    ..add(MapEntry('time', time))
    ..add(MapEntry('day_id', day_id.toString()))
    ..add(MapEntry('description', description));

  final reader = html.FileReader();
  reader.readAsArrayBuffer(image);
  await reader.onLoadEnd.first;

  if (reader.result == null) {
    throw Exception("File reading failed, result is null");
  }

  final fileBytes = (reader.result as Uint8List).toList();

  formData.files.add(MapEntry(
    'image',
    MultipartFile.fromBytes(
      fileBytes,
      filename: image.name,
    ),
  ));

  try {
    final response = await dio.post(
      'addrecipe',
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  } catch (e) {
    rethrow;
  }
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

  static Future<Response> deleteuser(int id) async {
    return await dio.post(
      'deleteuser',
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
}
