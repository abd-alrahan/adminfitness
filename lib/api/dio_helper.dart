// ignore_for_file: non_constant_identifier_names, dead_code, avoid_print, deprecated_member_use, avoid_web_libraries_in_flutter

import 'dart:io';
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

  static Future<Response> showtips(int category_id) async {
    return await dio.get(
      'showadvice',
      queryParameters: {'category_id': category_id},
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

  static Future<Response> deletetip(int id) async {
    return await dio.post(
      'deleteadvice',
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

  static Future<Response> add_deits({
    required String time,
    required int day_id,
    required String description,
    required dynamic image,
  }) async {
    try {
      MultipartFile multipartFile;

      if (image is File) {
        multipartFile = await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last);
      } else if (image is Uint8List) {
        multipartFile =
            MultipartFile.fromBytes(image, filename: 'upload_image.jpg');
      } else {
        throw Exception('Invalid image type');
      }

      // Create form data
      FormData formData = FormData.fromMap({
        'time': time,
        'day_id': day_id,
        'description': description,
        'image': multipartFile,
      });

      print('Form Data: ${formData.fields}, ${formData.files}');

      // Send the POST request
      Response response = await dio.post(
        'addrecipe', // Replace with your actual backend URL
        data: formData,
        options: Options(
          headers: {'Accept': 'application/json'},
          followRedirects: true,
          validateStatus: (status) {
            print('The status is $status');
            return status! < 500;
          },
        ),
      );

      print('Response: ${response.data}');
      return response;
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
      } else {
        print('Error uploading image: $e');
      }
      rethrow;
    }
  }

  static Future<Response> show_deits({required int dayId}) async {
    try {
      Response response = await dio.get(
        'showrecipe',
        queryParameters: {'day_id': dayId},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
      } else {
        print('Error fetching diets: $e');
      }
      rethrow;
    }
  }

    static Future<Response> delete_deits({required int dayId , required int id}) async {
    try {
      Response response = await dio.post(
        'deleterecipe',
        queryParameters: {'day_id': dayId , 'id': id},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
      } else {
        print('Error fetching diets: $e');
      }
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
