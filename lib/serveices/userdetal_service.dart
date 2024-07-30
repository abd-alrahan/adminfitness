// ignore_for_file: deprecated_member_use, avoid_print

import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';
import 'package:dio/dio.dart';

class UserdetalService {
  static Future<List<UserModel>> fetchUsers(int id) async {
    try {
      var response = await DioHelper.userdetal(id);

      if (response.statusCode == 200 && response.data['data'].isNotEmpty) {
        // print('IN SERVICE________');
        // print(response.statusCode);
        // print(response.data);
        List<dynamic> data = response.data['data'];
        List<UserModel> users =
            data.map((userJson) => UserModel.fromJson(userJson)).toList();
        return users;
      } else {
        return [];
      }
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      return [];
    }
  }
}
