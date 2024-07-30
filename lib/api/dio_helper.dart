// ignore_for_file: non_constant_identifier_names, dead_code, avoid_print, deprecated_member_use, avoid_web_libraries_in_flutter

import 'dart:html' as html;
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

    // Use FileReader to read the file content
    final reader = html.FileReader();
    reader.readAsArrayBuffer(image);

    // Ensure file reading completes
    await reader.onLoadEnd.first;

    // Check if the reader.result is valid
    if (reader.result == null) {
      print("Error: File reading failed, result is null");
      throw Exception("File reading failed, result is null");
    }

    // Convert reader.result to List<int>
    final fileBytes = (reader.result as List<int>).toList();
    print("File read successfully: ${fileBytes.length} bytes");

    // Add image to form data
    formData.files.add(MapEntry(
      'image',
      MultipartFile.fromBytes(
        fileBytes, // Pass the file content as bytes
        filename: image.name,
      ),
    ));

    print("FormData fields: ${formData.fields}");
    print("FormData files: ${formData.files}");

    try {
      print('IN REQUEST_________________');
      final response = await dio.post(
        'addrecipe',
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
          followRedirects: true,
          validateStatus: (status) {
            print('the status is $status');
            return status! < 500;
          },
        ),
      );

      print("Response received: ${response.statusCode} ${response.data}");
      return response;
    } catch (e) {
      print('Error sending request: $e');
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
