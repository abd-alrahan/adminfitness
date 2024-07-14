// ignore_for_file: deprecated_member_use, avoid_print

import 'package:adminfitness/api/dio_helper.dart';
import 'package:adminfitness/models/models.dart';
import 'package:dio/dio.dart';

class NumuserService {
  static Future<int> fetchUserCount() async {
    try {
      var response = await DioHelper.numuser();
      if (response.statusCode == 200 && response.data != null) {
        print(' IN CONTROLLER TE COUNT IS');
        print(response.data);
        NumuserModel numuser = NumuserModel.fromJson(response.data);
        return numuser.count;
      } else {
        print(
            'Error: Failed to fetch user count with status code: ${response.statusCode}');
        return 0;
      }
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      return 0;
    }
  }
}
